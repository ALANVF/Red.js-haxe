package types;

import types.base._Name;

class Issue extends _Name {
	override public function getKind() return ValueKind.KIssue(this);
}