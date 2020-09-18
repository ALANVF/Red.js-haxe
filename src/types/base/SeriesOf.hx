package types.base;

interface SeriesOf<T> {
	public var index: Int;
	public var length(get, default): Int;
	public var absLength(get, default): Int;

	public function pick(index: Int): Null<T>;
	
	public function poke(index: Int, value: T): T;
	
	public function at(index: Int): SeriesOf<T>;
	
	public function skip(offset: Int): SeriesOf<T>;

	public function copy(): SeriesOf<T>;

	public function head(): SeriesOf<T>;

	public function tail(): SeriesOf<T>;

	public function isHead(): Bool;

	public function isTail(): Bool;
}