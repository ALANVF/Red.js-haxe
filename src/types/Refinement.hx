package types;

import types.base._Name;

class Refinement extends _Name {
	override public function getKind() return ValueKind.KRefinement(this);
}