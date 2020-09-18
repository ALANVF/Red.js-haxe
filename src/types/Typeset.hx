package types;

import types.base.IDatatype;
import util.Set;

class Typeset extends Value implements IDatatype {
	public final types: Set<Datatype>;

	public function new(types: Iterable<IDatatype>) {
		this.types = new Set();

		for(type in types) {
			switch type.typeOf() {
				case KDatatype:
					this.types.add(cast type);
				case KTypeset:
					for(type_ in cast(type, Typeset).types) {
						this.types.add(type_);
					}
				default:
			}
		}
	}

	override public function typeOf() return ValueKind.KTypeset;

	public function matchesTypeOfValue(value: Value) {
		return Lambda.exists(this.types, t -> t.matchesTypeOfValue(value));
	}
}