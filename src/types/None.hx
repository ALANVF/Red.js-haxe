package types;

class None extends Value {
	public static final NONE = new None();

	function new() {}

	override function isTruthy(): Bool {
		return false;
	}

	override public function getKind() return ValueKind.KNone(this);
}