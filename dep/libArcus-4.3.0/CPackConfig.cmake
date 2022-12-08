set(CPACK_PACKAGE_VENDOR "Ultimaker")
set(CPACK_PACKAGE_CONTACT "Arjen Hiemstra <a.hiemstra@ultimaker.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "libArcus Communication library")
if(NOT DEFINED CPACK_PACKAGE_VERSION)
  set(CPACK_PACKAGE_VERSION "15.05.91")
endif()
set(CPACK_GENERATOR "DEB")
if(NOT DEFINED CPACK_DEBIAN_PACKAGE_ARCHITECTURE)
  execute_process(COMMAND dpkg --print-architecture OUTPUT_VARIABLE CPACK_DEBIAN_PACKAGE_ARCHITECTURE OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}_${CPACK_DEBIAN_PACKAGE_ARCHITECTURE}")

set(DEB_DEPENDS
    "python3 (>= 3.4.0)"
    "libgcc1 (>= 4.9.0)"
    "libstdc++6 (>= 4.9.0)"
    "libc6 (>= 2.19)"
    "zlib1g (>= 1.2.0)"
    "protobuf (>= 3.0.0)"
)
string(REPLACE ";" ", " DEB_DEPENDS "${DEB_DEPENDS}")
set(CPACK_DEBIAN_PACKAGE_DEPENDS ${DEB_DEPENDS})

include(CPack)
