<?php
$static_title = 'Khronos OpenCL Registry';

include_once("../../assets/static_pages/khr_page_top.php");
?>

<p> The OpenCL registry contains specifications for the core API; Khronos-
    and vendor-approved extensions to the core API; the OpenCL C and C++
    languages; and the OpenCL SPIR-V Environment.

<p> In addition, it contains reference pages for different OpenCL versions,
    and links to the github repository containing unified header files
    corresponding to the Specifications. </p>

<p> The OpenCL Standard Portable Intermediate Representation (SPIR)
    specification is found in the <a href="../spir/">SPIR Registry</a>. </p>

<p> The SYCL specification is found in the <a href="../sycl/">SYCL
    Registry</a>. </p>

<p> The registry, including published specifications and Docbook XML source
    for the reference pages, is hosted in the <a
    href="https://github.com/KhronosGroup/OpenCL-Registry/"> OpenCL-Registry
    </a> Github repository. </li>

<h6> OpenCL Specifications and Related Documentation </h6>

<p> The current version of OpenCL is OpenCL 2.2. </p>

<p> The asciidoctor source for the OpenCL 2.2 Specifications is available in
    the <a href="https://github.com/KhronosGroup/OpenCL-Docs">
    KhronosGroup/OpenCL-Docs </a> Github repository. </p>

<ul>
<li> OpenCL 2.2 API Specification
     (<a href="specs/2.2/html/OpenCL_API.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_API.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> OpenCL Extension Specification
     (<a href="specs/2.2/html/OpenCL_Ext.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Ext.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> OpenCL SPIR-V Environment Specification
     (<a href="specs/2.2/html/OpenCL_Env.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Env.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> OpenCL C Language Specification
     (<a href="specs/2.2/html/OpenCL_C.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_C.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> OpenCL C++ Language Specification
     (<a href="specs/2.2/html/OpenCL_Cxx.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Cxx.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> OpenCL ICD Installation Guide Specification
     (<a href="specs/2.2/html/OpenCL_ICD_Installation.html">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_ICD_Installation.pdf">PDF</a>)
     (February 5, 2019). </li>
<li> The <a href="https://www.khronos.org/registry/spir-v/"> OpenCL Extended
     Instruction Set for SPIR-V</a> is included as part of the SPIR-V
     registry.
<li> The OpenCL 2.2 Reference Pages are not posted yet. </li>
     <!--
     <a href="http://www.khronos.org/registry/cl/sdk/2.2/docs/man/xhtml/">
     OpenCL 2.2 Reference Pages.</a> The Docbook XML source for the
     reference pages is in the <tt>sdk/2.2</tt> directory of the <a
     href="https://github.com/KhronosGroup/OpenCL-Registry/">
     OpenCL-Registry </a> Github repository.
     -->
<li> <a href="https://www.khronos.org/files/opencl22-reference-guide.pdf">
     OpenCL 2.2 Reference Guide.</a> </li>
</ul>

<h6> OpenCL Header Files </h6>

<p> C language header files for the OpenCL API are found in the <a
    href="https://github.com/KhronosGroup/OpenCL-Headers">
    KhronosGroup/OpenCL-Headers</a> Github repository. In the past, there
    were different header files for each OpenCL version. The header files
    have now been unified - a single set of headers supports all OpenCL API
    versions - and the API version defined by the headers at compilation
    time is determined as described in the README.md in that repository.
    </a>

    <!--
<ul>
<li> All of the following headers should be present in a directory
     <tt> CL/ </tt> (or <tt> OpenCL/ </tt> on MacOS X). The single
     header file <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/opencl.h"> opencl.h </a> includes
     other headers as appropriate for the target platform, and simply
     including <tt> opencl.h </tt> should be all that most applications
     need to do.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/opencl.h"> opencl.h </a> -
          OpenCL 2.2 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_platform.h"> cl_platform.h </a> -
          OpenCL 2.2 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl.h"> cl.h </a> -
          OpenCL 2.2 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_ext.h"> cl_ext.h </a> -
          OpenCL 2.2 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_egl.h"> cl_egl.h </a> -
          OpenCL 2.2 Khronos EGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_dx9_media_sharing.h"> cl_dx9_media_sharing.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 9 Media Sharing Extensions
          Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_d3d11.h"> cl_d3d11.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 11 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_gl.h"> cl_gl.h </a> -
          OpenCL 2.2 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 2.2 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </li>
</ul>
    -->


<h6> OpenCL ICD and C++ Bindings Headers </h6>

<ul>
<li> <p> The OpenCL 2.x C++ Bindings Header File, <b>cl2.hpp</b> can be
     obtained from the <a
     href="https://www.github.com/KhronosGroup/OpenCL-CLHPP/releases">
     OpenCL-CLHPP </a> Github repository, and <a
     href="https://khronosgroup.github.io/OpenCL-CLHPP/"> Doxygen
     documentation</a> for the bindings is also available.
<li> <p> The OpenCL 1.x C++ Bindings Header File can also be generated from
     the OpenCL-CLHPP repository, but is not currently packaged as part of
     the releases built for that repo. A copy of <a href="api/2.1/cl.hpp">
     cl.hpp </a> may be downloaded from the registry as well. </p> </li>
<li> <p> The original <a href="specs/opencl-cplusplus-1.2.pdf"> OpenCL 1.2
     C++ Binding </a> and <a href="specs/opencl-cplusplus-1.1.pdf"> OpenCL
     1.1 C++ Binding </a> Specifications for the headers are also available.
     </p> </li>
<li> <p> The OpenCL Installable Client Driver (ICD) Loader can be obtained
     from the <a href="https://github.com/KhronosGroup/OpenCL-ICD-Loader">
     OpenCL-ICD-Loader </a> Github repository. </li>
</ul>


<h6> Older Specifications </h6>

<p> Older versions of OpenCL provided for reference. </p>

<p> OpenCL 2.1 </p>

<ul>
<li> OpenCL 2.1 API
     <a href="specs/opencl-2.1.pdf">
     Specification </a> (November 11, 2015). </li>
<li> OpenCL 2.1 Extensions
     <a href="specs/opencl-2.1-extensions.pdf">
     Specification </a> (November 5, 2015). </li>
<li> OpenCL 2.1 Environment
     <a href="specs/opencl-2.1-environment.pdf">
     Specification</a>. </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.1/docs/man/xhtml/">
     OpenCL 2.1 Reference Pages.</a>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.1/docs/OpenCL-2.1-refcard.pdf">
     OpenCL 2.1 Quick Reference Card.</a> </li>
</ul>

<h6> OpenCL 2.0 </h6>

<ul>
<li> OpenCL 2.0 API
     <a href="specs/opencl-2.0.pdf">
     Specification </a> (July 21, 2015). </li>
<li> OpenCL 2.0 C Language
     <a href="specs/opencl-2.0-openclc.pdf">
     Specification </a> (April 13, 2016). </li>
<li> OpenCL 2.0 Extension
     <a href="specs/opencl-2.0-extensions.pdf">
     Specification </a> (March 11, 2016). </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.0/docs/man/xhtml/">
     OpenCL 2.0 Reference Pages.</a>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.0/docs/OpenCL-2.0-refcard.pdf">
     OpenCL 2.0 Quick Reference Card.</a> </li>
</ul>

<h6> OpenCL 1.2 </h6>

<ul>
<li> OpenCL 1.2 API and C Language
     <a href="specs/opencl-1.2.pdf">
     Specification </a> (November 14, 2012). </li>
<li> OpenCL 1.2 Extensions
     <a href="specs/opencl-1.2-extensions.pdf">
     Specification </a> (September 22, 2015). </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.2/docs/man/xhtml/">
     OpenCL 1.2 Reference Pages.</a>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.2/docs/OpenCL-1.2-refcard.pdf">
     OpenCL 1.2 Quick Reference Card.</a> </li>
</ul>

<h6> OpenCL 1.1 </h6>

<ul>
<li> OpenCL 1.1 API and C Language
     <a href="specs/opencl-1.1.pdf">
     Specification </a> (revision 44, June 1, 2011).
     A
     <a href="http://www.cutt.co.jp/book/978-4-87783-256-8.html">
     Japanese translation </a>
     of the specification is also available. </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.1/docs/man/xhtml/">
     OpenCL 1.1 Reference Pages.</a> </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.1/docs/OpenCL-1.1-refcard.pdf">
     OpenCL 1.1 Reference Card.</a> </li>
</ul>

<h6> OpenCL 1.0 </h6>

<ul>
<li> OpenCL 1.0 API and C Language
     <a href="specs/opencl-1.0.pdf">
     Specification </a> (revision 48, October 6, 2009). </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/">
     OpenCL 1.0 Reference Pages.</a> </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.0/docs/OpenCL-1.0-refcard.pdf">
     OpenCL 1.0 Reference Card.</a> </li>
</ul>

<h6> Providing Feedback on the Registry </h6>

<p> Khronos welcomes comments and bug reports. To provide feedback on the
    OpenCL reference pages, or on the OpenCL registry itself (such as
    reporting missing content, bad links, etc.), file an issue in the <a
    href="https://github.com/KhronosGroup/OpenCL-Registry/issues">
    OpenCL-Registry </a> Github project. </p>

<p> Feedback on related OpenCL components can be provided as follows: </p>

<ul>
<li> <p> For the OpenCL API, C/C++ Language, and Environment Specifications,
     file an issue on the
     <a href="https://github.com/KhronosGroup/OpenCL-Docs">
     KhronosGroup/OpenCL-Docs </a> Github repository. </p> </li>
<li> <p> For the OpenCL C header files, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-Headers/issues">
     OpenCL-Headers </a> Github project. </p> </li>
<li> <p> For the OpenCL C++ Bindings, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-CLHPP/issues">
     OpenCL-CLHPP </a> Github project.
<li> <p> For the OpenCL ICD Loader, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-ICD-Loader/issues">
     OpenCL-ICD-Loader </a> Github repository. </p> </li>
</ul>


<h6> Extension Template </h6>

<p> The <a href="extensions/template.txt"> extension template </a> for
    writing an OpenCL extension specification shows the structure of
    vendor extension specifications in the registry (listed below) and
    serves as a guide for writing new extension specifications. The
    template describes the purpose of each section in an extension
    specification. </li>


<h6> Enumerant and Extension Number Registry </h6>

<p> <a href="xml/cl.xml"> cl.xml </a> is the registry of reserved OpenCL API
    enumerant ranges. (Note that following this link will probably not
    render sensibly in browsers, since the file is not entirely valid XML,
    simply a manually updated placeholder.)</p>


<h6> <a name="otherextspecs"></a>
     Extension Specifications</h6>

<?php include("extensions/clext.php"); ?>

<?php include_once("../../assets/static_pages/khr_page_bottom.php"); ?>
</body>
</html>
