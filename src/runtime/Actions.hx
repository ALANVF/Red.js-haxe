package runtime;

import types.Value;
import types.Action;
import types.TypeKind;
import runtime.actions.datatypes.*;

class Actions {
	static final ACTIONS = [
		DUnset => new UnsetActions(),
		DNative => new NativeActions()
	];
}