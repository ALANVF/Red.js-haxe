package runtime.natives;

import types.base.IGetPath;
import types.base.IFunction;
import types.base.IFunction.QuotingKind;
import haxe.ds.Option;
//import types.base.*;
import types.Value;
import types.SetWord;
import types.SetPath;
import types.Op;
import types.Path;
import types.ValueKind;

using util.NullTools;
using util.OptionTools;
using util.ArrayTools;
using types.Helpers;

// THING: https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#423-atomiccomposite-types

enum GroupedExpr {
	GValue(v: Value);
	GNoEval(v: Value);
	GSetWord(s: SetWord, e: GroupedExpr);
	GSetPath(s: SetPath, e: GroupedExpr);
	GOp(l: GroupedExpr, op: Op, r: GroupedExpr);
	GCall(f: IFunction, args: Array<GroupedExpr>, refines: Map<String, Array<GroupedExpr>>);
	GUnset;
}

class Do {
	static function _doesBecomeFunction(value: Value, values: Array<Value>) {
		return if((value is IFunction)) {
			Some({fn: cast(value, IFunction), rest: values});
		} else if((value is IGetPath) && values.length > 0) {
			switch cast(value, IGetPath).getPath(values.shift()) {
				case Some(v): _doesBecomeFunction(v, values);
				case None: None;
			}
		} else {
			None;
		}
	}

	static function doesBecomeFunction(path: Path) {
		return switch path.pick(0).map(v -> v.KIND) {
			case Some(KWord(_.getValue() => head)): _doesBecomeFunction(head, [for(v in path.skip(1)) v]);
			default: None;
		}
	}

	static function checkForOp(tokens: Array<ValueKind>) {
		return if(tokens.length >= 2) {
			switch tokens[0] {
				case KWord(_.getValue(true).KIND => KOp(o)): Some(o);
				case KPath(doesBecomeFunction(_) => Some({fn: _.KIND => KOp(o)})): Some(o);
				default: None;
			}
		} else {
			None;
		}
	}

	static inline function groupArgs(tokens: Array<ValueKind>, args: Array<_Arg>) {
		return [for(arg in args) groupNextExprForArg(tokens, arg)];
	}

	public static function groupNextExpr(tokens: Array<ValueKind>) {
		// look-ahead in case there's an op! after the value with a lit-word! or get-word! LHS
		if(tokens.length >= 3) {
			switch checkForOp(tokens.slice(1)) {
				case Some(o) if(o.args[0].quoting != QVal):
					final left = groupNextExprForArg(tokens, o.args[0]);
					tokens.shift();
					return GOp(left, o, groupNextExprForArg(tokens, o.args[0]));
				default:
			}
		}

		return switch tokens.shift().notNull() {
			case KSetWord(s): GSetWord(s, groupNextExpr(tokens));
			case KSetPath(s): GSetPath(s, groupNextExpr(tokens));
			case KWord(_.getValue() => _fn) if((_fn is IFunction)):
				final fn = cast(_fn, IFunction); // I want flow-typing :'(
				GCall(fn, groupArgs(tokens, fn.args), []);
			case KPath(doesBecomeFunction(_) => Some({fn: fn, rest: rest})):
				final args = groupArgs(tokens, fn.args);

				if(rest.length == 0) {
					GCall(fn, args, []);
				} else {
					final refines: Map<String, Array<GroupedExpr>> = [];

					for(value in rest) {
						switch value.KIND {
							case KWord(w):
								switch fn.refines.find(ref -> w.equalsString(ref.name)) {
									case null:
										throw 'Unknown refinement `/${w.name}`!';
									case {name: n} if(refines.exists(n)):
										throw 'Duplicate refinement `/${w.name}`!';
									case {name: n, args: args}:
										refines[n] = groupArgs(tokens, args);
								}
							default: throw "error!";
						}
					}

					GCall(fn, args, refines);
				}
			case _.getValue() => v:
				switch checkForOp(tokens) {
					case Some(o):
						tokens.shift();
						GOp(GValue(v), o, groupNextExprForArg(tokens, o.args[1]));
					case None:
						GValue(v);
				}
		}
	}

	public static function groupNextExprForArg(tokens: Array<ValueKind>, arg: _Arg) {
		return switch arg.quoting {
			case QVal: groupNextExpr(tokens);
			case QGet if(tokens.length == 0): GUnset;
			case QGet: GNoEval(tokens.shift().notNull().getValue());
			case QLit:
				final k = tokens.shift().notNull();
				final v = k.getValue();
				if(k.match(KParen(_) | KGetWord(_) | KGetPath(_))) { // That's a bruh moment
					GValue(v);
				} else {
					GNoEval(v);
				}
		}
	}
}