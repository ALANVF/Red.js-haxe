package types.base;

using util.ArrayTools;

import types.base.IFunction;

/*abstract class _Function extends Value {
	public final args: _Args;
	public final refines: _Refines;
	public final returnSpec: Null<Block>;
}*/
class _Function extends Value implements IFunction {
	var _args: _Args;
	public var args(get, set): _Args;
	function get_args() return _args;
	function set_args(v: _Args) return _args = v;
	
	var _refines: _Refines;
	public var refines(get, set): _Refines;
	function get_refines() return _refines;
	function set_refines(v: _Refines) return _refines = v;

	var _retSpec: Null<Block>;
	public var retSpec(get, set): Null<Block>;
	function get_retSpec() return _retSpec;
	function set_retSpec(v: Null<Block>) return _retSpec = v;

	public var arity(get, never): Int;
	function get_arity() return this.args.length;

	public function arityWithRefines(refines: Iterable<std.String>) {
		var nargs = this.arity;
		
		for(refine in refines) {
			final name = refine.toLowerCase();
			switch this.refines.find(r -> r.name.toLowerCase() == name) {
				case null: throw "Error!";
				case {args: args}: nargs += args.length;
				case _:
			}
		}

		return nargs;
	}
}