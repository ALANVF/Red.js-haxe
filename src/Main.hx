// testing things

import Tokenizer;

class Main {
	static function main() {
		/*for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test1.red"))) trace(Std.string(token));
		for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test2.red"))) trace(Std.string(token));
		for(token in Tokenizer.tokenize(Util.readFile("./parse-tests/test3.red"))) trace(Std.string(token));*/

		/*final tokens = haxe.Timer.measure(() -> Tokenizer.tokenize(Util.readFile("./parse-tests/test4.red")));
		for(token in tokens) trace(Util.pretty(token));*/
		
		//trace(Do.call(types.String.fromRed("123 [456 #abc] \"banana\""), Do.defaultOptions));

		js.Syntax.code("
var readline = require('readline');
var io = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	prompt: '> '
});
io.prompt(true);
io.on('line', function(input) {
	if(input === 'quit') {
		io.close();
		return;
	} else {
		({0})(input);
	}
	console.log();
	io.prompt(true);
});",
			(input: String) -> {
				try {
					final res = Tokenizer.tokenize(input);
					js.Syntax.code("console.log({0})", res);
				} catch(e) {
					js.Syntax.code("console.log({0})", e.details());
				}
			}
		);
	}
}