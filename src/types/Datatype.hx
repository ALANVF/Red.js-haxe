package types;

import types.base.IDatatype;

class Datatype extends Value implements IDatatype {
	public var name: std.String; // maybe remove this
	public var kind: ValueKind;

	public function new(name: std.String, kind: ValueKind) {
		this.name = name;
		this.kind = kind;
	}

	override public function typeOf() return ValueKind.KDatatype;

	public function equalsDatatype(type: Datatype) {
		return this.name == type.name && this.kind == type.kind;
	}

	public function matchesTypeOfValue(value: Value) {
		return value.typeOf() == this.kind;
	}
}