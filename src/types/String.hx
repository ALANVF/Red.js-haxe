package types;

import types.base._String;

class String extends _String {
	public static function fromString(str: std.String) {
		return new String(_String.charsFromRed(str));
	}

	override function clone(values: Array<Char>, ?index: Int) {
		return new String(values, index);
	}

	override public function typeOf() return ValueKind.KString;
}