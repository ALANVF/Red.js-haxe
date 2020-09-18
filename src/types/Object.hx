package types;

using util.NullTools;

import types.base.Context;

class Object extends Value {
	public static var maxID: Int = 0;

	public final ctx: Context;
	public final id: Int;

	public function new(?ctx: Context, ?id: Int) {
		this.ctx = if(ctx == null) new Context() else new Context(ctx.symbols, ctx.values);
		this.id = id.getOrElse(++maxID);
	}

	public static inline function fromObject(obj: Object) {
		return new Object(obj.ctx, obj.id);
	}
}