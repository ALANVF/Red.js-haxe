package types;

class Unset extends Value {
	public static final UNSET = new Unset();

	function new() {}

	/*override function isTruthy(): Bool {
		return false;
	}*/

	override public function getKind() return ValueKind.KUnset(this);
}