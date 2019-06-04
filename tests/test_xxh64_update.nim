import xxhash

var x = newXXH64(0)

x.update("a")
assert(x.intdigest() == 15154266338359012955'u64)
assert(x.intdigest() == xxh64("a"))

x.update("b")
assert(x.intdigest() == 7347350983217793633'u64)
assert(x.intdigest() == xxh64("ab"))

x.update("c")
assert(x.intdigest() == 4952883123889572249'u64)
assert(x.intdigest() == xxh64("abc"))
