package types;

using util.NullTools;

import types.base.Symbol;
import types.base.Context;

class LitWord extends Symbol {
	override public function getKind() return ValueKind.KLitWord(this);
	
	override function copyWith(?context: Context, ?offset: Int): LitWord {
		return new LitWord(this.name, context.getOrElse(this.context), offset);
	}
}