#!/usr/bin/ruby

# for Ruby 1.9

# WARNING: page numbers are out of date with currently published CL 2.0 spec.

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
# the keyword to the lookup table below with the corresponding page number from
# the Spec.
#
# For example to link to the spec section for gl_sharing, use:
#
#    <olink uri="gl_sharing">OpenCL Specification</olink>
#
# The xsltproc program generates a temporary HTML file where the XML line above
# is transformed into a line containing a placeholder URL:
#
#    <a href="http://www.khronos.org/registry/cl/specs/opencl-XXX.pdf#namedest=gl_sharing">
#	    OpenCL Specification</a>
#
# When this lookup program is run on the temporary HTML file, it will look up the
# keyword and replace the placeholder text in the HTML file with the final URL.
# The final URL is specified below in Specnames. This transforms the placeholder
# line into the final form, in this manner:
#
#    <a href="http://www.khronos.org/registry/cl/specs/opencl-2.0.pdf#page=279">
#	    OpenCL Specification</a>
#
# (You can control what the first part of the URL is by modifying the SpecBaseUrl
# variable in the opencl-man.xsl file.)


# Here are the real spec filenames of the OpenCL 2.0 spec documents (see comments above):

Core = "opencl-2.0.pdf"
Ext  = "opencl-2.0-extensions.pdf"
CLan = "opencl-2.0-openclc.pdf"


###############################################################################
# Spec page number mapping here. First string in quotes. Commas between values.
# The comments are for reference to see where this content can be found in the spec.
#
Pagenums = {
   "classDiagram" =>			  [Core, 1],	   # 2.1 - OpenCL Class Diagram
   "clGetPlatformIDs" =>		  [Core, 56],	   # 4.1 - Querying Platform Info
   "clGetPlatformInfo" =>		  [Core, 56],	   # 4.1 - Querying Platform Info
   "clGetDeviceIDs" =>			  [Core, 58],	   # 4.2 - Querying Devices
   "clGetDeviceInfo" =>			  [Core, 60],	   # 4.2 - Querying Devices
   "cl_khr_fp64" =>			  [Core, 72],	   # 4.2 - Querying Devices
   "clCreateSubDevices" =>		  [Core, 76],	   # 4.3 - Partitioning a Device
   "clRetainDevice" =>			  [Core, 79],	   # 4.3 - Partitioning a Device
   "clReleaseDevice" =>			  [Core, 79],	   # 4.3 - Partitioning a Device
   "clCreateContext" =>			  [Core, 81],	   # 4.4 - Contexts
   "clCreateContextFromType" =>		  [Core, 83],	   # 4.4 - Contexts
   "clRetainContext" =>			  [Core, 84],	   # 4.4 - Contexts
   "clReleaseContext" =>		  [Core, 84],	   # 4.4 - Contexts
   "clGetContextInfo" =>		  [Core, 85],	   # 4.4 - Contexts
   "clCreateCommandQueueWithProperties" => [Core, 88],	    # 5.1 - Command Queues
   "clRetainCommandQueue" =>		  [Core, 90],	   # 5.1 - Command Queues
   "clReleaseCommandQueue" =>		  [Core, 91],	   # 5.1 - Command Queues
   "clGetCommandQueueInfo" =>		  [Core, 91],	   # 5.1 - Command Queues
   "clCreateBuffer" =>			  [Core, 94],	   # 5.2.1 - Creating Buffer Objects
   "clCreateSubBuffer" =>		  [Core, 97],	   # 5.2.1 - Creating Buffer Objects
   "clEnqueueReadBuffer" =>		  [Core, 100],	   # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueWriteBuffer" =>		  [Core, 100],	   # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueReadBufferRect" =>		  [Core, 102],	    # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueWriteBufferRect" =>	  [Core, 103],	    # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueCopyBuffer" =>		  [Core, 107],	    # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueCopyBufferRect" =>		  [Core, 109],	    # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueFillBuffer" =>		  [Core, 112],	    # 5.2.3 - Filling Buffer Objects
   "clEnqueueMapBuffer" =>		  [Core, 114],	    # 5.2.4 - Mapping Buffer Objects
   "clCreateImage" =>			  [Core, 118],	    # 5.3.1 - Creating Image Objects
   "cl_image_format" =>			  [Core, 121],	    # 5.3.1.1 - Image Format Descriptor
   "cl_image_desc" =>			  [Core, 124],	    # 5.3.1.2 - Image Descriptor
   "clGetSupportedImageFormats" =>	  [Core, 126],	    # 5.3.2 - Querying List of Supported Image Formats
   "supportedImageFormats" =>		  [Core, 127],	    # 5.3.2.1 - Minimum List of Supported Image Formats
   "clEnqueueReadImage" =>		  [Core, 129],	    # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueWriteImage" =>		  [Core, 129],	    # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImage" =>		  [Core, 133],	   # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueFillImage" =>		  [Core, 136],	   # 5.3.4 - Filling Image Objects
   "clEnqueueCopyImageToBuffer" =>	  [Core, 138],	   # 5.3.5 - Copying between Image and Buffer Objects
   "clEnqueueCopyBufferToImage" =>	  [Core, 140],	   # 5.3.5 - Copying between Image and Buffer Objects
   "clEnqueueMapImage" =>		  [Core, 143],	   # 5.3.6 - Mapping Image Objects
   "clGetImageInfo" =>			  [Core, 146],	   # 5.3.7 - Image Object Queries
   "clCreatePipe" =>			  [Core, 149],	   # 5.4.1 - Creating Pipe Objects
   "pipeFunctions" =>			  [Core, 149],	   # 5.4.1 - Creating Pipe Objects
   "clGetPipeInfo" =>			  [Core, 150],	   # 5.4.2 - Pipe Object Queries
   "clRetainMemObject" =>		  [Core, 152],	   # 5.5.1 - Retaining and Releasing Memory Objects
   "clReleaseMemObject" =>		  [Core, 152],	   # 5.5.1 - Retaining and Releasing Memory Objects
   "clSetMemObjectDestructorCallback" =>  [Core, 153],	   # 5.5.1 - Retaining and Releasing Memory Objects
   "clEnqueueUnmapMemObject" =>		  [Core, 154],	   # 5.5.2 - Unmapping Mapped Memory Objects
   "clEnqueueMigrateMemObjects" =>	  [Core, 157],	   # 5.5.4 - Migrating Memory Objects
   "clGetMemObjectInfo" =>		  [Core, 159],	   # 5.5.5 - Memory Object Queries
   "sharedVirtualMemory" =>		  [Core, 163],	   # 5.6 - Shared Virtual Memory
   "clSVMAlloc" =>			  [Core, 164],	   # 5.6.1 - SVM Sharing
   "clSVMFree" =>			  [Core, 167],	   # 5.6.1 - SVM Sharing
   "clEnqueueSVMFree" =>		  [Core, 168],	   # 5.6.2 - Enqueuing SVM Operations
   "clEnqueueSVMMemcpy" =>		  [Core, 169],	   # 5.6.2 - Enqueuing SVM Operations
   "clEnqueueSVMMemFill" =>		  [Core, 171],	   # 5.6.2 - Enqueuing SVM Operations
   "clEnqueueSVMMap" =>			  [Core, 173],	   # 5.6.2 - Enqueuing SVM Operations
   "clEnqueueSVMUnmap" =>		  [Core, 174],	   # 5.6.2 - Enqueuing SVM Operations
   "clCreateSamplerWithProperties" =>	  [Core, 178],	   # 5.7.1 - Creating Sampler Objects
   "clRetainSampler" =>			  [Core, 179],	   # 5.7.1 - Creating Sampler Objects
   "clReleaseSampler" =>		  [Core, 180],	   # 5.7.1 - Creating Sampler Objects
   "clGetSamplerInfo" =>		  [Core, 180],	   # 5.7.2 - Sampler Object Queries
   "clCreateProgramWithSource" =>	  [Core, 182],	   # 5.8.1 - Creating Program Objects
   "clCreateProgramWithBinary" =>	  [Core, 183],	   # 5.8.1 - Creating Program Objects
   "clCreateProgramWithBuiltInKernels" => [Core, 185],	   # 5.8.1 - Creating Program Objects
   "clRetainProgram" =>			  [Core, 186],	   # 5.8.1 - Creating Program Objects
   "clReleaseProgram" =>		  [Core, 186],	   # 5.8.1 - Creating Program Objects
   "clBuildProgram" =>			  [Core, 187],	   # 5.8.2 - Building Program Executables
   "clCompileProgram" =>		  [Core, 189],	   # 5.8.3 - Separate Compilation and Linking of Programs
   "clLinkProgram" =>			  [Core, 192],	   # 5.8.3 - Separate Compilation and Linking of Programs
   "clUnloadPlatformCompiler" =>	  [Core, 200],	   # 5.8.6 - Unloading the OpenCL Compiler
   "clGetProgramInfo" =>		  [Core, 201],	   # 5.8.7 - Program Object Queries (updated for 1.2 rev 14)
   "clGetProgramBuildInfo" =>		  [Core, 204],	   # 5.8.7 - Program Object Queries
   "clCreateKernel" =>			  [Core, 208],	   # 5.9.1 - Creating Kernel Objects
   "clCreateKernelsInProgram" =>	  [Core, 209],	   # 5.9.1 - Creating Kernel Objects
   "clRetainKernel" =>			  [Core, 210],	   # 5.9.1 - Creating Kernel Objects
   "clReleaseKernel" =>			  [Core, 210],	   # 5.9.1 - Creating Kernel Objects
   "clSetKernelArg" =>			  [Core, 211],	   # 5.9.2 - Setting Kernel Arguments
   "clSetKernelArgSVMPointer" =>	  [Core, 216],	   # 5.9.2 - Setting Kernel Arguments
   "clSetKernelExecInfo" =>		  [Core, 214],	   # 5.9.2 - Setting Kernel Arguments
   "clGetKernelInfo" =>			  [Core, 217],	   # 5.9.3 - Kernel Object Queries (updated for 1.2 rev 14)
   "clGetKernelWorkGroupInfo" =>	  [Core, 218],	   # 5.9.3 - Kernel Object Queries
   "clGetKernelArgInfo" =>		  [Core, 221],	   # 5.9.3 - Kernel Object Queries (updated for 1.2 rev 14)
   "clEnqueueNDRangeKernel" =>		  [Core, 224],	   # 5.10 - Executing Kernels (updated for 1.2 rev 14)
   "clEnqueueNativeKernel" =>		  [Core, 228],	   # 5.10 - Executing Kernels (updated for 1.2 rev 14)
   "clCreateUserEvent" =>		  [Core, 232],	   # 5.11 - Event Objects
   "clSetUserEventStatus" =>		  [Core, 232],	   # 5.11 - Event Objects
   "clWaitForEvents" =>			  [Core, 233],	   # 5.11 - Event Objects
   "clGetEventInfo" =>			  [Core, 234],	   # 5.11 - Event Objects
   "clSetEventCallback" =>		  [Core, 237],	   # 5.11 - Event Objects
   "clRetainEvent" =>			  [Core, 239],	   # 5.11 - Event Objects
   "clReleaseEvent" =>			  [Core, 239],	   # 5.11 - Event Objects
   "clEnqueueMarkerWithWaitList" =>	  [Core, 241],	   # 5.12 - Markers, Barriers and Waiting for Events
   "clEnqueueBarrierWithWaitList" =>	  [Core, 242],	   # 5.12 - Markers, Barriers and Waiting for Events
   "clGetEventProfilingInfo" =>		  [Core, 245],	   # 5.14 - Profiling Operations on Memory Objects and Kernels
   "clFlush" =>				  [Core, 248],	   # 5.15 - Flush and Finish
   "clFinish" =>			  [Core, 248],	   # 5.15 - Flush and Finish
   "deprecated" =>			  [Core, 278],	   # F - Changes
   "scalarDataTypes" =>			  [CLan,   6],	   # 6.1.1 - Built-in Scalar Data Types
   "vectorDataTypes" =>			  [CLan,   9],	   # 6.1.2 - Built-in Vector Data Types
   "otherDataTypes" =>			  [CLan,  10],	   # 6.1.3 - Other Built-in Data Types
   "reservedDataTypes" =>		  [CLan,  11],	   # 6.1.4 - Reserved Data Types
   "convert_T" =>			  [CLan,  20],	   # 6.2.3 - Explicit Conversions
   "as_typen" =>			  [CLan,  24],	   # 6.2.4.2 - Reinterpreting Types Using as_typen()
   "operators" =>			  [CLan,  27],	   # 6.3 - Operators
   "addressSpaceQualifiers" =>		  [CLan,  34],	   # 6.5 - Address Space Qualifiers
   "genericAddressSpace" =>		  [CLan,  38],	   # 6.5.5 - The generic address space
   "accessQualifiers" =>		  [CLan,  46],	   # 6.6 - Access Qualifiers
   "functionQualifiers" =>		  [CLan,  47],	   # 6.7 - Function Qualifiers
   "storageQualifiers" =>		  [CLan,  50],	   # 6.8 - Storage-class Qualifiers
   "restrictions" =>			  [CLan,  51],	   # 6.9 - Restrictions
   "preprocessorDirectives" =>		  [CLan,  54],	   # 6.10 - Preprocessor Directives and Macros
   "attribute" =>			  [CLan,  56],	   # 6.11 - Attribute Qualifiers
   "attributes-types" =>		  [CLan,  57],	   # 6.11.1 - Specifying Attributes of Types
   "attributes-variables" =>		  [CLan,  59],	   # 6.11.3 - Specifying Attributes of Variables
   "attributes-blocksAndControlFlow" =>   [CLan,  61],	   # 6.11.4 - Specifying Attributes of Blocks and Control...
   "attributes-loopUnroll" =>		  [CLan,  61],	   # 6.11.5 - Specifying Attribute For Unrolling Loops
   "blocks" =>				  [CLan,  64],	   # 6.12 - Blocks
   "workItemFunctions" =>		  [CLan,  68],	   # 6.13.1 - Work-Item Functions
   "mathFunctions" =>			  [CLan,  71],	   # 6.13.2 - Math Functions
   "FP_CONTRACT" =>			  [CLan,  77],	   # 6.13.2.1 - Floating-point macros and pragmas
   "mathConstants" =>			  [CLan,  79],	   # 6.13.2 - Table at end of Math Functions
   "macroLimits" =>			  [CLan,  80],	   # 6.13.2.1 - Floating-point macros and pragmas
   "integerFunctions" =>		  [CLan,  81],	   # 6.13.3 - Integer Functions
   "commonFunctions" =>			  [CLan,  85],	   # 6.13.4 - Common Functions
   "geometricFunctions" =>		  [CLan,  87],	   # 6.13.5 - Geometric Functions
   "relationalFunctions" =>		  [CLan,  89],	   # 6.13.6 - Relational Functions
   "vectorDataLoadandStoreFunctions" =>   [CLan,  92],	   # 6.13.7 - Vector Data Load and Store Functions
   "syncFunctions" =>			  [CLan,  96],	   # 6.13.8 - Synchronization Functions
   "work_group_barrier" =>		  [CLan,  96],	   # 6.13.8 - Synchronization and Memory Fence Functions
   "addressSpaceQualifierFuncs" =>	  [CLan,  98],	   # 6.13.9 - Address Space Qualifier Functions
   "asyncCopyFunctions" =>		  [CLan,  99],	   # 6.13.10 - Async Copies
   "atomicFunctions" =>			  [CLan, 102],	   # 6.13.11 - Atomic Functions
   "ATOMIC_VAR_INIT" =>			  [CLan, 103],	   # 6.13.11.1 - The ATOMIC_VAR_INIT macro
   "atomic_init" =>			  [CLan, 103],	   # 6.13.11.2 - The atomic_init generic function
   "memory_order" =>			  [CLan, 104],	   # 6.13.11.3 - Order and Consistency
   "memory_scope" =>			  [CLan, 104],	   # 6.13.11.4 - Memory Scope
   "atomic_work_item_fence" =>		  [CLan, 104],	   # 6.13.11.5.1 - The atomic_flag_clear functions
   "atomic_store" =>			  [CLan, 106],	   # 6.13.11.7.1 - The atomic_store generic functions
   "atomic_load" =>			  [CLan, 106],	   # 6.13.11.7.2 - The atomic_load generic functions
   "atomic_exchange" =>			  [CLan, 107],	   # 6.13.11.7.3 - The atomic_exchange generic functions
   "atomic_compare_exchange" =>		  [CLan, 107],	   # 6.13.11.7.4 - The atomic_compare_exchange generic functions
   "atomic_fetch_key" =>		  [CLan, 108],	   # 6.13.11.7.5 - The atomic_fetch and modify generic functions
   "atomic_flag" =>			  [CLan, 109],	   # 6.13.11.7.6 - The atomic_flag type and operations
   "atomic_flag_test_and_set" =>	  [CLan, 110],	   # 6.13.11.7.7 - The atomic_flag_test_and_set functions
   "atomic_flag_clear" =>		  [CLan, 110],	   # 6.13.11.7.8 - The atomic_flag_clear functions
   "miscVectorFunctions" =>		  [CLan, 112],	   # 6.13.12 - Miscellaneous Vector Functions
   "printfFunction" =>			  [CLan, 114],	   # 6.13.13 - printf
   "sampler_t" =>			  [CLan, 122],	   # 6.13.14.1 - Samplers
   "cl_khr_srgb_image_writes" =>	  [CLan, 125],	   # 6.13.14.1.2 - sRGB Images
   "imageFunctions" =>			  [CLan, 126],	   # 6.13.14 - Image Read and Write Functions
   "imageQueryFunctions" =>		  [CLan, 147],	   # 6.13.14.5 - Built-in Image Query Functions
   "work_group_all" =>			  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "work_group_any" =>			  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "work_group_broadcast" =>		  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "work_group_reduce" =>		  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "work_group_scan_exclusive" =>	  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "work_group_scan_inclusive" =>	  [CLan, 152],	   # 6.13.15 - Work-group Functions
   "read_pipe" =>			  [CLan, 155],	   # 6.13.16.2 - Built-in Pipe Read and Write Functions
   "write_pipe" =>			  [CLan, 156],	   # 6.13.16.2 -
   "reserve_read_pipe" =>		  [CLan, 156],	   # 6.13.16.2 -
   "reserve_write_pipe" =>		  [CLan, 156],	   # 6.13.16.2 -
   "commit_read_pipe" =>		  [CLan, 156],	   # 6.13.16.2 -
   "commit_write_pipe" =>		  [CLan, 157],	   # 6.13.16.2 -
   "is_valid_reserve_id" =>		  [CLan, 157],	   # 6.13.16.2 -
   "work_group_reserve_read_pipe" =>	  [CLan, 157],	   # 6.13.16.3 - Built-in Work-group Pipe Read and Write Functions
   "work_group_reserve_write_pipe" =>	  [CLan, 157],	   # 6.13.16.3 -
   "work_group_commit_read_pipe" =>	  [CLan, 157],	   # 6.13.16.3 -
   "work_group_commit_write_pipe" =>	  [CLan, 157],	   # 6.13.16.3 -
   "get_pipe_num_packets" =>		  [CLan, 158],	   # 6.13.16.4 - Built-in Pipe Query Functions
   "get_pipe_max_packets" =>		  [CLan, 158],	   # 6.13.16.4 -
   "enqueueKernelFunctions" =>		  [CLan, 160],	   # 6.13.17 - Enqueuing Kernels
   "kernelQueryFunctions" =>		  [CLan, 167],	   # 6.13.17.6 - Built-in Functions – Kernel Query Functions
   "enqueue_marker" =>			  [CLan, 168],	   # 6.13.17.7 - Built-in Functions – Queuing other commands
   "eventFunctions" =>			  [CLan, 169],	   # 6.13.17.8 - Built-in Functions – Event Functions
   "helperFunctions" =>			  [CLan, 172],	   # 6.13.17.9 - built-in helper functions
   "referenceWong" =>			  [CLan,   1],	   # 11 - [ References (to Wong paper) ] which says it's in: "sections 16-17 in section 11 - References"
   "EXTENSION" =>			  [Ext, 6],	   # 9.1 - Compiler Directives for Optional Extensions
   "clGetExtensionFunctionAddressForPlatform" => [Ext, 8], # 9.2 - Getting OpenCL API Extension Function Pointers
   "cl_khr_int64_base_atomics" =>	  [Ext, 11],	   # 9.3 - 64-bit Atomics
   "cl_khr_int64_extended_atomics" =>	  [Ext, 11],	   # 9.3 - 64-bit Atomics
   "cl_khr_fp16" =>			  [Ext, 13],	   # 9.4 - Half Floating-Point
   "imageFunctionsHalf" =>		  [Ext, 24],	   # 9.4.8 - Image Read and Write Functions (half)
   "cl_khr_3d_image_writes" =>		  [Ext, 33],	   # 9.4.8 - Image Read and Write Functions (half) [in footnote only]
   "cl_khr_gl_sharing" =>		  [Ext, 37],	   # 9.5 - Creating CL context from a GL context or share group
   "clGetGLContextInfoKHR" =>		  [Ext, 41],	   # 9.5.5 - Additions to section 9.8 of the...
   "clCreateFromGLBuffer" =>		  [Ext, 47],	   # 9.6.2 - CL Buffer Objects -> GL Buffer Objects
   "clCreateFromGLTexture" =>		  [Ext, 48],	   # 9.6.3 - CL Image Objects -> GL Textures
   "clCreateFromGLRenderbuffer" =>	  [Ext, 51],	   # 9.6.4 - CL Image Objects -> GL Renderbuffers
   "clGetGLObjectInfo" =>		  [Ext, 53],	   # 9.6.5 - Querying GL object information from a CL...
   "clGetGLTextureInfo" =>		  [Ext, 54],	   # 9.6.5 - Querying GL object information from a CL...
   "clEnqueueAcquireGLObjects" =>	  [Ext, 55],	   # 9.6.6 - Sharing memory objects that map to GL objects...
   "clEnqueueReleaseGLObjects" =>	  [Ext, 56],	   # 9.6.6 - Sharing memory objects that map to GL objects...
   "cl_khr_gl_event" =>			  [Ext, 59],	   # 9.7 - Creating CL event objets
   "clCreateEventFromGLsyncKHR" =>	  [Ext, 60],	   # 9.7.4 - Additions to Chapter 5
   "cl_khr_d3d10_sharing" =>		  [Ext, 64],	   # 9.8 - Sharing Memory Objects with Direct3D 10
   "clGetDeviceIDsFromD3D10KHR" =>	  [Ext, 69],	   # 9.8.7.1 - Querying OpenCL Devices Corresponding to... 11...
   "clCreateFromD3D10BufferKHR" =>	  [Ext, 71],	   # 9.8.7.3 - Sharing Direct3D 10 Buffer Resources as OpenCL...
   "clCreateFromD3D10Texture2DKHR" =>	  [Ext, 72],	   # 9.8.7.4 - Sharing Direct3D 10 Texture and Resources...
   "clCreateFromD3D10Texture3DKHR" =>	  [Ext, 73],	   # 9.8.7.4 - Sharing Direct3D 10 Texture and...
   "clEnqueueAcquireD3D10ObjectsKHR" =>   [Ext, 75],	   # 9.8.7.6 - Sharing memory objects created from Direct3D 10..
   "clEnqueueReleaseD3D10ObjectsKHR" =>   [Ext, 77],	   # 9.8.7.6 - Sharing memory objects created from...
   "cl_khr_dx9_media_sharing" =>	  [Ext, 81],	   # 9.9 - DX9 Media Surface Sharing
   "clGetDeviceIDsFromDX9MediaAdapterKHR" => [Ext, 85],    # 9.9.7.1 - Querying OpenCL Devices corresponding....
   "clCreateFromDX9MediaSurfaceKHR" =>	  [Ext, 87],	   # 9.9.7.2 Creating Media Resources as OpenCL Image Objects
   "clEnqueueAcquireDX9MediaSurfacesKHR" => [Ext, 89],	   # 9.9.7.4 - Sharing Memory Objects created from Media Surfaces
   "clEnqueueReleaseDX9MediaSurfacesKHR" => [Ext, 91],	   # 9.9.7.4 - Sharing Memory Objects...
   "cl_khr_d3d11_sharing" =>		  [Ext, 95],	   # 9.10 - Sharing Memory Objects with Direct3D 11
   "clGetDeviceIDsFromD3D11KHR" =>	  [Ext, 100],	   # 9.10.7.1 - Querying OpenCL Devices Corresponding to Direct3D
   "clCreateFromD3D11BufferKHR" =>	  [Ext, 102],	   # 9.10.7.3 - Sharing Direct3D 11 Buffer Resources
   "clCreateFromD3D11Texture2DKHR" =>	  [Ext, 103],	   # 9.10.7.4 - Sharing Direct3D 11 Texture and Resources...
   "clCreateFromD3D11Texture3DKHR" =>	  [Ext, 104],	   # 9.10.7.4 - Sharing Direct3D 11 Texture and Resources....
   "clEnqueueAcquireD3D11ObjectsKHR" =>   [Ext, 106],	   # 9.10.7.6 - Sharing memory objects created from Direct3D 11...
   "clEnqueueReleaseD3D11ObjectsKHR" =>   [Ext, 108],	   # 9.10.7.6 - Sharing memory objects created from Direct3D 11...
   "cl_khr_gl_depth_images" =>		  [Ext, 111],	   # 9.11 - Sharing OpenGL and OpenGL ES Depth and Depth-Stencil Images
   "cl_khr_gl_msaa_sharing" =>		  [Ext, 113],	   # 9.12 - Sharing of CL / GL MSAA Textures
   "get_image_num_samples" =>		  [Ext, 119],	    # 9.12.3 - Additions to Chapter 6 for MSAA
   "cl_khr_initialize_memory" =>	  [Ext, 120],	   # 9.13 - Local and Private Memory Initialization
   "cl_khr_terminate_context" =>	  [Ext, 122],	   # 9.14 - Terminiating OpenCL contexts
   "clTerminateContextKHR" =>		  [Ext, 123],	   # 9.14 - Terminiating OpenCL contexts
   "cl_khr_spir" =>			  [Ext, 125],	   # 9.15 - SPIR Binaries
   "cl_khr_icd" =>			  [Ext, 127],	   # 9.16 - OpenCL Installable Client Driver (ICD)
   "clIcdGetPlatformIDsKHR" =>		  [Ext, 130],	   # 9.16.9 - Additions to chapter 4...
   "cl_khr_subgroups" =>		  [Ext, 133],	   # 9.17 - Sub-groups
   "clGetKernelSubGroupInfoKHR" =>	  [Ext, 134],	   # 9.17 - Sub-groups
   "get_sub_group_size" =>		  [Ext, 136],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "get_enqueued_num_sub_groups" =>	  [Ext, 136],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "get_max_sub_group_size" =>		  [Ext, 136],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "get_num_sub_groups" =>		  [Ext, 136],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "get_sub_group_id" =>		  [Ext, 137],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "get_sub_group_local_id" =>		  [Ext, 137],	   # 9.17.3.1 - Additions to section 6.13.1 – Work-Item Functions
   "sub_group_barrier" =>		  [Ext, 137],	   # 9.17.3.2 - Additions to section 6.13.8 – Synchronization Functions
   "sub_group_all" =>			  [Ext, 138],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_any" =>			  [Ext, 138],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_broadcast" =>		  [Ext, 139],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_reduce" =>		  [Ext, 139],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_scan_exclusive" =>	  [Ext, 139],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_scan_inclusive" =>	  [Ext, 139],	   # 9.17.3.4 - Additions to section 6.13.15 – Work-group Functions
   "sub_group_reserve_read_pipe" =>	  [Ext, 139],	   # 9.17.3.5 - Additions to section 6.13.16 – Pipe Functions
   "sub_group_reserve_write_pipe" =>	  [Ext, 139],	   # 9.17.3.5 - Additions to section 6.13.16 – Pipe Functions
   "sub_group_commit_read_pipe" =>	  [Ext, 140],	   # 9.17.3.5 - Additions to section 6.13.16 – Pipe Functions
   "sub_group_commit_write_pipe" =>	  [Ext, 140],	   # 9.17.3.5 - Additions to section 6.13.16 – Pipe Functions
   "get_kernel_sub_group_count_for_ndrange" => [Ext, 140],	# 9.17.3.6 - Additions to section 6.13.17.6 – Enqueuing Kernels(Kernel Query
   "get_kernel_max_sub_group_size_for_ndrange" => [Ext, 140],	   # 9.17.3.6 - Additions to section 6.13.17.6 – Enqueuing Kernels(Kernel Query
   "cl_khr_mipmap_image" =>		  [Ext, 141],	   # 9.18 - Mipmaps
   "get_image_num_mip_levels" =>	  [Ext, 149],	   # 9.18.2.1 - Additions to section 6.13.14 – Image Read, Write and Query...
   "cl_khr_egl_image" =>		  [Ext, 151],	   # 9.19 - Creating CL image objects from EGL images
   "clCreateFromEGLImageKHR" =>		  [Ext, 152],	   # 9.19.4 - Additions to Chapter 5 of the OpenCL 2.0 Specification
   "clEnqueueAcquireEGLObjectsKHR" =>	  [Ext, 154],	   # 9.19.4 - Additions to Chapter 5 of the OpenCL 2.0 Specification
   "clEnqueueReleaseEGLObjectsKHR" =>	  [Ext, 155],	   # 9.19.4 - Additions to Chapter 5 of the OpenCL 2.0 Specification
   "cl_khr_egl_event" =>		  [Ext, 159],	   # 9.20 - Creating CL event objects from EGL sync objects
   "clCreateEventFromEGLsyncKHR" =>	  [Ext, 160],	   # 9.20.4 - Additions to Chapter 5 of the OpenCL 2.0 Specification
}


###############################################################################
# Copy the specified file to the output, substituting any references to spec page numbers
#
IO.foreach(ARGV[0]) do |line|
   if line.match("namedest=")
      keyword = line.sub(/^.*namedest=/, "").sub(/\".*$/, "").chomp.rstrip
      if Pagenums.has_key?(keyword)
	 specName = Pagenums.fetch(keyword)[0]
	 pageNum = Pagenums.fetch(keyword)[1]
	 #puts "specName=" + specName + ", pageNum=" + pageNum.to_s
	 puts line.sub(/namedest=[^\s]*\"/, "page=" + pageNum.to_s + '"').sub(/opencl-1.x-latest.pdf/, specName)
      else
	 abort("Spec page number for keyword \"" + keyword + "\" not found in " + $0) + '"'
      end
   else
      puts line
   end
end

