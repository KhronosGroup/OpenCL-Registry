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
   "classDiagram" =>                    19,     # 2.1 — OpenCL Class Diagram
   "clGetPlatformIDs" =>                32,     # 4.1 - Querying Platform Info
   "clGetPlatformInfo" =>               32,     # 4.1 - Querying Platform Info
   "clGetDeviceIDs" =>                  34,     # 4.2 - Querying Devices
   "clGetDeviceInfo" =>                 36,     # 4.2 - Querying Devices
   "clCreateContext" =>                 45,     # 4.3 - Contexts
   "clCreateContextFromType" =>         47,     # 4.3 - Contexts
   "clRetainContext" =>                 48,     # 4.3 - Contexts
   "clReleaseContext" =>                48,     # 4.3 - Contexts
   "clGetContextInfo" =>                49,     # 4.3 - Contexts
   "clCreateCommandQueue" =>            51,     # 5.1 - Command Queues
   "clRetainCommandQueue" =>            52,     # 5.1 - Command Queues
   "clReleaseCommandQueue" =>           53,     # 5.1 - Command Queues
   "clGetCommandQueueInfo" =>           53,     # 5.1 - Command Queues
   "clCreateBuffer" =>                  56,     # 5.2.1 - Creating Buffer Objects
   "clCreateSubBuffer" =>               58,     # 5.2.1 Creating Buffer Objects
   "clEnqueueReadBuffer" =>             60,     # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueWriteBuffer" =>            60,     # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueWriteBufferRect" =>        63,     # 5.2.2 Reading, Writing and Copying Buffer Objects
   "clEnqueueReadBufferRect" =>         63,     # 5.2.2 Reading, Writing and Copying Buffer Objects
   "clEnqueueCopyBuffer" =>             67,     # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueCopyBufferRect" =>         69,     # 5.2.2 Reading, Writing and Copying Buffer Objects
   "clEnqueueMapBuffer" =>              71,     # 5.2.3 - Mapping Buffer Objects
   "clCreateImage2D" =>                 74,     # 5.3.1 - Creating Image Objects
   "clCreateImage3D" =>                 76,     # 5.3.1 - Creating Image Objects
   "cl_image_format" =>                 78,     # 5.3.1.1 - Image Format Descriptor
   "clGetSupportedImageFormats" =>      80,     # 5.3.2 - Querying List of Supported Image Formats
   "clEnqueueReadImage" =>              82,     # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueWriteImage" =>             82,     # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImage" =>              86,     # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImageToBuffer" =>      88,     # 5.3.4 - Copying between Image and Buffer Objects
   "clEnqueueCopyBufferToImage" =>      90,     # 5.3.4 - Copying between Image and Buffer Objects
   "clEnqueueMapImage" =>               92,     # 5.3.5 - Mapping Image Objects
   "clGetImageInfo" =>                  95,     # 5.3.6 - Image Object Queries
   "clRetainMemObject" =>               97,     # 5.4.1 - Retaining and Releasing Memory Objects
   "clReleaseMemObject" =>              97,     # 5.4.1 - Retaining and Releasing Memory Objects
   "clSetMemObjectDestructorCallback" =>98,     # 5.4.1 Retaining and Releasing Memory Objects
   "clEnqueueUnmapMemObject" =>         99,     # 5.4.2 - Unmapping Mapped Memory Objects
   "clGetMemObjectInfo" =>              101,    # 5.4.3 - Memory Object Queries
   "clCreateSampler" =>                 104,    # 5.5.1 - Creating Sampler Objects
   "clRetainSampler" =>                 105,    # 5.5.1 - Creating Sampler Objects
   "clReleaseSampler" =>                105,    # 5.5.1 - Creating Sampler Objects
   "clGetSamplerInfo" =>                106,    # 5.5.2 - Sampler Object Queries
   "clCreateProgramWithSource" =>       108,    # 5.6.1 - Creating Program Objects
   "clCreateProgramWithBinary" =>       109,    # 5.6.1 - Creating Program Objects
   "clRetainProgram" =>                 111,    # 5.6.1 - Creating Program Objects
   "clReleaseProgram" =>                111,    # 5.6.1 - Creating Program Objects
   "clBuildProgram" =>                  112,    # 5.6.2 - Building Program Executables
   "clUnloadCompiler" =>                116,    # 5.6.4 - Unloading the OpenCL Compiler
   "clGetProgramInfo" =>                117,    # 5.6.5 - Program Object Queries
   "clGetProgramBuildInfo" =>           120,    # 5.6.5 - Program Object Queries
   "clCreateKernel" =>                  122,    # 5.7.1 - Creating Kernel Objects
   "clCreateKernelsInProgram" =>        123,    # 5.7.1 - Creating Kernel Objects
   "clRetainKernel" =>                  124,    # 5.7.1 - Creating Kernel Objects
   "clReleaseKernel" =>                 124,    # 5.7.1 - Creating Kernel Objects
   "clSetKernelArg" =>                  125,    # 5.7.2 - Setting Kernel Arguments
   "clGetKernelInfo" =>                 127,    # 5.7.3 - Kernel Object Queries
   "clGetKernelWorkGroupInfo" =>        128,    # 5.7.3 - Kernel Object Queries
   "clEnqueueNDRangeKernel" =>          131,    # 5.8 - Executing Kernels
   "clEnqueueTask" =>                   134,    # 5.8 - Executing Kernels
   "clEnqueueNativeKernel" =>           136,    # 5.8 - Executing Kernels
   "clCreateUserEvent" =>               139,    # 5.9 Event Objects
   "clSetUserEventStatus" =>            140,    # 5.9 Event Objects
   "clWaitForEvents" =>                 141,    # 5.9 - Event Objects
   "clGetEventInfo" =>                  142,    # 5.9 - Event Objects
   "clSetEventCallback" =>              144,    # 5.9 Event Objects
   "clRetainEvent" =>                   146,    # 5.9 - Event Objects
   "clReleaseEvent" =>                  146,    # 5.9 - Event Objects
   "clEnqueueMarker" =>                 149,    # 5.10 - Out-of-order Execution of Kernels and Memory...
   "clEnqueueWaitForEvents" =>          149,    # 5.10 - Out-of-order Execution of Kernels and Memory...
   "clEnqueueBarrier" =>                150,    # 5.10 - Out-of-order Execution of Kernels and Memory...
   "clGetEventProfilingInfo" =>         151,    # 5.11 - Profiling Operations on Memory Objects and Kernels
   "clFlush" =>                         154,    # 5.12 - Flush and Finish
   "clFinish" =>                        154,    # 5.13 - Flush and Finish
   "scalarDataTypes" =>                 156,    # 6.1.1 - Built-in Scalar Data Types
   "vectorDataTypes" =>                 159,    # 6.1.2 - Built-in Vector Data Types
   "otherDataTypes" =>                  160,    # 6.1.3 - Other Built-in Data Types
   "sampler_t" =>                       160,    # 6.1.3 - Other Built-in Data Types
   "reservedDataTypes" =>               160,    # 6.1.4 - Reserved Data Types
   "convert_T" =>                       167,    # 6.2 - Conversions and Type Casting
   "as_typen" =>                        172,    # 6.2.4.2 - Reinterpreting Types Using as_typen()
   "operators" =>                       175,    # 6.3 - Operators
   "addressSpaceQualifier" =>           182,    # 6.5 - Address Space Qualifiers
   "accessQualifiers" =>                186,    # 6.6 - Access Qualifiers
   "functionQualifiers" =>              187,    # 6.7 - Function Qualifiers
   "restrictions" =>                    190,    # 6.8 - Restrictions
   "preprocessorDirectives" =>          193,    # 6.9 - Preprocessor Directives and Macros
   "attribute" =>                       195,    # 6.10. - Attribute Qualifiers
   "attributes-types" =>                196,    # 6.10.1 - Specifying Attributes of Types
   "attributes-variables" =>            198,    # 6.10.3 - Specifying Attributes of Variables
   "attributes-blocksAndControlFlow" => 200,    # 6.10.4 - Specifying Attributes of Blocks and Control...
   "workItemFunctions" =>               201,    # 6.11.1 - Work-Item Functions
   "mathFunctions" =>                   203,    # 6.11.2 - Math Functions
   "mathConstants" =>                   208,    # 6.11.2 - Table at end of Math Functions
   "FP_CONTRACT" =>                     208,    # 6.11.2.1 - Floating-point macros and pragmas for math.h
   "integerFunctions" =>                211,    # 6.11.3 - Integer Functions
   "macroLimits" =>                     213,    # 6.11.3 - Content at end of Integer Functions
   "commonFunctions" =>                 214,    # 6.11.4 - Common Functions
   "geometricFunctions" =>              216,    # 6.11.5 - Geometric Functions
   "relationalFunctions" =>             218,    # 6.11.6 - Relational Functions
   "vectorDataLoadandStoreFunctions" => 220,    # 6.11.7 - Vector Data Load and Store Functions
   "synchFunctions" =>                  225,    # 6.11.8 - Synchronization Functions
   "explicitMemoryFenceFunctions" =>    226,    # 6.11.9 - Explicit Memory Fence Functions
   "asyncCopyFunctions" =>              227,    # 6.11.10 - Async Copies from Global to Local Memory...
   "atomicFunctions" =>                 229,    # 6.11.11 - Atomic Functions for 32-bit integers
   "miscVectorFunctions" =>             232,    # 6.11.12 Miscellaneous Vector Functions
   "imageFunctions" =>                  234,    # 6.11.13 - Image Read and Write Functions
   "imageAddressFiltering" =>           252,    # 8 - Image Addressing and Filtering 
   "EXTENSION" =>                       265,    # 9.1 - Compiler Directives for Optional Extensions
   "clGetExtensionFunctionAddress" =>   266,    # 9.2 - Getting OpenCL API Extension Function Pointers
   "cl_khr_fp64" =>                     268,    # 9.3 - Double Precision Floating-Point
   "cl_khr_int64_base_atomics" =>       286,    # 9.4 - 64-bit Atomics
   "cl_khr_int64_extended_atomics" =>   286,    # 9.4 - 64-bit Atomics
   "cl_khr_3d_image_writes" =>          288,    # 9.5 - Writing to 3D image memory objects
   "cl_khr_fp16" =>                     290,    # 9.6 - Half Floating-Point
   "clGetGLContextInfoKHR" =>           309,    # 9.7.5 - Additions to section 9.8 of the...  
   "gl_sharing" =>                      314,    # 9.8 - Sharing Memory Objects with OpenGL/OpenGL ES... 
   "clCreateFromGLBuffer" =>            315,    # 9.8.2 - CL Buffer Objects -> GL Buffer Objects
   "clCreateFromGLTexture2D" =>         316,    # 9.8.3 - CL Image Objects -> GL Textures
   "clCreateFromGLTexture3D" =>         317,    # 9.8.3 - CL Image Objects -> GL Textures
   "clCreateFromGLRenderbuffer" =>      320,    # 9.8.4 - CL Image Objects -> GL Renderbuffers
   "clGetGLObjectInfo" =>               321,    # 9.8.5 - Querying GL object information from a CL...
   "clGetGLTextureInfo" =>              322,    # 9.8.5 - Querying GL object information from a CL...
   "clEnqueueAcquireGLObjects" =>       323,    # 9.8.6 - Sharing memory objects that map to GL objects...
   "clEnqueueReleaseGLObjects" =>       324,    # 9.8.6 - Sharing memory objects that map to GL objects...
   "gl_event" =>                        327,    # 9.9 Creating CL event objects from GL sync objects
   "clCreateEventFromGLsyncKHR" =>      327,    # 9.9 Creating CL event objects from GL sync objects
   "cl_khr_d3d10_sharing" =>            329,    # 9.10 Sharing Memory Objects with Direct3D 10
   "clGetDeviceIDsFromD3D10KHR" =>      337,    # 9.10.7.1 Querying OpenCL Devices Corresponding to...
   "clCreateFromD3D10BufferKHR" =>      339,    # 9.10.7.3 Sharing Direct3D 10 Buffer Resources as OpenCL...
   "clCreateFromD3D10Texture2DKHR" =>   340,    # 9.10.7.4 Sharing Direct3D 10 Texture and Resources...
   "clCreateFromD3D10Texture3DKHR" =>   341,    # 9.10.7.4 Sharing Direct3D 10 Texture and...
   "clEnqueueAcquireD3D10ObjectsKHR" => 343,    # 9.10.7.6 Sharing memory objects created from...
   "clEnqueueReleaseD3D10ObjectsKHR" => 345,    # 9.10.7.6 Sharing memory objects created from...
   "referenceWong" =>                   361,    # 11 - References (to Wong paper)  
   "clSetCommandQueueProperty" =>       377,    # F.1 - Summary of changes from OpenCL 1.0
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

