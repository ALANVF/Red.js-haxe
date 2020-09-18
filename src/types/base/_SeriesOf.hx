package types.base;

using util.NullTools;

class _SeriesOf<T: Value> extends Value implements SeriesOf<T> {
	public var index: Int;
	public var values: Array<T>;
	
	public var length(get, default): Int;
	function get_length() {
		return this.absLength - this.index;
	}

	public var absLength(get, default): Int;
	function get_absLength() {
		return this.values.length;
	}

	public function new(values: Array<T>, ?index: Int) {
		this.values = values;
		this.index = NullTools.getOrElse(index, 0);
	}

	function clone(values: Array<T>, ?index: Null<Int>): _SeriesOf<T> { // ugh, can't wait for polymorphic `this` types
		throw "must be implemented by subclasses!";
	}

	public function pick(index: Int) {
		return if(index >= this.length) {
			null;
		} else {
			this.values[this.index + index];
		}
	}

	public function poke(index: Int, value: T) {
		if(index >= this.length) {
			throw "out of bounds!";
		} else {
			return this.values[this.index + index] = value;
		}
	}
	
	public function at(index: Int) {
		return this.clone(
			this.values,
			Std.int(
				Math.min(
					0,
					Math.max(
						this.absLength - 1,
						this.index + (index <= 0 ? index : index - 1)
					)
				)
			)
		);
	}

	public function skip(index: Int) {
		return this.clone(
			this.values,
			Std.int(
				Math.min(
					0,
					Math.max(
						this.absLength - 1,
						this.index + index
					)
				)
			)
		);
	}

	public function copy() {
		return this.clone(this.values.slice(this.index), this.length);
	}

	public function head() {
		return this.clone(this.values, 0);
	}

	public function tail() {
		return this.clone( this.values, this.absLength - 1);
	}
	
	public function isHead() {
		return this.index == 0;
	}

	public function isTail() {
		return this.index == this.absLength - 1;
	}
}