# Define the header-only Boost target
add_library(boost_headers INTERFACE)

# Disable autolink
target_compile_definitions(boost_headers INTERFACE BOOST_ALL_NO_LIB=1)

if(BOOST_MODULARIZED)
  file(GLOB alllibs "${BOOST_SOURCE}/libs/*" "${BOOST_SOURCE}/libs/numeric/*")
  foreach(lib IN LISTS alllibs)
    if(IS_DIRECTORY "${lib}/include")
      target_include_directories(boost_headers SYSTEM INTERFACE "${lib}/include")
    endif()
  endforeach()
else()
  target_include_directories(boost_headers SYSTEM INTERFACE ${BOOST_SOURCE})
endif()
