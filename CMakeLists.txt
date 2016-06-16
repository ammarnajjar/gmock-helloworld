cmake_minimum_required (VERSION 2.3)

project (hello)

execute_process(COMMAND "bash" "pre-build.sh"
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

add_subdirectory(googletest)
include_directories(googlemock/include googletest/include)

set (SRCS main.cc)
set(CMAKE_CXX_FLAGS "${CMAXE_CXX_FLAGS} -Wall -g")

add_executable (hello ${SRCS})

add_subdirectory(Test)
add_test(alltests Test/run_tests)

option(WITH_TEST "build test" ON)
if(WITH_TEST)
	enable_testing()
endif()

