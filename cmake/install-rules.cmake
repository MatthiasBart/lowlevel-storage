install(
    TARGETS lowlevel-storage_exe
    RUNTIME COMPONENT lowlevel-storage_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
