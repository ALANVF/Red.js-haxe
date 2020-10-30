package types;

import types.base.IFunction;
import types.base._Function;

class Function extends _Function {
	public final body: Block;

	public function new(args: _Args, refines: _Refines, retSpec: Null<Block>, body: Block) {
		this.args = args;
		this.refines = refines;
		this.retSpec = retSpec;
		this.body = body;
	}
}