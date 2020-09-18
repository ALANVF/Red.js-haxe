package types;

class Time extends Value {
	public var hours: Int;
	public var minutes: Int;
	public var seconds: StdTypes.Float;

	public function new(hours: Int, minutes: Int, seconds: StdTypes.Float) {
		this.hours = hours;
		this.minutes = minutes;
		this.seconds = seconds;
	}

	override public function typeOf() return ValueKind.KTime;
}