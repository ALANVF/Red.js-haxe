package runtime.natives;

import types.base.Symbol;
import types.Block;
import types.base.IFunction;
import haxe.ds.Option;

using util.OptionTools;
using util.EnumValueTools;

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
				spec.pick(0).attempt(Some(_.KIND => KWord((_ : Symbol) => w) | KGetWord(w) | KLitWord(w)), {
					spec = spec.skip(1);

					args.push({
						name: w.name,
						quoting: switch w.TYPE_KIND {
							case DWord:    QVal;
							case DGetWord: QGet;
							default:       QLit;
						},
						spec: spec.pick(0).extractMap(_.KIND => KBlock(b), {
							spec = spec.skip(1);
							b.copy();
						}),
						doc: spec.pick(0).extractMap(_.KIND => KString(s), {
							spec = spec.skip(1);
							s.form();
						})
					});
				}, break);
			}
		}

		inline function getRet() {
			spec.pick(0).extractIter(_.KIND => KSetWord(_.equalsString("return") => true), {
				spec = spec.skip(1);
				spec.pick(0).extract(Some(_.KIND => KBlock(b)), {
					spec = spec.skip(1);
					res.ret = Some(b.copy());
				}, "Missing return spec!");
			});
		}
		
		spec.pick(0).extractIter(_.KIND => KString(s), {
			res.doc = Some(s.form());
			spec = spec.skip(1);
		});

		getArgs(res.args);

		getRet();

		while(true) {
			spec.pick(0).extractIter(_.KIND => KRefinement(r), {
				spec = spec.skip(1);
				
				final refine: _Refine = {
					name: r.name,
					doc: spec.pick(0).extractMap(_.KIND => KString(s), {
						spec = spec.skip(1);
						s.form();
					})
				};

				getArgs(refine.args);

				res.refines.push(refine);
			});
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