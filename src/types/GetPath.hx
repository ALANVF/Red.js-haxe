package types;

import types.base._Path;

class GetPath extends _Path {
	override public function getKind() return ValueKind.KGetPath(this);
}