#!/usr/bin/ruby

# Synopsis:
#
#      pageNumberLookup.rb filename.html > outputFile.html
#
# This script is used to replace symbolic references to locations in the OpenCL
# specification with page number references. This can be used when you want the
# reference page to refer to section XYZ of the OpenCL spec with a link and have
# the link open the spec document to section XYZ. This approach is based on the 
# "named destination" feature for PDF files. 
#
# Ideally we wanted to link to the named destinations, but inconsistencies between
# versions of MS Word and other limitations prevent us from doing that at this time.
# So, this is a second-best solution in which we map symbolic names to page
# numbers, then the link will open the spec to the specified page. To use this
# solution, refer to a section in the spec using a symbolic name that you make up
# in a <olink /> element with a uri attribute that is the symbolic name. Then add 
# the keyword gl_sharing to the lookup table below with the corresponding page 
# number from the Spec. 
#
# For example to link to the spec section for gl_sharing, use:
#
#    <olink uri="gl_sharing">OpenCL Specification</olink>
#
# The xsltproc program generates a temporary HTML file where the XML line above 
# is transformed into:
#
#    <a href="http://www.khronos.org/registry/cl/specs/opencl-1.0.43.pdf#namedest=gl_sharing">
#           OpenCL Specification</a>  
#
# When this lookup program is run on the HTML file, it will look up the keyword and 
# replace text in the HTML file so that the final URL will to make it look like this:
#
#    <a href="http://www.khronos.org/registry/cl/specs/opencl-1.0.43.pdf#page=279">
#           OpenCL Specification</a>
#
# (You can control what the first part of the URL is by modifying the SpecBaseUrl 
# variable in the opencl-man.xsl file.) 

###############################################################################
# Spec page number mapping here. First string in quotes. Commas between values.
# Text after page number is for reference to see where this content can be found in the spec.
#
Pagenums = {
   "clGetPlatformIDs",                  29,     # 4.1 - Querying Platform Info
   "clGetPlatformInfo",                 29,     # 4.1 - Querying Platform Info
   "clGetDeviceIDs",                    31,     # 4.2 - Querying Devices
   "clGetDeviceInfo",                   32,     # 4.2 - Querying Devices
   "clCreateContext",                   40,     # 4.3 - Contexts
   "clCreateContextFromType",           42,     # 4.3 - Contexts
   "clRetainContext",                   43,     # 4.3 - Contexts
   "clReleaseContext",                  43,     # 4.3 - Contexts
   "clGetContextInfo",                  43,     # 4.3 - Contexts
   "clCreateCommandQueue",              46,     # 5.1 - Command Queues
   "clRetainCommandQueue",              47,     # 5.1 - Command Queues
   "clReleaseCommandQueue",             48,     # 5.1 - Command Queues
   "clGetCommandQueueInfo",             48,     # 5.1 - Command Queues
   "clSetCommandQueueProperty",         49,     # 5.1 - Command Queues
   "clCreateBuffer",                    52,     # 5.2.1 - Creating Buffer Objects
   "clEnqueueReadBuffer",               54,     # 5.2.1 - Creating Buffer Objects
   "clEnqueueWriteBuffer",              54,     # 5.2.1 - Creating Buffer Objects
   "clEnqueueCopyBuffer",               57,     # 5.2.1 - Creating Buffer Objects
   "clRetainMemObject",                 58,     # 5.2.3 - Retaining and Releasing Memory Objects
   "clReleaseMemObject",                58,     # 5.2.3 - Retaining and Releasing Memory Objects
   "clCreateImage2D",                   59,     # 5.2.4 - Creating Image Objects
   "clCreateImage3D",                   60,     # 5.2.4 - Creating Image Objects
   "cl_image_format",                   62,     # 5.2.4.1 - Image Format Descriptor
   "clGetSupportedImageFormats",        64,     # 5.2.5 - Querying List of Supported Image Formats
   "clEnqueueReadImage",                67,     # 5.2.6 - Reading, Writing and Copying Image Objects
   "clEnqueueWriteImage",               67,     # 5.2.6 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImage",                70,     # 5.2.6 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImageToBuffer",        72,     # 5.2.7 - Copying between Image and Buffer Objects
   "clEnqueueCopyBufferToImage",        74,     # 5.2.7 - Copying between Image and Buffer Objects
   "clEnqueueMapBuffer",                76,     # 5.2.8 - Mapping and Unmapping Memory Objects
   "clEnqueueMapImage",                 78,     # 5.2.8 - Mapping and Unmapping Memory Objects
   "clEnqueueUnmapMemObject ",          81,     # 5.2.8 - Mapping and Unmapping Memory Objects
   "clGetMemObjectInfo",                82,     # 5.2.9 - Memory Object Queries
   "clGetImageInfo",                    84,     # 5.2.9 - Memory Object Queries
   "clCreateSampler",                   85,     # 5.3 - Sampler Objects
   "clRetainSampler",                   86,     # 5.3 - Sampler Objects
   "clReleaseSampler",                  86,     # 5.3 - Sampler Objects
   "clGetSamplerInfo",                  86,     # 5.3 - Sampler Objects
   "clCreateProgramWithSource",         88,     # 5.4.1 - Creating Program Objects
   "clCreateProgramWithBinary",         89,     # 5.4.1 - Creating Program Objects
   "clRetainProgram",                   91,     # 5.4.1 - Creating Program Objects
   "clReleaseProgram",                  91,     # 5.4.1 - Creating Program Objects
   "clBuildProgram",                    91,     # 5.4.2 - Building Program Executables
   "clUnloadCompiler",                  95,     # 5.4.4 - Unloading the OpenCL Compiler
   "clGetProgramInfo",                  96,     # 5.4.5 - Program Object Queries
   "clGetProgramBuildInfo",             98,     # 5.4.5 - Program Object Queries
   "clCreateKernel",                    101,    # 5.5.1 - Creating Kernel Objects
   "clCreateKernelsInProgram",          102,    # 5.5.1 - Creating Kernel Objects
   "clRetainKernel",                    102,    # 5.5.1 - Creating Kernel Objects
   "clReleaseKernel",                   103,    # 5.5.1 - Creating Kernel Objects
   "clSetKernelArg",                    103,    # 5.5.2 - Setting Kernel Arguments
   "clGetKernelInfo",                   105,    # 5.5.3 - Kernel Object Queries
   "clGetKernelWorkGroupInfo",          106,    # 5.5.3 - Kernel Object Queries
   "clEnqueueNDRangeKernel",            109,    # 5.6 - Executing Kernels
   "clEnqueueTask",                     112,    # 5.6 - Executing Kernels
   "clEnqueueNativeKernel",             114,    # 5.6 - Executing Kernels
   "clWaitForEvents",                   116,    # 5.7 - Event Objects
   "clGetEventInfo",                    117,    # 5.7 - Event Objects
   "clRetainEvent",                     118,    # 5.7 - Event Objects
   "clReleaseEvent",                    119,    # 5.7 - Event Objects
   "clEnqueueMarker",                   121,    # 5.8 - Out-of-order Execution of Kernels and Memory Object Commands
   "clEnqueueWaitForEvents",            121,    # 5.8 - Out-of-order Execution of Kernels and Memory Object Commands
   "clEnqueueBarrier",                  121,    # 5.8 - Out-of-order Execution of Kernels and Memory Object Commands
   "clGetEventProfilingInfo",           123,    # 5.9 - Profiling Operations on Memory Objects and Kernels
   "clFlush",                           125,    # 5.10 - Flush and Finish
   "clFinish",                          125,    # 5.10 - Flush and Finish
   "scalarDataTypes",                   126,    # 6.1.1 - Built-in Scalar Data Types
   "vectorDataTypes",                   129,    # 6.1.2 - Built-in Vector Data Types
   "otherDataTypes",                    130,    # 6.1.3 - Other Built-in Data Types
   "sampler_t",                         130,    # 6.1.3 - Other Built-in Data Types
   "reservedDataTypes",                 130,    # 6.1.4 - Reserved Data Types
   "convert_T",                         137,    # 6.2.1 - Conversions and Type Casting
   "as_typen",                          141,    # 6.2.4.2 - Reinterpreting Types Using as_typen()
   "operators",                         143,    # 6.3 - Operators
   "addressSpaceQualifier",             150,    # 6.5 - Address Space Qualifiers
   "imageAccessQualifiers",             153,    # 6.6 - Image Access Qualifiers
   "functionQualifiers",                154,    # 6.7 - Function Qualifiers
   "restrictions",                      157,    # 6.8 - Restrictions
   "preprocessorDirectives",            160,    # 6.9 - Preprocessor Directives and Macros
   "attribute",                         162,    # 6.10. - Attribute Qualifiers
   "attributes-types",                  163,    # 6.10.1 - Specifying Attributes of Types
   "attributes-variables",              165,    # 6.10.3 - Specifying Attributes of Variables
   "attributes-blocksAndControlFlow",   167,    # 6.10.4 - Specifying Attributes of Blocks and Control-Flow-Statements
   "workItemFunctions",                 168,    # 6.11.1 - Work-Item Functions
   "mathConstants",                     175,    # 6.11.2 - Table at end of Math Functions
   "mathFunctions",                     170,    # 6.11.2 - Math Functions
   "FP_CONTRACT",                       175,    # 6.11.2.1 - Floating-point macros and pragmas for math.h
   "integerFunctions",                  177,    # 6.11.3 - Integer Functions
   "macroLimits",                       178,    # 6.11.3 - Content at end of Integer Functions
   "commonFunctions",                   180,    # 6.11.4 - Common Functions
   "geometricFunctions",                182,    # 6.11.5 - Geometric Functions
   "relationalFunctions",               184,    # 6.11.6 - Relational Functions
   "vectorDataLoadandStoreFunctions",   186,    # 6.11.7 - Vector Data Load and Store Functions
   "imageFunctions",                    190,    # 6.11.8 - Image Read and Write Functions
   "synchFunctions",                    199,    # 6.11.9 - Synchronization Functions
   "explicitMemoryFenceFunctions",      200,    # 6.11.10 - Explicit Memory Fence Functions
   "asyncCopyFunctions",                201,    # "6.11.11 - Async Copies from Global to Local Memory, Local to Global Memory, and Prefetch"
   "imageAddressFiltering",             212,    # 8.2 - Image Addressing and Filtering (There is no page for this but it is referenced in system)
   "EXTENSION",                         223,    # 9.1 - Compiler Directives for Optional Extensions
   "clGetExtensionFunctionAddress",     224,    # 9.2 - Getting OpenCL Extension Function Pointers
   "cl_khr_fp64",                       225,    # 9.3 - Double Precision Floating-Point
   "cl_khr_select_fprounding_mode",     242,    # 9.4 - Selecting Rounding Mode
   "SELECT_ROUNDING_MODE",              242,    # 9.4 - Selecting Rounding Mode
   "atomicFunctions",                   244,    # 9.5 - Atomic Functions for 32-bit integers
   "cl_khr_global_int32_base_atomics",  244,    # 9.5 - Atomic Functions for 32-bit integers
   "cl_khr_global_int32_extended_atomics",      245,    # 9.5 - Atomic Functions for 32-bit integers
   "cl_khr_local_int32_base_atomics",   246,    # 9.6 - Local Atomics for 32-bit integers
   "cl_khr_local_int32_extended_atomics",       247,    # 9.6 - Local Atomics for 32-bit integers
   "cl_khr_int64_base_atomics",         248,    # 9.7 - 64-bit Atomics
   "cl_khr_int64_extended_atomics",     249,    # 9.7 - 64-bit Atomics
   "cl_khr_3d_image_writes",            250,    # 9.8 - Writing to 3D image memory objects
   "cl_khr_byte_addressable_store",     252,    # 9.9 - Byte Addressable Stores
   "cl_khr_fp16",                       253,    # 9.10 - Half Floating-Point
   "clGetGLContextInfoKHR",             270,    # 9.11 - Creating CL context from a GL context or share group  
   "gl_sharing",                        279,    # B.1 - Sharing Memory Objects with OpenGL / OpenGL ES Buffer, Texture and Renderbuffer Objects"
   "clCreateFromGLBuffer",              280,    # B.1.2 - CL Buffer Objects -> GL Buffer Objects
   "clCreateFromGLTexture2D",           281,    # B.1.3 - CL Image Objects -> GL Textures
   "clCreateFromGLTexture3D",           282,    # B.1.3 - CL Image Objects -> GL Textures
   "clCreateFromGLRenderbuffer",        285,    # B.1.4 - CL Image Objects -> GL Renderbuffers
   "clGetGLObjectInfo",                 286,    # B.1.5 - Querying GL object information from a CL memory object
   "clGetGLTextureInfo",                286,    # B.1.5 - Querying GL object information from a CL memory object
   "clEnqueueAcquireGLObjects",         287,    # B.1.6 - Sharing memory objects that map to GL objects between GL and CL contexts
   "clEnqueueReleaseGLObjects",         289,    # B.1.6 - Sharing memory objects that map to GL objects between GL and CL contexts
   "references",                        301,    # 11 - References  (There is no page for this but it is referenced in system) 

}


###############################################################################
# Copy the specified file to the output, substituting any references to spec page numbers 
#
IO.foreach(ARGV[0]) do |line|
   puts line.sub(/(#namedest=)([^ ]*)(\")/) { |m|
      keyword = m.sub('"', "").sub(/#namedest=/, "")
      "#page=" + (Pagenums.has_key?(keyword) ? Pagenums.fetch(keyword).to_s : 
            abort("Spec page number for keyword " + keyword + " not found in " + $0)) + '"'
   }
end

