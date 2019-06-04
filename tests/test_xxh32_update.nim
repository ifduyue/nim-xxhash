import xxhash

var x = newXXH32(0)

x.update("a")
assert(x.intdigest() == 1426945110'u32)
assert(x.intdigest() == xxh32("a"))

x.update("b")
assert(x.intdigest() == 1234828371'u32)
assert(x.intdigest() == xxh32("ab"))

x.update("c")
assert(x.intdigest() == 852579327'u32)
assert(x.intdigest() == xxh32("abc"))
