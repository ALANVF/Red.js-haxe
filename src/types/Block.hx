package types;

import types.base._Block;
import util.Set;

class Block extends _Block {
	override public function getKind() return ValueKind.KBlock(this);

	override inline function cloneBlock(values: Array<Value>, ?index: Int, ?newlines: Set<Int>) {
		return new Block(values, index, newlines);
	}
}