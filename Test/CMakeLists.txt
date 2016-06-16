set(test_sources
    main.cc
    test.cc
    )

add_executable(run_tests ${test_sources})
target_link_libraries(run_tests
    pthread
    gmock
    gtest
    )
