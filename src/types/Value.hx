package types;

import types.base.IValue;
import types.base.IDatatype;
import haxe.macro.Context;

using util.ArrayTools;

class _Value {
#if macro
	public static function build(): Array<haxe.macro.Expr.Field> {
		var cls = switch Context.getLocalType() {
			case TInst(_.get() => t, _): t;
			default: throw "error!";
		};

		if(cls.meta.has(":processed")) {
			return null;
		} else {
			cls.meta.add(":processed", [], cls.pos);
		}

		var fields = Context.getBuildFields();
		var name = cls.name;
		var vname = "K" + name;
		var dname = "D" + name;
		var valueKind = switch Context.getType("types.ValueKind") {
			case haxe.macro.Type.TEnum(_.get() => t, _): t;
			default: throw "error!";
		};
		var typeKind = switch Context.getType("types.TypeKind") {
			case haxe.macro.Type.TAbstract(_.get() => t, _) if(t.meta.has(":enum")): t;
			default: throw "error!";
		};

		if(valueKind.names.contains(vname) && fields.every(f -> f.name != "getKind")) {
			fields.push({
				name: "getKind",
				pos: Context.currentPos(),
				access: [APublic, AOverride],
				kind: FFun({
					args: [],
					ret: null,
					expr: macro return $p{["ValueKind", vname]}(this)
				})
			});
		}

		var cases = typeKind.impl.get().statics.get().filter(f -> f.meta.has(":enum") && f.meta.has(":impl"));
		if(cases.some(f -> f.name == dname) && fields.every(f -> f.name != "getTypeKind")) {
			fields.push({
				name: "getTypeKind",
				pos: Context.currentPos(),
				access: [APublic, AOverride],
				kind: FFun({
					args: [],
					ret: null,
					expr: macro return $p{["TypeKind", dname]}
				})
			});
		}

		return fields;
	}
#end
}

#if !macro
@:autoBuild(types._Value.build())
#end
class Value implements IValue {
	public function isTruthy() {
		return true;
	}

	public function getKind(): ValueKind {
		throw "Must be implemented in subclasses!";
	}

	public function getTypeKind(): TypeKind {
		throw "Must be implemented in subclasses!";
	}
	
	public inline function isA(type: IDatatype) {
		return type.matchesTypeOfValue(this);
	}
}