package types;

import types.base._Path;

class Path extends _Path {
	override public function getKind() return ValueKind.KPath(this);
}