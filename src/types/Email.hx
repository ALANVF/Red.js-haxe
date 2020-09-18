package types;

import types.base._String;

class Email extends _String {
	override public function typeOf() return ValueKind.KEmail;

	public static function fromString(str: std.String) {
		return new Email(_String.charsFromRed(str));
	}

	override function clone(values: Array<Char>, ?index: Int) {
		return new Email(values, index);
	}
}