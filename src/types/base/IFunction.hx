package types.base;

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

typedef _Refines = Array<_Refine>;

typedef _Args = Array<_Arg>;

interface IFunction extends IValue {
	public var args(get, set): _Args;
	public var refines(get, set): _Refines;
	public var retSpec(get, set): Null<Block>;
	public var arity(get, never): Int;

	public function arityWithRefines(refines: Iterable<std.String>): Int;
}