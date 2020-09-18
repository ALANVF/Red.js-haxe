package types;

import types.base.IDatatype;

class Value {
	public function isTruthy() {
		return true;
	}

	public function typeOf() return ValueKind.KValue;

	public inline function isA(type: IDatatype) {
		return type.matchesTypeOfValue(this);
	}
}