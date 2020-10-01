package types;

import types.base.IDatatype;

class Datatype extends Value implements IDatatype {
	static final DATATYPES: std.Map<std.String, Datatype> = [];

	public var name: std.String; // maybe remove this
	public var kind: Int;

	public function new(name: std.String, kind: Int) {
		this.name = name;
		this.kind = kind;
	}

	override public function getKind() return ValueKind.KDatatype(this);

	public function equalsDatatype(type: Datatype) {
		return this.name == type.name && this.kind == type.kind;
	}

	public function matchesTypeOfValue(value: Value) {
		return value.getKind().getIndex() == this.kind;
	}
}