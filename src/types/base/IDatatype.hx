package types.base;

interface IDatatype {
	public function typeOf(): ValueKind;
	public function matchesTypeOfValue(value: Value): Bool;
}