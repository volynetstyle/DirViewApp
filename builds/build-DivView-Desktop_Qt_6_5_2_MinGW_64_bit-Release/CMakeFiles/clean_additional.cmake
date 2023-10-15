# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\appDivView_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appDivView_autogen.dir\\ParseCache.txt"
  "CMakeFiles\\your_executable_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\your_executable_autogen.dir\\ParseCache.txt"
  "appDivView_autogen"
  "your_executable_autogen"
  )
endif()
