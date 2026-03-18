cmake_minimum_required(VERSION 3.20)

foreach(v COMPILER PYTHON3_EXECUTABLE RUNNER SRC EXPECT_MODE OUT_LL)
  if(NOT DEFINED ${v} OR "${${v}}" STREQUAL "")
    message(FATAL_ERROR "Missing required -D${v}=...")
  endif()
endforeach()

if(NOT EXPECT_MODE STREQUAL "pass" AND
   NOT EXPECT_MODE STREQUAL "fail" AND
   NOT EXPECT_MODE STREQUAL "verify")
  message(FATAL_ERROR "EXPECT_MODE must be 'pass', 'fail', or 'verify', got: ${EXPECT_MODE}")
endif()

execute_process(
  COMMAND "${PYTHON3_EXECUTABLE}" "${RUNNER}"
          --compiler "${COMPILER}"
          --src "${SRC}"
          --out-ll "${OUT_LL}"
          --expect-mode "${EXPECT_MODE}"
  RESULT_VARIABLE runner_rc
  OUTPUT_VARIABLE runner_out
  ERROR_VARIABLE runner_err
)

if(NOT runner_rc EQUAL 0)
  message(FATAL_ERROR "${runner_out}${runner_err}")
endif()

message(STATUS "[PASS] ${SRC} (${EXPECT_MODE})")
