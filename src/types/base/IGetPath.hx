package types.base;

import haxe.ds.Option;

interface IGetPath extends IValue {
	function getPath(access: Value): Option<Value>;
}