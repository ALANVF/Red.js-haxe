package types.base;

typedef ARandomOptions = {
	seed:   Bool,
	secure: Bool,
	only:   Bool
}

typedef AFormOptions = {
	part: Null<{limit: Integer}>
}

typedef AMoldOptions = {
	only: Bool,
	all:  Bool,
	flat: Bool,
	part: Null<{limit: Integer}>
}

typedef AModifyOptions = {
	_case: Bool
}

typedef ARoundOptions = {
	to:          Null<{scale: Value}>,
	even:        Bool,
	down:        Bool,
	halfDown:    Bool,
	floor:       Bool,
	ceiling:     Bool,
	halfCeiling: Bool
}

typedef AAppendOptions = {
	part: Null<{length: Value}>,
	only: Bool,
	dup:  Null<{count: Integer}>
}

typedef AChangeOptions = {
	part: Null<{range: Value}>,
	only: Bool,
	dup:  Null<{count: _Number}>
}

typedef ACopyOptions = {
	part:  Null<{length: Value}>,
	deep:  Bool,
	types: Null<{kind: IDatatype}>
}

typedef AFindOptions = {
	part:    Null<{length: Value}>,
	only:    Bool,
	_case:   Bool,
	same:    Bool,
	any:     Bool,
	with:    Null<{wild: String}>,
	skip:    Null<{size: Integer}>,
	last:    Bool,
	reverse: Bool,
	tail:    Bool,
	match:   Bool
}

typedef AInsertOptions = {
	part: Null<{length: Value}>,
	only: Bool,
	dup:  Null<{count: Integer}>
}

typedef AMoveOptions = {
	part: Null<{length: Integer}>
}

typedef APutOptions = {
	_case: Bool
}

typedef ARemoveOptions = {
	part: Null<{length: Value}>,
	key:  Null<{keyArg: Value}>
}

typedef AReverseOptions = {
	part: Null<{length: Value}>,
	skip: Null<{size: Integer}>
}

typedef ASelectOptions = {
	part:    Null<{length: Value}>,
	only:    Bool,
	_case:   Bool,
	same:    Bool,
	any:     Bool,
	with:    Null<{wild: String}>,
	skip:    Null<{size: Integer}>,
	last:    Bool,
	reverse: Bool
}

typedef ASortOptions = {
	_case:   Bool,
	skip:    Null<{size: Integer}>,
	compare: Null<{comparator: Value}>,
	part:    Null<{length: Value}>,
	all:     Bool,
	reverse: Bool,
	stable:  Bool
}

typedef ATakeOptions = {
	part: Null<{length: Value}>,
	deep: Bool,
	last: Bool
}

typedef ATrimOptions = {
	head:  Bool,
	tail:  Bool,
	auto:  Bool,
	lines: Bool,
	all:   Bool,
	with:  Null<{str: Value}>
}

typedef AOpenOptions = {
	_new:  Bool,
	read:  Bool,
	write: Bool,
	seek:  Bool,
	allow: Null<{access: Block}>
}

typedef AReadOptions = {
	part:   Null<{length: _Number}>,
	seek:   Null<{index: _Number}>,
	binary: Bool,
	lines:  Bool,
	info:   Bool,
	as:     Null<{encoding: Word}>
}

typedef AWriteOptions = {
	binary: Bool,
	lines:  Bool,
	info:   Bool,
	append: Bool,
	part:   Null<{length: _Number}>,
	seek:   Null<{index: _Number}>,
	allow:  Null<{access: Block}>,
	as:     Null<{encoding: Word}>
}

typedef _ActionOptions = {}