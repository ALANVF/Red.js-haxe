# Red.js (Haxe)

This is a temporary repository that will be used while Red.js' source is being converted from TypeScript to Haxe.

Main Red.js repo: https://github.com/ALANVF/Red.js


# Why Haxe?

TypeScript is... annoying. It doesn't support nominal typing (even for classes!), lacks real pattern matching, and it's honestly just as unproductive as the language that it's built on.

Haxe, on the other hand, is a very powerful language that not only compiles to JS, but also fixes pretty much everything that I don't like about TS. These things include:
- strict typing
- pattern matching (well, it doesn't have destructuring (yet), but it's otherwise fine)
- real/better tagged unions
- (type-safe) macros
- everything is an expression, which can greatly reduce code size.

That being said, Haxe does have a few downsides:
- requires more boilerplate due to its small standard library
- no support for abstract classes (although it's supposedly available in the nightly builds)
- null safety is essentially non-existent (and you can't overload postifx `!` without macros??)
- no array splats (`...`)
- no type refinement/narrowing
- no polymorphic `this` type
- pattern matching extractors exponentially increase codegen (wtf?)
- function overloading is (currently) only allowed for externs
- no untagged unions

Despite these issues, Haxe has been much nicer to work with, and gave me a chance to fix a lot of things that I had originally implemented incorrectly.