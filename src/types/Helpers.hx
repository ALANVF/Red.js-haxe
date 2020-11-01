package types;

class Helpers {
	static macro function _getValueKindValue(vk: haxe.macro.Expr.ExprOf<ValueKind>): haxe.macro.Expr.ExprOf<Value> {
		switch haxe.macro.Context.getType("types.ValueKind") {
			case haxe.macro.Type.TEnum(_.get() => t, _):
				var cases: Array<haxe.macro.Expr.Case> = [];

				for(n => _ in t.constructs) {
					cases.push({
						values: [macro $i{n}(v)],
						expr: macro v
					});
				}

				return {
					expr: haxe.macro.ExprDef.ESwitch(vk, cases, null),
					pos: haxe.macro.Context.currentPos()
				};
			default: throw "error!";
		}
	}

	public static inline function getValue(vk: ValueKind) return _getValueKindValue(vk);

	//public static function tryGetAsPath
}