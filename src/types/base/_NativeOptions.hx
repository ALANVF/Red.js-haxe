package types.base;

typedef NFunctionOptions = {
	_extern: Bool
}

typedef NSwitchOptions = {
	_default: Null<{_case: Block}>
}

typedef NCaseOptions = {
	all: Bool
}

typedef NDoOptions = {
	expand: Bool,
	args: Null<{arg: Value}>,
	next: Null<{position: Word}>
}

typedef NReduceOptions = {
	into: Null<{out: Value}>
}

typedef NComposeOptions = {
	deep: Bool,
	only: Bool,
	into: Null<{out: Value}>
}

typedef NGetOptions = {
	any: Bool,
	_case: Bool
}

typedef NSetOptions = {
	any: Bool,
	_case: Bool,
	only: Bool,
	some: Bool
}

typedef NType_qOptions = {
	word: Bool
}

typedef NStatsOptions = {
	show: Bool,
	info: Bool
}

typedef NBindOptions = {
	copy: Bool
}

typedef NParseOptions = {
	_case: Bool,
	part: Null<{length: Value}>,
	trace: Null<{callback: Function}>
}

typedef NSetOpOptions = {
	_case: Bool,
	skip: Null<{size: Integer}>
}

typedef NShiftOptions = {
	left: Bool,
	logical: Bool
}

typedef NToHexOptions = {
	size: Null<{length: Integer}>
}

typedef NTrigOptions = {
	radians: Bool
}

typedef NConstructOptions = {
	with: Null<{object: Object}>,
	only: Bool
}

typedef NTryOptions = {
	all: Bool
}

typedef NChangeCaseOptions = {
	part: Null<{limit: Value}>
}

typedef NBreakOptions = {
	_return: Null<{value: Value}>
}

typedef NThrowOptions = {
	name: Null<{word: Word}>
}

typedef NCatchOptions = {
	name: Null<{word: Value}>
}

typedef NExtendOptions = {
	_case: Bool
}

typedef NBaseOptions = {
	base: Null<{baseValue: Integer}>
}

typedef NToLocalFileOptions = {
	full: Bool
}

typedef NWaitOptions = {
	all: Bool
}

typedef NChecksumOptions = {
	with: Null<{spec: Value}>
}

typedef NNewLineOptions = {
	all: Bool,
	skip: Null<{size: Integer}>
}

typedef NNowOptions = {
	year: Bool,
	month: Bool,
	day: Bool,
	time: Bool,
	zone: Bool,
	date: Bool,
	weekday: Bool,
	yearday: Bool,
	precise: Bool,
	utc: Bool
}

typedef NCallOptions = {
	wait: Bool,
	show: Bool,
	console: Bool,
	shell: Bool,
	input: Null<{_in: Value}>,
	output: Null<{out: Value}>,
	error: Null<{err: Value}>
}

typedef NCompressOptions = {
	zlib: Bool,
	deflate: Bool
}

typedef NDecompressOptions = {
	zlib: Null<{size: Integer}>,
	deflate: Null<{size: Integer}>
}

typedef NRecycleOptions = {
	on: Bool,
	off: Bool
}

typedef NTranscodeOptions = {
	next: Bool,
	one: Bool,
	prescan: Bool,
	scan: Bool,
	part: Null<{length: Value}>,
	into: Null<{dst: Value}>,
	trace: Null<{callback: Function}>
}

typedef _NativeOptions = {}