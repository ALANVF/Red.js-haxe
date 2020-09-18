package types;

class None extends Value {
	public static final NONE = new None();

	function new() {}

	override function isTruthy(): Bool {
		return false;
	}

	override public function typeOf() return ValueKind.KNone;
}