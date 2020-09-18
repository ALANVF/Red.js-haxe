package types;

import types.base._Float;

class Percent extends _Float {
	override public function typeOf() return ValueKind.KPercent;
}