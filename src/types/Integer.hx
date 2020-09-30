package types;

import types.base._Integer;

class Integer extends _Integer {
	override public function getKind() return ValueKind.KInteger(this);
}