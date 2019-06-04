from strutils import toHex
from xxhash/private/c as c import nil


# xxh32 oneshot

proc xxh32*(input: string, seed: uint32 = 0): uint32 =
  c.xxh32(input.cstring, input.len, seed)

proc xxh32_intdigest*(input: string, seed: uint32 = 0): uint32 =
  c.xxh32(input.cstring, input.len, seed)

proc xxh32_digest*(input: string, seed: uint32 = 0): string =
  let intdigest = c.xxh32(input.cstring, input.len, seed)
  result = newString(4)
  result[0] = (char)(intdigest shr 24 and 0xFF)
  result[1] = (char)(intdigest shr 16 and 0xFF)
  result[2] = (char)(intdigest shr  8 and 0xFF)
  result[3] = (char)(intdigest shr  0 and 0xFF)

proc xxh32_hexdigest*(input: string, seed: uint32 = 0): string =
  xxh32_digest(input, seed).toHex()


# xxh32 stream

type XXH32* = ref object of RootObj
  state: ptr c.XXH32_state_t
  seed: uint32

proc newXXH32*(seed: uint32): XXH32 =
  new(result, proc(self: XXH32) = discard c.XXH32_freeState(self.state))
  result.state = c.XXH32_createState()
  discard c.XXH32_reset(result.state, seed)

proc update*(x: XXH32, s: string) =
  discard c.XXH32_update(x.state, s.cstring, s.len)

proc intdigest*(x: XXH32): uint32 =
  c.XXH32_digest(x.state)

proc digest*(x: XXH32): string =
  let intdigest = c.XXH32_digest(x.state)
  result = newString(4)
  result[0] = (char)(intdigest shr 24 and 0xFF)
  result[1] = (char)(intdigest shr 16 and 0xFF)
  result[2] = (char)(intdigest shr  8 and 0xFF)
  result[3] = (char)(intdigest shr  0 and 0xFF)

proc hexdigest*(x: XXH32): string =
  x.digest().toHex()

proc reset*(x: XXH32) =
  discard c.XXH32_reset(x.state, x.seed)


# xxh64 oneshot

proc xxh64*(input: string, seed: uint64 = 0): uint64 =
  c.xxh64(input.cstring, input.len, seed)

proc xxh64_intdigest*(input: string, seed: uint64 = 0): uint64 =
  c.xxh64(input.cstring, input.len, seed)

proc xxh64_digest*(input: string, seed: uint64 = 0): string =
  let intdigest = c.xxh64(input.cstring, input.len, seed)
  result = newString(8)
  result[0] = (char)(intdigest shr 56 and 0xFF)
  result[1] = (char)(intdigest shr 48 and 0xFF)
  result[2] = (char)(intdigest shr 40 and 0xFF)
  result[3] = (char)(intdigest shr 32 and 0xFF)
  result[4] = (char)(intdigest shr 24 and 0xFF)
  result[5] = (char)(intdigest shr 16 and 0xFF)
  result[6] = (char)(intdigest shr  8 and 0xFF)
  result[7] = (char)(intdigest shr  0 and 0xFF)

proc xxh64_hexdigest*(input: string, seed: uint64 = 0): string =
  xxh64_digest(input, seed).toHex()


# xxh64 stream

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

proc intdigest*(x: XXH64): uint64 =
  c.XXH64_digest(x.state)

proc digest*(x: XXH64): string =
  let intdigest = c.XXH64_digest(x.state)
  result = newString(8)
  result[0] = (char)(intdigest shr 56 and 0xFF)
  result[1] = (char)(intdigest shr 48 and 0xFF)
  result[2] = (char)(intdigest shr 40 and 0xFF)
  result[3] = (char)(intdigest shr 32 and 0xFF)
  result[4] = (char)(intdigest shr 24 and 0xFF)
  result[5] = (char)(intdigest shr 16 and 0xFF)
  result[6] = (char)(intdigest shr  8 and 0xFF)
  result[7] = (char)(intdigest shr  0 and 0xFF)

proc hexdigest*(x: XXH64): string =
  x.digest().toHex()

proc reset*(x: XXH64) =
  discard c.XXH64_reset(x.state, x.seed)

