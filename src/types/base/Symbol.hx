package types.base;

using util.NullTools;

class Symbol extends Value {
	public final name: std.String;
	public var context: Context;
	public var offset: Int;

	public function new(name: std.String, ?context: Context, ?offset: Int) {
		this.name = name;
		this.context = context.getOrElse(Context.GLOBAL);
		this.offset = offset.getOrElse(this.context.symbols.length);
	}

	public function equalsString(str: std.String) {
		return this.name.toLowerCase() == str.toLowerCase();
	}

	public function equalsSymbol(sym: Symbol) {
		return this.name.toLowerCase() == sym.name.toLowerCase();
	}

	public function copyWith(?context: Context, ?offset: Int): Symbol {
		throw "must be implemented by subclasses!";
	}

	public function bindToContext(ctx: Context) {
		if(this.context != context) {
			switch ctx.offsetOf(this.name) {
				case -1:
				case offset:
					this.context = ctx;
					this.offset = offset;
			}
		}

		return this;
	}

	public function getValue(?optional: Bool = false) {
		switch this.context.getSymbol(this) {
			case Unset.UNSET if(!optional):
				throw 'Word `${this.name}` doesn\'t exist!';
			case value:
				return value;
		}
	}
}