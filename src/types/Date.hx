package types;

using DateTools;

class Date extends Value {
	public var repr: std.Date;
	public var zone: Time;
	
	public var date(get, never): Date;
	function get_date() {
		return new Date(new std.Date(year, month, day, 0, 0, 0));
	}

	public var year(get, never): Int;
	inline function get_year() return repr.getFullYear();

	public var month(get, never): Int;
	inline function get_month() return repr.getMonth() + 1;

	public var day(get, never): Int;
	inline function get_day() return repr.getDate();
	
	// time

	public var hour(get, never): Int;
	inline function get_hour() return repr.getHours();

	public var minute(get, never): Int;
	inline function get_minute() return repr.getMinutes();

	public var second(get, never): Float;
	function get_second() {
		return (repr.getTime() % 60000) / 1000;
	}

	// timezone

	// yearday

	public var weekday(get, never): Int;
	inline function get_weekday() return repr.getDay() + 1;

	// week

	// isoweek

	public function new(date: std.Date) {
		this.repr = date;
	}

	override function getKind() return ValueKind.KDate(this);
}