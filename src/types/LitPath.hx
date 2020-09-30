package types;

import types.base._Path;

class LitPath extends _Path {
	override public function getKind() return ValueKind.KLitPath(this);
}