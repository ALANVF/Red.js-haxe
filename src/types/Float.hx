package types;

import types.base._Float;

class Float extends _Float {
	override public function getKind() return ValueKind.KFloat(this);
}