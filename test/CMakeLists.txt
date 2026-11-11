# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(lowlevel-storageTests LANGUAGES CXX)

# ---- Tests ----

add_executable(lowlevel-storage_test source/lowlevel-storage_test.cpp)
target_link_libraries(lowlevel-storage_test PRIVATE lowlevel-storage_lib)
target_compile_features(lowlevel-storage_test PRIVATE cxx_std_23)

add_test(NAME lowlevel-storage_test COMMAND lowlevel-storage_test)

# ---- End-of-file commands ----

add_folders(Test)
