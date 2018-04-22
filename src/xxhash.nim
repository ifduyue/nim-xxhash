import xxhash/private/c

proc xxh32*(input: string, seed: uint32 = 0): uint32 =
  xxh32(input.cstring, input.len, seed)

type XXH32 = ref object of RootObj
  state: ptr XXH32_state_t
  seed: uint32

proc newXXH32*(seed: uint32): XXH32 =
  var state = XXH32_createState()
  discard XXH32_reset(state, seed)
  XXH32(state: state, seed: seed)

proc update*(x: XXH32, s: string) =
  discard XXH32_update(x.state, s.cstring, s.len)

proc digest*(x: XXH32): uint32 =
  XXH32_digest(x.state)

proc reset*(x: XXH32) =
  discard XXH32_reset(x.state, x.seed)

proc `=destroy`(x: XXH32) =
  discard XXH32_freeState(x.state)
  x.state = nil
