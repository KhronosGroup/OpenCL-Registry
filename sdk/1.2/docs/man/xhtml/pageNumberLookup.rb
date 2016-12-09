#!/usr/bin/ruby

# for Ruby 1.9

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
#           OpenCL Specification</a>  
#
# When this lookup program is run on the temporary HTML file, it will look up the
# keyword and replace the placeholder text in the HTML file with the final URL.
# The final URL is specified below in Specnames. This transforms the placeholder
# line into the final form, in this manner:
#
#    <a href="http://www.khronos.org/registry/cl/specs/opencl-1.2.pdf#page=279">
#           OpenCL Specification</a>
#
# (You can control what the first part of the URL is by modifying the SpecBaseUrl 
# variable in the opencl-man.xsl file.) 


# Here are the real spec filenames of the OpenCL 1.2 spec documents (see comments above):

Core = "opencl-1.2.pdf"
Ext  = "opencl-1.2-extensions.pdf"


###############################################################################
# Spec page number mapping here. First string in quotes. Commas between values.
# The comments are for reference to see where this content can be found in the spec.
#
Pagenums = {
   "classDiagram" =>                      [Core, 20],      # 2.1 - OpenCL Class Diagram
   "clGetPlatformIDs" =>                  [Core, 33],      # 4.1 - Querying Platform Info
   "clGetPlatformInfo" =>                 [Core, 33],      # 4.1 - Querying Platform Info
   "clGetDeviceIDs" =>                    [Core, 35],      # 4.2 - Querying Devices
   "clGetDeviceInfo" =>                   [Core, 37],      # 4.2 - Querying Devices
   "cl_khr_fp64" =>                       [Core, 46],      # 4.2 - Querying Devices
   "clCreateSubDevices" =>                [Core, 49],      # 4.3 - Partitioning a Device
   "clRetainDevice" =>                    [Core, 52],      # 4.3 - Partitioning a Device
   "clReleaseDevice" =>                   [Core, 52],      # 4.3 - Partitioning a Device
   "clCreateContext" =>                   [Core, 54],      # 4.4 - Contexts
   "clCreateContextFromType" =>           [Core, 56],      # 4.4 - Contexts
   "clRetainContext" =>                   [Core, 57],      # 4.4 - Contexts
   "clReleaseContext" =>                  [Core, 57],      # 4.4 - Contexts
   "clGetContextInfo" =>                  [Core, 58],      # 4.4 - Contexts
   "clCreateCommandQueue" =>              [Core, 61],      # 5.1 - Command Queues
   "clRetainCommandQueue" =>              [Core, 62],      # 5.1 - Command Queues
   "clReleaseCommandQueue" =>             [Core, 63],      # 5.1 - Command Queues
   "clGetCommandQueueInfo" =>             [Core, 63],      # 5.1 - Command Queues
   "clCreateBuffer" =>                    [Core, 66],      # 5.2.1 - Creating Buffer Objects
   "clCreateSubBuffer" =>                 [Core, 69],      # 5.2.1 - Creating Buffer Objects
   "clEnqueueReadBuffer" =>               [Core, 72],      # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueWriteBuffer" =>              [Core, 72],      # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueReadBufferRect" =>           [Core, 74],      # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueWriteBufferRect" =>          [Core, 75],      # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueCopyBuffer" =>               [Core, 79],      # 5.2.2 - Reading, Writing, Copying Buffer Objects
   "clEnqueueCopyBufferRect" =>           [Core, 81],      # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueFillBuffer" =>               [Core, 84],      # 5.2.2 - Reading, Writing and Copying Buffer Objects
   "clEnqueueMapBuffer" =>                [Core, 86],      # 5.2.3 - Mapping Buffer Objects
   "clCreateImage" =>                     [Core, 90],      # 5.3.1 - Creating Image Objects
   "cl_image_format" =>                   [Core, 92],      # 5.3.1.1 - Image Format Descriptor
   "imageDescriptor" =>                   [Core, 95],      # 5.3.1.2 - Image Descriptor
   "clGetSupportedImageFormats" =>        [Core, 96],      # 5.3.2 - Querying List of Supported Image Formats
   "supportedImageFormats" =>             [Core, 97],      # 5.3.2.1 - Supported Image Formats
   "clEnqueueReadImage" =>                [Core, 98],      # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueWriteImage" =>               [Core, 99],      # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImage" =>                [Core, 104],     # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueFillImage" =>                [Core, 105],     # 5.3.3 - Reading, Writing and Copying Image Objects
   "clEnqueueCopyImageToBuffer" =>        [Core, 107],     # 5.3.4 - Copying between Image and Buffer Objects
   "clEnqueueCopyBufferToImage" =>        [Core, 110],     # 5.3.4 - Copying between Image and Buffer Objects
   "clEnqueueMapImage" =>                 [Core, 112],     # 5.3.5 - Mapping Image Objects
   "clGetImageInfo" =>                    [Core, 116],     # 5.3.6 - Image Object Queries
   "clRetainMemObject" =>                 [Core, 118],     # 5.4.1 - Retaining and Releasing Memory Objects
   "clReleaseMemObject" =>                [Core, 118],     # 5.4.1 - Retaining and Releasing Memory Objects
   "clSetMemObjectDestructorCallback" =>  [Core, 119],     # 5.4.1 - Retaining and Releasing Memory Objects
   "clEnqueueUnmapMemObject" =>           [Core, 120],     # 5.4.2 - Unmapping Mapped Memory Objects
   "clEnqueueMigrateMemObjects" =>        [Core, 123],     # 5.4.4 - Migrating Memory Objects
   "clGetMemObjectInfo" =>                [Core, 125],     # 5.4.5 - Memory Object Queries
   "clCreateSampler" =>                   [Core, 128],     # 5.5.1 - Creating Sampler Objects
   "clRetainSampler" =>                   [Core, 129],     # 5.5.1 - Creating Sampler Objects
   "clReleaseSampler" =>                  [Core, 129],     # 5.5.1 - Creating Sampler Objects
   "clGetSamplerInfo" =>                  [Core, 130],     # 5.5.2 - Sampler Object Queries
   "clCreateProgramWithSource" =>         [Core, 132],     # 5.6.1 - Creating Program Objects
   "clCreateProgramWithBinary" =>         [Core, 133],     # 5.6.1 - Creating Program Objects
   "clCreateProgramWithBuiltInKernels" => [Core, 135],     # 5.6.1 - Creating Program Objects
   "clRetainProgram" =>                   [Core, 136],     # 5.6.1 - Creating Program Objects
   "clReleaseProgram" =>                  [Core, 136],     # 5.6.1 - Creating Program Objects
   "clBuildProgram" =>                    [Core, 137],     # 5.6.2 - Building Program Executables
   "clCompileProgram" =>                  [Core, 139],     # 5.6.3 - Separate Compilation and Linking of Programs
   "clLinkProgram" =>                     [Core, 142],     # 5.6.3 - Separate Compilation and Linking of Programs
   "clUnloadPlatformCompiler" =>          [Core, 149],     # 5.6.6 - Unloading the OpenCL Compiler
   "clGetProgramInfo" =>                  [Core, 150],     # 5.6.7 - Program Object Queries (updated for 1.2 rev 14)
   "clGetProgramBuildInfo" =>             [Core, 153],     # 5.6.7 - Program Object Queries
   "clCreateKernel" =>                    [Core, 157],     # 5.7.1 - Creating Kernel Objects
   "clCreateKernelsInProgram" =>          [Core, 158],     # 5.7.1 - Creating Kernel Objects
   "clRetainKernel" =>                    [Core, 159],     # 5.7.1 - Creating Kernel Objects
   "clReleaseKernel" =>                   [Core, 159],     # 5.7.1 - Creating Kernel Objects
   "clSetKernelArg" =>                    [Core, 160],     # 5.7.2 - Setting Kernel Arguments
   "clGetKernelInfo" =>                   [Core, 162],     # 5.7.3 - Kernel Object Queries (updated for 1.2 rev 14)
   "clGetKernelWorkGroupInfo" =>          [Core, 164],     # 5.7.3 - Kernel Object Queries
   "clGetKernelArgInfo" =>                [Core, 166],     # 5.7.3 - Kernel Object Queries (updated for 1.2 rev 14)
   "clEnqueueNDRangeKernel" =>            [Core, 169],     # 5.8 - Executing Kernels (updated for 1.2 rev 14)
   "clEnqueueTask" =>                     [Core, 172],     # 5.8 - Executing Kernels (updated for 1.2 rev 14)
   "clEnqueueNativeKernel" =>             [Core, 174],     # 5.8 - Executing Kernels (updated for 1.2 rev 14)
   "clCreateUserEvent" =>                 [Core, 178],     # 5.9 - Event Objects
   "clSetUserEventStatus" =>              [Core, 178],     # 5.9 - Event Objects
   "clWaitForEvents" =>                   [Core, 179],     # 5.9 - Event Objects
   "clGetEventInfo" =>                    [Core, 180],     # 5.9 - Event Objects
   "clSetEventCallback" =>                [Core, 183],     # 5.9 - Event Objects
   "clRetainEvent" =>                     [Core, 184],     # 5.9 - Event Objects
   "clReleaseEvent" =>                    [Core, 185],     # 5.9 - Event Objects
   "clEnqueueMarkerWithWaitList" =>       [Core, 186],     # 5.10 - Markers, Barriers and Waiting for Events
   "clEnqueueBarrierWithWaitList" =>      [Core, 187],     # 5.10 - Markers, Barriers and Waiting for Events
   "clGetEventProfilingInfo" =>           [Core, 190],     # 5.12 - Profiling Operations on Memory Objects and Kernels
   "clFlush" =>                           [Core, 193],     # 5.13 - Flush and Finish
   "clFinish" =>                          [Core, 193],     # 5.13 - Flush and Finish
   "scalarDataTypes" =>                   [Core, 195],     # 6.1.1 - Built-in Scalar Data Types
   "vectorDataTypes" =>                   [Core, 198],     # 6.1.2 - Built-in Vector Data Types
   "otherDataTypes" =>                    [Core, 199],     # 6.1.3 - Other Built-in Data Types
   "reservedDataTypes" =>                 [Core, 200],     # 6.1.4 - Reserved Data Types
   "convert_T" =>                         [Core, 207],     # 6.2.3 - Explicit Conversions
   "as_typen" =>                          [Core, 212],     # 6.2.4.2 - Reinterpreting Types Using as_typen()
   "operators" =>                         [Core, 215],     # 6.3 - Operators
   "addressSpaceQualifier" =>             [Core, 222],     # 6.5 - Address Space Qualifiers
   "accessQualifiers" =>                  [Core, 226],     # 6.6 - Access Qualifiers
   "functionQualifiers" =>                [Core, 227],     # 6.7 - Function Qualifiers
   "storageQualifiers" =>                 [Core, 230],     # 6.8 - Storage-class Qualifiers
   "restrictions" =>                      [Core, 231],     # 6.9 - Restrictions
   "preprocessorDirectives" =>            [Core, 234],     # 6.10 - Preprocessor Directives and Macros
   "attribute" =>                         [Core, 236],     # 6.11. - Attribute Qualifiers
   "attributes-types" =>                  [Core, 237],     # 6.11.1 - Specifying Attributes of Types
   "attributes-variables" =>              [Core, 239],     # 6.11.3 - Specifying Attributes of Variables
   "attributes-blocksAndControlFlow" =>   [Core, 241],     # 6.11.4 - Specifying Attributes of Blocks and Control...
   "workItemFunctions" =>                 [Core, 242],     # 6.12.1 - Work-Item Functions
   "mathFunctions" =>                     [Core, 244],     # 6.12.2 - Math Functions
   "mathConstants" =>                     [Core, 251],     # 6.12.2 - Table at end of Math Functions
   "FP_CONTRACT" =>                       [Core, 252],     # 6.12.2.1 - Floating-point macros and pragmas
   "macroLimits" =>                       [Core, 252],     # 6.12.2.1 - Floating-point macros and pragmas
   "integerFunctions" =>                  [Core, 256],     # 6.12.3 - Integer Functions
   "commonFunctions" =>                   [Core, 260],     # 6.12.4 - Common Functions
   "geometricFunctions" =>                [Core, 262],     # 6.12.5 - Geometric Functions
   "relationalFunctions" =>               [Core, 264],     # 6.12.6 - Relational Functions
   "vectorDataLoadandStoreFunctions" =>   [Core, 267],     # 6.12.7 - Vector Data Load and Store Functions
   "synchFunctions" =>                    [Core, 274],     # 6.12.8 - Synchronization Functions
   "explicitMemoryFenceFunctions" =>      [Core, 275],     # 6.12.9 - Explicit Memory Fence Functions 
   "asyncCopyFunctions" =>                [Core, 276],     # 6.12.10 - Async Copies from Global to Local Memory...
   "atomicFunctions" =>                   [Core, 279],     # 6.12.11 - Atomic Functions for 32-bit integers
   "miscVectorFunctions" =>               [Core, 282],     # 6.12.12 Miscellaneous Vector Functions
   "printfFunction" =>                    [Core, 284],     # 6.12.13 - printf
   "imageFunctions" =>                    [Core, 292],     # 6.12.14 - Image Read and Write Functions
   "sampler_t" =>                         [Core, 292],     # 6.12.14.1 - Samplers
   "imageQueryFunctions" =>               [Core, 311],     # 6.12.14.5 - Built-in Image Query Functions
   "imageAddressFiltering" =>             [Core, 326],     # 8 - Image Addressing and Filtering 
   "referenceWong" =>                     [Core, 355],     # 11 - References (to Wong paper)  
   "deprecated" =>                        [Core, 373],     # F - Changes 
   "EXTENSION" =>                         [Ext, 6],        # 9.1 - Compiler Directives for Optional Extensions
   "clGetExtensionFunctionAddressForPlatform" => [Ext, 7], # 9.2 - Getting OpenCL API Extension Function Pointers
   "cl_khr_int64_base_atomics" =>         [Ext, 10],       # 9.3 - 64-bit Atomics
   "cl_khr_int64_extended_atomics" =>     [Ext, 10],       # 9.3 - 64-bit Atomics
   "atom_add" =>                          [Ext, 10],       # 9.3 - 64-bit Atomics
   "imageFunctions3D" =>                  [Ext, 12],       # 9.4 - Writing to 3D image memory objects
   "cl_khr_3d_image_writes" =>            [Ext, 12],       # 9.4 - Writing to 3D image memory objects
   "cl_khr_fp16" =>                       [Ext, 14],       # 9.5 - Half Floating-Point
   "imageFunctionsHalf" =>                [Ext, 27],       # 9.5.8 - Image Read and Write Functions (half)
   "cl_khr_gl_sharing" =>                 [Ext, 39],       # 9.6 - Creating CL context from a GL context or share group
   "clGetGLContextInfoKHR" =>             [Ext, 43],       # 9.6.5 - Additions to section 9.8 of the...  
   "clCreateFromGLBuffer" =>              [Ext, 49],       # 9.7.2 - CL Buffer Objects -> GL Buffer Objects
   "clCreateFromGLTexture" =>             [Ext, 50],       # 9.7.3 - CL Image Objects -> GL Textures
   "clCreateFromGLRenderbuffer" =>        [Ext, 53],       # 9.7.4 - CL Image Objects -> GL Renderbuffers
   "clGetGLObjectInfo" =>                 [Ext, 54],       # 9.7.5 - Querying GL object information from a CL...
   "clGetGLTextureInfo" =>                [Ext, 55],       # 9.7.5 - Querying GL object information from a CL...
   "clEnqueueAcquireGLObjects" =>         [Ext, 56],       # 9.7.6 - Sharing memory objects that map to GL objects...
   "clEnqueueReleaseGLObjects" =>         [Ext, 58],       # 9.7.6 - Sharing memory objects that map to GL objects...
   "cl_khr_gl_event" =>                   [Ext, 61],       # 9.8 - Creating CL event objets
   "clCreateEventFromGLsyncKHR" =>        [Ext, 62],       # 9.8.4 - Additions to Chapter 5
   "cl_khr_d3d10_sharing" =>              [Ext, 66],       # 9.9 - Sharing Memory Objects with Direct3D 10
   "clGetDeviceIDsFromD3D10KHR" =>        [Ext, 71],       # 9.9.7.1 - Querying OpenCL Devices Corresponding to... 11...
   "clCreateFromD3D10BufferKHR" =>        [Ext, 73],       # 9.9.7.3 - Sharing Direct3D 10 Buffer Resources as OpenCL...
   "clCreateFromD3D10Texture2DKHR" =>     [Ext, 74],       # 9.9.7.4 - Sharing Direct3D 10 Texture and Resources...
   "clCreateFromD3D10Texture3DKHR" =>     [Ext, 75],       # 9.9.7.4 - Sharing Direct3D 10 Texture and...
   "clEnqueueAcquireD3D10ObjectsKHR" =>   [Ext, 77],       # 9.9.7.6 - Sharing memory objects created from Direct3D 10..
   "clEnqueueReleaseD3D10ObjectsKHR" =>   [Ext, 79],       # 9.9.7.6 - Sharing memory objects created from...
   "cl_khr_dx9_media_sharing" =>          [Ext, 83],       # 9.10 - DX9 Media Surface Sharing
   "clGetDeviceIDsFromDX9MediaAdapterKHR" => [Ext, 88],    # 9.10.7.1 - Querying OpenCL Devices corresponding....
   "clCreateFromDX9MediaSurfaceKHR" =>    [Ext, 89],       # 9.10.7.2 Creating Media Resources as OpenCL Image Objects
   "clEnqueueAcquireDX9MediaSurfacesKHR" => [Ext, 92],     # 9.10.7.4 - Sharing Memory Objects created from Media Surfaces
   "clEnqueueReleaseDX9MediaSurfacesKHR" => [Ext, 93],     # 9.10.7.4 - Sharing Memory Objects...
   "cl_khr_d3d11_sharing" =>              [Ext, 97],       # 9.11 - Sharing Memory Objects with Direct3D 11
   "clGetDeviceIDsFromD3D11KHR" =>        [Ext, 102],      # 9.11.7.1 - Querying OpenCL Devices Corresponding to Direct3D
   "clCreateFromD3D11BufferKHR" =>        [Ext, 104],      # 9.11.7.3 - Sharing Direct3D 11 Buffer Resources
   "clCreateFromD3D11Texture2DKHR" =>     [Ext, 105],      # 9.11.7.4 - Sharing Direct3D 11 Texture and Resources...
   "clCreateFromD3D11Texture3DKHR" =>     [Ext, 106],      # 9.11.7.4 - Sharing Direct3D 11 Texture and Resources....
   "clEnqueueAcquireD3D11ObjectsKHR" =>   [Ext, 108],      # 9.11.7.6 - Sharing memory objects created from Direct3D 11...
   "clEnqueueReleaseD3D11ObjectsKHR" =>   [Ext, 110],      # 9.11.7.6 - Sharing memory objects created from Direct3D 11...
   "cl_khr_icd" =>                        [Ext, 113],      # 9.12 - OpenCL Installable Client Driver (ICD)
   "clIcdGetPlatformIDsKHR" =>            [Ext, 116],      # 9.12.9 - Additions to chapter 4...
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

