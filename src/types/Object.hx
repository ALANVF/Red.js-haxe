package types;

import types.base.IGetPath;
import types.base.Context;
import haxe.ds.Option;

using util.NullTools;

class Object extends Value implements IGetPath {
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

	public function getPath(access: Value) {
		return switch access.KIND {
			case KWord(w) if(ctx.containsSymbol(w)): Some(ctx.getSymbol(w));
			case KLitWord(w) if(ctx.containsSymbol(w)): Some(ctx.getSymbol(w));
			default: None;
		};
	}
}