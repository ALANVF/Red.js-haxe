package types;

import types.base._Path;

class SetPath extends _Path {
	override public function getKind() return ValueKind.KSetPath(this);
}