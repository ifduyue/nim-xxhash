import xxhash

assert(xxh32("a") == 1426945110'u32)
assert(xxh32("a", 0) == 1426945110'u32)
assert(xxh32("a", 1) == 4111757423'u32)
assert(xxh32("a", 0xffffffff'u32) == 3443684653'u32)
