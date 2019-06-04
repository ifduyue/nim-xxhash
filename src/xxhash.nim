from xxhash/private/c as c import nil


# xxh32

proc xxh32*(input: string, seed: uint32 = 0): uint32 =
  c.xxh32(input.cstring, input.len, seed)

type XXH32* = ref object of RootObj
  state: ptr c.XXH32_state_t
  seed: uint32

proc newXXH32*(seed: uint32): XXH32 =
  new(result, proc(self: XXH32) = discard c.XXH32_freeState(self.state))
  result.state = c.XXH32_createState()
  discard c.XXH32_reset(result.state, seed)

proc update*(x: XXH32, s: string) =
  discard c.XXH32_update(x.state, s.cstring, s.len)

proc digest*(x: XXH32): uint32 =
  c.XXH32_digest(x.state)

proc reset*(x: XXH32) =
  discard c.XXH32_reset(x.state, x.seed)


# xxh64

proc xxh64*(input: string, seed: uint64 = 0): uint64 =
  c.xxh64(input.cstring, input.len, seed)

type XXH64* = ref object of RootObj
  state: ptr c.XXH64_state_t
  seed: uint64

proc newXXH64*(seed: uint64): XXH64 =
  new(result, proc(self: XXH64) = discard c.XXH64_freeState(self.state))
  result.seed = seed
  result.state = c.XXH64_createState()
  discard c.XXH64_reset(result.state, seed)

proc update*(x: XXH64, s: string) =
  discard c.XXH64_update(x.state, s.cstring, s.len)

proc digest*(x: XXH64): uint64 =
  c.XXH64_digest(x.state)

proc reset*(x: XXH64) =
  discard c.XXH64_reset(x.state, x.seed)

