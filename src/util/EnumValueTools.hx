package util;

import haxe.macro.Context;
import haxe.macro.Expr;

class EnumValueTools {
	public static macro function extract<T: EnumValue>(value: ExprOf<T>, pattern, expr, ?otherwise) {
		return macro {
			switch($value) {
				case $pattern: $expr;
				default: throw ${
					if(otherwise == null) {
						macro "Error!";
					} else {
						otherwise;
					}
				}
			}
		}
	}

	public static macro function attempt<T: EnumValue>(value: ExprOf<T>, pattern, expr, ?otherwise) {
		return macro {
			switch($value) {
				case $pattern: $expr;
				default: $otherwise;
			}
		}
	}
}