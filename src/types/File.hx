package types;

import types.base._String;

class File extends _String {
	override public function typeOf() return ValueKind.KFile;

	public static function fromString(str: std.String) {
		return new File(_String.charsFromRed(str));
	}

	override function clone(values: Array<Char>, ?index: Int) {
		return new File(values, index);
	}
}