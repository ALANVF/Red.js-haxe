package types.base;

interface IDatatype {
	public function getKind(): ValueKind;
	public function matchesTypeOfValue(value: Value): Bool;
}