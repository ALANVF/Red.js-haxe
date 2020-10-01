package types;

import types.base.IValue;
import types.base.IDatatype;

class Value implements IValue {
	public function isTruthy() {
		return true;
	}

	public function getKind() {
		return ValueKind.KValue(this);
	}
	
	public inline function isA(type: IDatatype) {
		return type.matchesTypeOfValue(this);
	}
}