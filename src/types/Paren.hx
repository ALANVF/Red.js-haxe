package types;

import types.base._Block;
import util.Set;

class Paren extends _Block {
	override public function getKind() return ValueKind.KParen(this);

	override inline function cloneBlock(values: Array<Value>, ?index: Int, ?newlines: Set<Int>) {
		return new Paren(values, index, newlines);
	}
}