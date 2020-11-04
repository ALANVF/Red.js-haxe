package util;

import haxe.macro.Expr;
import haxe.ds.Option;

abstract OptionTools<T>(Option<T>) from Option<T> to Option<T> {
	public static inline function fromNull<T>(c: Enum<Option<T>>, value: Null<T>) {
		return (value == null) ? None : Some(value);
	}

	public static function value<T>(opt: Option<T>) {
		return switch opt {
			case Some(v): v;
			case None: throw 'Expected a value!';
		};
	}

	public static function map<T, U>(opt: Option<T>, fn: T -> U) {
		return switch opt {
			case Some(v): Some(fn(v));
			case None: None;
		};
	}

	public static function flatMap<T, U>(opt: Option<T>, fn: T -> Option<U>) {
		return switch opt {
			case Some(v): fn(v);
			case None: None;
		};
	}

	public static macro function getOrElse<T>(opt: ExprOf<Option<T>>, other: ExprOf<T>) {
		return macro switch ${opt} {
			case Some(v): v;
			case None: ${other};
		};
	}
}