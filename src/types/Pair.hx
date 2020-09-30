package types;

class Pair extends Value {
	public var x: Int;
	public var y: Int;

	public function new(x: Int, y: Int) {
		this.x = x;
		this.y = y;
	}

	override public function getKind() return ValueKind.KPair(this);
}