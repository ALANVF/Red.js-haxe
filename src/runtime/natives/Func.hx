package runtime.natives;

import types.base.Symbol;
import types.Block;
import types.base.IFunction;
import haxe.ds.Option;

using util.OptionTools;

class Func {
	public static function parseSpec(spec: Block) {
		final res = {
			doc: None,
			args: [],
			refines: [],
			ret: None
		};

		inline function getArgs(args: _Args) {
			while(true) {
				switch spec.pick(0) {
					case Some(_.KIND => KWord((_ : Symbol) => w) | KGetWord(w) | KLitWord(w)):
						spec = spec.skip(1);

						args.push({
							name: w.name,
							quoting: switch w.TYPE_KIND {
								case DWord:    QVal;
								case DGetWord: QGet;
								default:       QLit;
							},
							spec: switch spec.pick(0) {
								case Some(_.KIND => KBlock(b)):
									spec = spec.skip(1);
									Some(b.copy());
								default:
									None;
							},
							doc: switch spec.pick(0) {
								case Some(_.KIND => KString(s)):
									spec = spec.skip(1);
									Some(s.form());
								default:
									None;
							}
						});
					default: break;
				}
			}
		}

		inline function getRet() {
			switch spec.pick(0) {
				case Some(_.KIND => KSetWord(_.equalsString("return") => true)):
					spec = spec.skip(1);
	
					switch spec.pick(0) {
						case Some(_.KIND => KBlock(b)):
							spec = spec.skip(1);
							res.ret = Some(b.copy());
						default:
							throw "Missing return spec!";
					}
				default:
			}
		}
		
		switch spec.pick(0) {
			case Some(_.KIND => KString(s)):
				res.doc = Some(s.form());
				spec = spec.skip(1);
			default:
		}

		getArgs(res.args);

		getRet();

		while(true) {
			switch spec.pick(0) {
				case Some(_.KIND => KRefinement(r)):
					spec = spec.skip(1);

					final refine: _Refine = {
						name: r.name,
						doc: switch spec.pick(0) {
							case Some(_.KIND => KString(s)):
								spec = spec.skip(1);
								Some(s.form());
							default:
								None;
						}
					};
					
					getArgs(refine.args);

					res.refines.push(refine);
				default:
			}
		}

		if(res.ret == None) {
			getRet();
		}

		if(spec.length != 0) {
			throw "Invalid function spec!";
		}

		return res;
	}
}