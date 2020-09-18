package types;

using util.NullTools;

import types.base.Symbol;
import types.base.Context;

class GetWord extends Symbol {
	override public function typeOf() return ValueKind.KGetWord;

	override function copyWith(?context: Context, ?offset: Int): GetWord {
		return new GetWord(this.name, context.getOrElse(this.context), offset);
	}
}