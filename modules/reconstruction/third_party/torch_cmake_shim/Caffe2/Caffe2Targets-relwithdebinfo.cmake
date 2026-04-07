#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "c10" for configuration "RelWithDebInfo"
set_property(TARGET c10 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(c10 PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libc10.so.1.8.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libc10.so.1.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS c10 )
list(APPEND _IMPORT_CHECK_FILES_FOR_c10 "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libc10.so.1.8.0" )

# Import target "torch_cpu" for configuration "RelWithDebInfo"
set_property(TARGET torch_cpu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(torch_cpu PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELWITHDEBINFO "pthreadpool;cpuinfo;XNNPACK;opencv_core;opencv_highgui;opencv_imgproc;opencv_imgcodecs;opencv_optflow;opencv_videoio;opencv_video;gloo;tensorpipe;zstd;onnx_proto;onnx;DNNL::dnnl"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtorch_cpu.so.1.8.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libtorch_cpu.so.1.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS torch_cpu )
list(APPEND _IMPORT_CHECK_FILES_FOR_torch_cpu "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtorch_cpu.so.1.8.0" )

# Import target "torch" for configuration "RelWithDebInfo"
set_property(TARGET torch APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(torch PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtorch.so.1.8.0"
  IMPORTED_SONAME_RELWITHDEBINFO "libtorch.so.1.8"
  )

list(APPEND _IMPORT_CHECK_TARGETS torch )
list(APPEND _IMPORT_CHECK_FILES_FOR_torch "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libtorch.so.1.8.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
