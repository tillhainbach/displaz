set(CPACK_PACKAGE_NAME "displaz")
set(CPACK_PACKAGE_VERSION_MAJOR ${displaz_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${displaz_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${displaz_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION ${displazVERSION}+${DISPLAZ_BUILD_NUMBER})
set(fullVersion "displaz-${displazVersion}")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "displaz")
set(CPACK_PACKAGE_VENDOR "displaz Team")
set(CPACK_PACKAGE_DESCRIPTION_FILE "${displaz_SOURCE_DIR}/README.rst")
set(CPACK_RESOURCE_FILE_README "${displaz_SOURCE_DIR}/README.rst")
set(CPACK_PACKAGE_DESCRIPTION
  "A viewer for geospatial point clouds")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A viewer for geospatial lidar data")

if(APPLE)
  configure_file("${displaz_SOURCE_DIR}/LICENSE.txt"
    "${displaz_BINARY_DIR}/LICENSE.txt" @ONLY)
  set(CPACK_RESOURCE_FILE_LICENSE "${displaz_SOURCE_DIR}/LICENSE.txt")
  set(CPACK_PACKAGE_ICON "../package/DisplazRemovable.icns")
  set(CPACK_BUNDLE_ICON "${CPACK_PACKAGE_ICON}")
else()
  set(CPACK_RESOURCE_FILE_LICENSE "${displaz_SOURCE_DIR}/LICENSE.txt")
endif()

if(UNIX AND NOT APPLE)
    set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/package/displaz.ico")
endif()

set(CPACK_PACKAGE_EXECUTABLES "displaz" "Displaz")
set(CPACK_CREATE_DESKTOP_LINKS "avogadro2")

configure_file("${CMAKE_CURRENT_LIST_DIR}/DisplazCPackOptions.cmake.in"
  "${displaz_BINARY_DIR}/DisplazCPackOptions.cmake" @ONLY)
set(CPACK_PROJECT_CONFIG_FILE
  "${displaz_BINARY_DIR}/DisplazCPackOptions.cmake")


include(CPack)
