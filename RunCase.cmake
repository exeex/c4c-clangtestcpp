cmake_minimum_required(VERSION 3.20)

foreach(v COMPILER SRC EXPECT_MODE OUT_LL)
  if(NOT DEFINED ${v} OR "${${v}}" STREQUAL "")
    message(FATAL_ERROR "Missing required -D${v}=...")
  endif()
endforeach()

if(NOT EXPECT_MODE STREQUAL "pass" AND NOT EXPECT_MODE STREQUAL "fail")
  message(FATAL_ERROR "EXPECT_MODE must be 'pass' or 'fail', got: ${EXPECT_MODE}")
endif()

get_filename_component(out_ll_dir "${OUT_LL}" DIRECTORY)
file(MAKE_DIRECTORY "${out_ll_dir}")

execute_process(
  COMMAND "${COMPILER}" "${SRC}" -o "${OUT_LL}"
  RESULT_VARIABLE front_rc
  OUTPUT_VARIABLE front_out
  ERROR_VARIABLE front_err
)

set(front_log "${front_out}${front_err}")

if(EXPECT_MODE STREQUAL "pass")
  if(NOT front_rc EQUAL 0)
    message(FATAL_ERROR "[FRONTEND_FAIL] ${SRC}\n${front_log}")
  endif()
else()
  if(front_rc EQUAL 0)
    message(FATAL_ERROR "[UNEXPECTED_PASS] ${SRC}\n${front_log}")
  endif()
endif()

message(STATUS "[PASS] ${SRC} (${EXPECT_MODE})")
