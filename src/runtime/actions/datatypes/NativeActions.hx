package runtime.actions.datatypes;

import types.Block;
import types.Native;
import types.Value;
import haxe.ds.Option;
import Util.match;

using util.OptionTools;
using util.EnumValueTools;

class NativeActions extends ValueActions {
	public function _makeSpec(spec: Block) {
		return spec.pick(0).extract(Some(_.KIND => KBlock(b)),
			runtime.natives.Func.parseSpec(b),
			"Invalid spec!"
		);
	}

	override public function make(_: Option<Value>, spec: Value): Native {
		return spec.KIND.extract(KBlock(b),
			match([for(v in b) b.KIND], [KBlock(b), KIssue(_.name => "get-definition"), KWord(_.name => name)],
				match(this._makeSpec(b), {doc: doc, args: args, refines: refines, ret: ret},
					new Native(
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
					)
				),
				throw "Invalid spec!"
			)
		);
	}
}