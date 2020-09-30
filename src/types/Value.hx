package types;

import types.base.IDatatype;

class Value {
	public function isTruthy() {
		return true;
	}

	public function getKind() return ValueKind.KValue(this);

	public inline function isA(type: IDatatype) {
		return type.matchesTypeOfValue(this);
	}
}