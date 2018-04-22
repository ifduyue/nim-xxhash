import xxhash

assert(xxh64("a") == 15154266338359012955'u64)
assert(xxh64("a", 0) == 15154266338359012955'u64)
assert(xxh64("a", 1) == 16051599287423682246'u64)
assert(xxh64("a", 0xffffffffffffffff'u64) == 6972758980737027682'u64)
