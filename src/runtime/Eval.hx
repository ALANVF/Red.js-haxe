package runtime;

class Eval {
	public static function evalCode(input: String) {
		return runtime.natives.Do.evalValues(Tokenizer.parse(input));
	}
}