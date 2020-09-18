package types;

import types.base._Float;

class Float extends _Float {
	override public function typeOf() return ValueKind.KFloat;
}