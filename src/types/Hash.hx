package types;

import types.base._Block;
import util.Set;

class Hash extends _Block {
	override public function getKind() return ValueKind.KHash(this);
	
	override inline function cloneBlock(values: Array<Value>, ?index: Int, ?newlines: Set<Int>) {
		return new Hash(values, index, newlines);
	}
}