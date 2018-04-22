{.compile: "xxhash/private/xxhash.c".}

type
  XXH_errorcode* = enum
    XXH_OK = 0, XXH_ERROR

# xxh32

discard """
typedef struct XXH32_state_s XXH32_state_t;   /* incomplete type */
XXH_PUBLIC_API XXH32_state_t* XXH32_createState(void);
XXH_PUBLIC_API XXH_errorcode  XXH32_freeState(XXH32_state_t* statePtr);
XXH_PUBLIC_API void XXH32_copyState(XXH32_state_t* dst_state, const XXH32_state_t* src_state);

XXH_PUBLIC_API XXH_errorcode XXH32_reset  (XXH32_state_t* statePtr, unsigned int seed);
XXH_PUBLIC_API XXH_errorcode XXH32_update (XXH32_state_t* statePtr, const void* input, size_t length);
XXH_PUBLIC_API XXH32_hash_t  XXH32_digest (const XXH32_state_t* statePtr);
"""

type
  XXH32_hash_t* = cuint
  XXH32_state_t* = object

proc xxh32*(input: pointer, length: csize, seed: cuint = 0): XXH32_hash_t {.cdecl, importc: "XXH32".}

proc XXH32_createState*(): ptr XXH32_state_t {.importc.}
proc XXH32_freeState*(statePtr: ptr XXH32_state_t): XXH_errorcode {.importc.}
proc XXH32_copyState*(dst_state: ptr XXH32_state_t, src_state: ptr XXH32_state_t) {.importc.}

proc XXH32_reset*(statePtr: ptr XXH32_state_t, seed: cuint): XXH_errorcode {.importc.}
proc XXH32_update*(statePtr: ptr XXH32_state_t, input: pointer, length: csize): XXH_errorcode {.importc.}
proc XXH32_digest*(statePtr: ptr XXH32_state_t): XXH32_hash_t {.importc.}


# xxh64

discard """
typedef struct XXH64_state_s XXH64_state_t;   /* incomplete type */
XXH_PUBLIC_API XXH64_state_t* XXH64_createState(void);
XXH_PUBLIC_API XXH_errorcode  XXH64_freeState(XXH64_state_t* statePtr);
XXH_PUBLIC_API void XXH64_copyState(XXH64_state_t* dst_state, const XXH64_state_t* src_state);

XXH_PUBLIC_API XXH_errorcode XXH64_reset  (XXH64_state_t* statePtr, unsigned long long seed);
XXH_PUBLIC_API XXH_errorcode XXH64_update (XXH64_state_t* statePtr, const void* input, size_t length);
XXH_PUBLIC_API XXH64_hash_t  XXH64_digest (const XXH64_state_t* statePtr);
"""

type
  XXH64_hash_t* = culonglong
  XXH64_state_t* = object


proc xxh64*(input: pointer, length: csize, seed: culonglong = 0): XXH64_hash_t {.cdecl, importc: "XXH64".}

proc XXH64_createState*(): ptr XXH64_state_t {.importc.}
proc XXH64_freeState*(statePtr: ptr XXH64_state_t): XXH_errorcode {.importc.}
proc XXH64_copyState*(dst_state: ptr XXH64_state_t, src_state: ptr XXH64_state_t) {.importc.}

proc XXH64_reset*(statePtr: ptr XXH64_state_t, seed: culonglong): XXH_errorcode {.importc.}
proc XXH64_update*(statePtr: ptr XXH64_state_t, input: pointer, length: csize): XXH_errorcode {.importc.}
proc XXH64_digest*(statePtr: ptr XXH64_state_t): XXH64_hash_t {.importc.}
