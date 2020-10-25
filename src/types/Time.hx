package types;

class Time extends Value {
	public var hours: Int;
	public var minutes: Int;
	public var seconds: StdTypes.Float;
	public var signed: Bool;

	public var sign(get, never): Int;
	function get_sign() return signed ? -1 : 1;
	
	public function new(hours: Int, minutes: Int, seconds: StdTypes.Float, signed: Bool = false) {
		this.hours = hours;
		this.minutes = minutes;
		this.seconds = seconds;
		this.signed = signed;
	}

	override public function getKind() return ValueKind.KTime(this);
}