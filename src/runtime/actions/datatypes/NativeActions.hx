package runtime.actions.datatypes;

import types.Block;
import types.Native;
import types.Value;
import haxe.ds.Option;

using util.OptionTools;

class NativeActions extends ValueActions {
	public function _makeSpec(spec: Block) {
		switch spec.pick(0) {
			case Some(_.KIND => KBlock(b)):
				return runtime.natives.Func.parseSpec(b);
			default:
				throw "Invalid spec!";
		}
	}

	override public function make(_: Option<Value>, spec: Value): Native {
		return switch spec.KIND {
			case KBlock(b):
				switch [for(v in b) b.KIND] {
					case [KBlock(b), KIssue(_.name => "get-definition"), KWord(_.name => name)]:
						switch this._makeSpec(b) {
							case {doc: doc, args: args, refines: refines, ret: ret}:
								return new Native(
									doc,
									args,
									refines,
									ret,
									switch name {
										case "NAT_IF": NIf(runtime.natives.If.call);
										case "NAT_UNLESS": NUnless(runtime.natives.Unless.call);
										case "NAT_EITHER": NEither(runtime.natives.Either.call);
										case "NAT_DO": NDo(runtime.natives.Do.call);
										case "NAT_TRANSCODE": NTranscode(runtime.natives.Transcode.call);
										default: throw "NYI";
									}
								);
						}
					default:
						throw "Invalid spec!";
				}
			default: throw "error!";
		}
	}
}