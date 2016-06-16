cmake_minimum_required (VERSION 2.3)

project (hello)

execute_process(COMMAND "bash" "pre-build.sh"
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

include_directories(${PROJECT_SOURCE_DIR}/googletest/googlemock/include/ ${PROJECT_SOURCE_DIR}/googletest/googletest/include/)
link_directories(${PROJECT_SOURCE_DIR}/googletest/build/googlemock ${PROJECT_SOURCE_DIR}/googletest/build/googlemock/gtest)

set (SRCS main.cc)
set(CMAKE_CXX_FLAGS "${CMAXE_CXX_FLAGS} -Wall -g")

add_executable (hello ${SRCS})

add_subdirectory(Test)
set(Sources
    Test/main.cc
    Test/test.cc
    )

add_executable(tests ${Sources})
target_link_libraries(tests
	ptest
    pthread
    gmock
    gtest
    )


add_test(alltests tests)

option(WITH_TEST "build test" ON)
if(WITH_TEST)
	enable_testing()
endif()
