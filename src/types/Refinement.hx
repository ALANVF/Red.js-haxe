package types;

import types.base._Name;

class Refinement extends _Name {
	override public function typeOf() return ValueKind.KRefinement;
}