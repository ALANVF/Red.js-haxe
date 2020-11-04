// testing things

import types.base._NativeOptions;
import runtime.natives.Do;
import types.Bitset;
import Tokenizer;
import types.*;

using types.Helpers;
using util.StringTools;

class Main {
	static function main() {
		//trace(Tokenizer.tokenize("a: 1 b: 2 print [\"a + b =\" a + b]").toString());

		/*for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test1.red"))) trace(Std.string(token));
		for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test2.red"))) trace(Std.string(token));
		for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test3.red"))) trace(Std.string(token));*/

		/*final tokens = haxe.Timer.measure(() -> Tokenizer.tokenize(Util.readFile("./parse-tests/test4.red")));
		for(token in tokens) trace(Util.pretty(token));*/
		
		/*trace(Type.getClass(new Block([])) == Block);
		trace(Type.getClass(new Block([]).copy()) == Block);
		trace(Type.getClass(new Block([]).copy()) == Paren);

		trace(Type.getClass(new Paren([])) == Paren);
		trace(Type.getClass(new Paren([]).copy()) == Paren);
		trace(Type.getClass(new Paren([]).copy()) == Block);
		
		var bs = Bitset.fromOrds([1,2,3]);
		trace(bs);
		trace([for(i in 1...11) bs.hasBit(i)]);
		bs.setBit(10, true);
		bs.setBit(2, false);
		trace(bs);
		trace([for(i in 1...11) bs.hasBit(i)]);
		trace(types.Object, types.base._Function);

		var word = new types.Word("word");
		trace(word);
		trace(word.KIND);
		trace(word.KIND.getValue());
		trace(word.TYPE_KIND);

		trace(std.String.fromCharCodes([97, 98, 99]));*/
		
		trace(Do.call(types.String.fromRed("123 [456 #abc] \"banana\""), Do.defaultOptions));
	}
}