package types;

import types.base.IDatatype;

class Datatype extends Value implements IDatatype {
	static final DATATYPES: std.Map<std.String, Datatype> = [];

	public var name: std.String; // maybe remove this
	public var kind: TypeKind;

	public function new(name: std.String, kind: TypeKind) {
		this.name = name;
		this.kind = kind;
	}

	public function equalsDatatype(type: Datatype) {
		return this.name == type.name && this.kind == type.kind;
	}

	public function matchesTypeOfValue(value: Value) {
		return value.TYPE_KIND == this.kind;
	}
}