import xxhash

var x = newXXH32(0)

x.update("a")
assert(x.digest() == 1426945110'u32)
assert(x.digest() == xxh32("a"))

x.update("b")
assert(x.digest() == 1234828371'u32)
assert(x.digest() == xxh32("ab"))

x.update("c")
assert(x.digest() == 852579327'u32)
assert(x.digest() == xxh32("abc"))
