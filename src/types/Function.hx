package types;

import types.base._Function;

class Function extends _Function {
	public final body: Block;

	public function new(args: Array<_Arg>, refines: Array<_Refine>, retSpec: Null<Block>, body: Block) {
		this.args = args;
		this.refines = refines;
		this.retSpec = retSpec;
		this.body = body;
	}

	override public function getKind() return ValueKind.KFunction(this);
}