package types;

import types.base._SeriesOf;

// https://github.com/HaxeFoundation/haxe/blob/4.1.3/std/hl/types/ArrayBytes.hx
/*import types.base.SeriesOf;
import haxe.io.BytesBuffer;
import haxe.io.Bytes;

class Binary extends Value implements SeriesOf<Integer> {
	public var data: Bytes;

	public function new(data: Bytes) {
		
	}
}*/
class Binary extends _SeriesOf<Integer> {}