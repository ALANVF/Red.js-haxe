package types.base;

interface IValue {
	public function isTruthy(): Bool;
	public function getKind(): ValueKind;
	public function isA(type: IDatatype): Bool;
}