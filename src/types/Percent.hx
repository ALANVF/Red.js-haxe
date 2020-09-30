package types;

import types.base._Float;

class Percent extends _Float {
	override public function getKind() return ValueKind.KPercent(this);
}