package types;

import types.base._Integer;

class Integer extends _Integer {
	override public function typeOf() return ValueKind.KInteger;
}