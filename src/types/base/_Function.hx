package types.base;

using util.ArrayTools;

@:structInit class _Refine {
	public final name: std.String;
	public final doc: Null<std.String> = null;
	public final args: Array<_Arg> = [];
}

@:structInit class _Arg {
	public final name: std.String;
	public final spec: Null<Block> = null;
	public final doc: Null<std.String> = null;
}

/*abstract class _Function extends Value {
	public final args: Array<_Arg>;
	public final refines: Array<_Refine>;
	public final returnSpec: Null<Block>;
}*/
class _Function extends Value {
	public var args: Array<_Arg>;
	public var refines: Array<_Refine>;
	public var retSpec: Null<Block>;

	public var arity(get, never): Int;
	inline function get_arity() return this.args.length;

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