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

	public function equalsString(str: std.String, ignoreCase = true) {
		return ignoreCase
			? this.name.toLowerCase() == str.toLowerCase()
			: this.name == str;
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

	public function setValue(value: Value) {
		return if(context.containsSymbol(this)) {
			context.setSymbol(this, value);
		} else {
			context.addSymbol(this, value);
			value;
		}
	}
}