package types;

using util.NullTools;

import types.base.Symbol;
import types.base.Context;

class Word extends Symbol {
	override function copyWith(?context: Context, ?offset: Int): Word {
		return new Word(this.name, context.getOrElse(this.context), offset);
	}

	override public function getKind() return ValueKind.KWord(this);
}