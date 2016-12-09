<?php
$static_title = 'Khronos OpenCL Registry';
$static_breadcrumb = array(
    '/registry/' => 'Registry',
    'NOLINK' => 'OpenCL Registry'
);
include_once("../../assets/static_pages/khr_page_top.php");
?>

<h1 class="pagetitle">Khronos OpenCL&trade; Registry</h1>
<div id="mainformat">


<h1 style="text-align:center"> Khronos OpenCL&trade; Registry </h1>

<p> The OpenCL registry contains specifications of the core API and the
    OpenCL C language; a portable intermediate representation of OpenCL
    programs; specifications of Khronos- and vendor-approved OpenCL
    extensions; and links to header files corresponding to the
    specifications, which are now hosted in the <a
    href="https://www.github.com/KhronosGroup/OpenCL-Headers/">
    OpenCL-Headers </a> Github repository. </p>

<p> The OpenCL Standard Portable Intermediate Representation (SPIR) is
    found in the <a href="../spir/">SPIR Registry</a>. </p>

<p> The SYCL specification is found in the <a href="../sycl/">SYCL
    Registry</a>. </p>


<h6> OpenCL Core API and C Language Specification, Headers, and Documentation </h6>

<p> The current version of OpenCL is OpenCL 2.2 (Provisional). </p>

<ul>
<li> OpenCL 2.2 (Provisional) API
     <a href="specs/opencl-2.2.pdf">
     Specification </a> (March 11, 2016). </li>
<li> OpenCL 2.2 Extension
     <a href="specs/opencl-2.2-extension.pdf">
     Specification </a> (February 8, 2016).</li>
<li> OpenCL 2.2 Environment
     <a href="specs/opencl-2.2-environment.pdf">
     Specification</a>. </li>
<li> OpenCL 2.2 (Provisional) C++ Language
     <a href="specs/opencl-2.2-cplusplus.pdf">
     Specification</a> (April 12, 2016). </li>
<li> The OpenCL 2.2 online manual pages are not posted yet.
     <!--
     <a href="http://www.khronos.org/registry/cl/sdk/2.2/docs/man/xhtml/">
     OpenCL 2.2 Online Manual Pages.</a> The Docbook XML
     <a href="https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/sdk/2.2/docs/man/">
     source for the manual pages </a>
     can be obtained from the Khronos Subversion repository via
     anonymous read-only access. </li>
     -->
<li> The OpenCL 2.2 Quick Reference Card is not posted yet.
<li> The OpenCL 2.2 header files are not posted yet.
     <!--
     All of the following headers should be present in a directory
     <tt> CL/ </tt> (or <tt> OpenCL/ </tt> on MacOS X). The single
     header file <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/opencl.h"> opencl.h </a> includes
     other headers as appropriate for the target platform, and simply
     including <tt> opencl.h </tt> should be all that most applications
     need to do.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/opencl.h"> opencl.h </a> -
          OpenCL 2.2 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_platform.h"> cl_platform.h </a> -
          OpenCL 2.2 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl.h"> cl.h </a> -
          OpenCL 2.2 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_ext.h"> cl_ext.h </a> -
          OpenCL 2.2 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_egl.h"> cl_egl.h </a> -
          OpenCL 2.2 Khronos EGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_dx9_media_sharing.h"> cl_dx9_media_sharing.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 9 Media Sharing Extensions
          Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_d3d11.h"> cl_d3d11.h </a> -
          OpenCL 2.2 Khronos OpenCL/Direct3D 11 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_gl.h"> cl_gl.h </a> -
          OpenCL 2.2 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 2.2 Vendor OpenCL/OpenGL Extensions Header File. </li>
     -->
     </li>
<li> The <a href="https://www.khronos.org/registry/spir-v/"> OpenCL Extended
     Instruction Set for SPIR-V</a> is included as part of the SPIR-V
     registry.
</ul>


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
     OpenCL 2.1 Online Manual Pages.</a> The Docbook XML
     <a href="https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/sdk/2.1/docs/man/">
     source for the manual pages </a>
     can be obtained from the Khronos Subversion repository via
     anonymous read-only access. </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.1/docs/OpenCL-2.1-refcard.pdf">
     OpenCL 2.1 Quick Reference Card.</a> </li>
<li> All of the following headers should be present in a directory
     <tt> CL/ </tt> (or <tt> OpenCL/ </tt> on MacOS X). The single
     header file <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/opencl.h"> opencl.h </a> includes
     other headers as appropriate for the target platform, and simply
     including <tt> opencl.h </tt> should be all that most applications
     need to do.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/opencl.h"> opencl.h </a> -
          OpenCL 2.1 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_platform.h"> cl_platform.h </a> -
          OpenCL 2.1 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl.h"> cl.h </a> -
          OpenCL 2.1 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_ext.h"> cl_ext.h </a> -
          OpenCL 2.1 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_egl.h"> cl_egl.h </a> -
          OpenCL 2.1 Khronos EGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_dx9_media_sharing.h"> cl_dx9_media_sharing.h </a> -
          OpenCL 2.1 Khronos OpenCL/Direct3D 9 Media Sharing Extensions
          Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 2.1 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_d3d11.h"> cl_d3d11.h </a> -
          OpenCL 2.1 Khronos OpenCL/Direct3D 11 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_gl.h"> cl_gl.h </a> -
          OpenCL 2.1 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl21/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 2.1 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </ul> </li>
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
     OpenCL 2.0 Online Manual Pages.</a> The Docbook XML
     <a href="https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/sdk/2.0/docs/man/">
     source for the manual pages </a>
     can be obtained from the Khronos Subversion repository via
     anonymous read-only access. </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/2.0/docs/OpenCL-2.0-refcard.pdf">
     OpenCL 2.0 Quick Reference Card.</a> </li>
<li> OpenCL 2.0 headers are structured in exactly the same fashion as
     OpenCL 2.1 headers described above.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/opencl.h"> opencl.h </a> -
          OpenCL 2.0 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_platform.h"> cl_platform.h </a> -
          OpenCL 2.0 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl.h"> cl.h </a> -
          OpenCL 2.0 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_ext.h"> cl_ext.h </a> -
          OpenCL 2.0 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_egl.h"> cl_egl.h </a> -
          OpenCL 2.0 Khronos EGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_dx9_media_sharing.h"> cl_dx9_media_sharing.h </a> -
          OpenCL 2.0 Khronos OpenCL/Direct3D 9 Media Sharing Extensions
          Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 2.0 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_d3d11.h"> cl_d3d11.h </a> -
          OpenCL 2.0 Khronos OpenCL/Direct3D 11 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_gl.h"> cl_gl.h </a> -
          OpenCL 2.0 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl20/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 2.0 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </ul> </li>
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
     OpenCL 1.2 Online Manual Pages.</a> The Docbook XML
     <a href="https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/sdk/1.2/docs/man/">
     source for the manual pages </a>
     can be obtained from the Khronos Subversion repository via
     anonymous read-only access. </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.2/docs/OpenCL-1.2-refcard.pdf">
     OpenCL 1.2 Quick Reference Card.</a> </li>
<li> OpenCL 1.2 headers are structured in exactly the same fashion as
     OpenCL 2.1 headers described above.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/opencl.h"> opencl.h </a> -
          OpenCL 1.2 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_platform.h"> cl_platform.h </a> -
          OpenCL 1.2 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl.h"> cl.h </a> -
          OpenCL 1.2 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_ext.h"> cl_ext.h </a> -
          OpenCL 1.2 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_egl.h"> cl_egl.h </a> -
          OpenCL 1.2 Khronos EGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_dx9_media_sharing.h"> cl_dx9_media_sharing.h </a> -
          OpenCL 1.2 Khronos OpenCL/Direct3D 9 Media Sharing Extensions
          Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 1.2 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_d3d11.h"> cl_d3d11.h </a> -
          OpenCL 1.2 Khronos OpenCL/Direct3D 11 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_gl.h"> cl_gl.h </a> -
          OpenCL 1.2 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl12/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 1.2 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </ul> </li>
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
     OpenCL 1.1 Online Manual Pages.</a> </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.1/docs/OpenCL-1.1-refcard.pdf">
     OpenCL 1.1 Reference Card.</a> </li>
<li> OpenCL 1.1 headers are structured in exactly the same fashion as
     OpenCL 2.1 headers described above.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/opencl.h"> opencl.h </a> -
          OpenCL 1.1 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl_platform.h"> cl_platform.h </a> -
          OpenCL 1.1 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl.h"> cl.h </a> -
          OpenCL 1.1 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl_ext.h"> cl_ext.h </a> -
          OpenCL 1.1 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 1.1 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl_gl.h"> cl_gl.h </a> -
          OpenCL 1.1 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl11/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 1.1 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </ul> </li>
</ul>

<h6> OpenCL 1.0 </h6>

<ul>
<li> OpenCL 1.0 API and C Language
     <a href="specs/opencl-1.0.pdf">
     Specification </a> (revision 48, October 6, 2009). </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.0/docs/man/xhtml/">
     OpenCL 1.0 Online Manual Pages.</a> </li>
<li> <a href="http://www.khronos.org/registry/cl/sdk/1.0/docs/OpenCL-1.0-refcard.pdf">
     OpenCL 1.0 Reference Card.</a> </li>
<li> OpenCL 1.0 headers are structured in exactly the same fashion as
     OpenCL 2.1 headers described above.

     <ul>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/opencl.h"> opencl.h </a> -
          OpenCL 1.0 Single Header File for Applications. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl_platform.h"> cl_platform.h </a> -
          OpenCL 1.0 Platform-Dependent Macros. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl.h"> cl.h </a> -
          OpenCL 1.0 Core API Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl_ext.h"> cl_ext.h </a> -
          OpenCL 1.0 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl_d3d10.h"> cl_d3d10.h </a> -
          OpenCL 1.0 Khronos OpenCL/Direct3D 10 Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl_gl.h"> cl_gl.h </a> -
          OpenCL 1.0 Khronos OpenCL/OpenGL Extensions Header File. </li>
     <li> <a href="https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/opencl10/cl_gl_ext.h"> cl_gl_ext.h </a> -
          OpenCL 1.0 Vendor OpenCL/OpenGL Extensions Header File. </li>
     </ul> </li>
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
     file a bug on the <a href="http://www.khronos.org/bugzilla/"> Khronos
     Bugzilla </a>. Make sure to fill in the &quot;Product&quot; field in
     the bug entry form as &quot;OpenCL&quot;, and pick appropriate values
     for the Component and other fields. </p> </li>
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

<p> <a href="api/cl.xml"> cl.xml </a> is the registry of reserved OpenCL API
    enumerant ranges and of OpenCL extension numbers. </p>


<h6> <a name="otherextspecs"></a>
     Extension Specifications</h6>
<ol>
<li value=1> <a href="extensions/khr/cl_khr_gl_sharing.txt">cl_khr_gl_sharing</a>
</li>
<li value=2> <a href="extensions/nv/cl_nv_d3d9_sharing.txt">cl_nv_d3d9_sharing</a>
</li>
<li value=3> <a href="extensions/nv/cl_nv_d3d10_sharing.txt">cl_nv_d3d10_sharing</a>
</li>
<li value=4> <a href="extensions/nv/cl_nv_d3d11_sharing.txt">cl_nv_d3d11_sharing</a>
</li>
<li value=5> <a href="extensions/khr/cl_khr_icd.txt">cl_khr_icd</a>
</li>
<li value=6> <a href="extensions/khr/cl_khr_d3d10_sharing.txt">cl_khr_d3d10_sharing</a>
</li>
<li value=7> <a href="extensions/amd/cl_amd_device_attribute_query.txt">cl_amd_device_attribute_query</a>
</li>
<li value=8> <a href="extensions/amd/cl_amd_fp64.txt">cl_amd_fp64</a>
</li>
<li value=9> <a href="extensions/amd/cl_amd_media_ops.txt">cl_amd_media_ops</a>
</li>
<li value=10> <a href="extensions/ext/cl_ext_migrate_memobject.txt">cl_ext_migrate_memobject</a>
</li>
<li value=11> <a href="extensions/ext/cl_ext_device_fission.txt">cl_ext_device_fission</a>
</li>
<li value=12> <a href="extensions/ext/cl_ext_atomic_counters_32.txt">cl_ext_atomic_counters_32</a>
</li>
<li value=13> <a href="extensions/ext/cl_ext_atomic_counters_64.txt">cl_ext_atomic_counters_64</a>
</li>
<li value=14> <a href="extensions/intel/cl_intel_dx9_media_sharing.txt">cl_intel_dx9_media_sharing</a>
</li>
<li value=15> <a href="extensions/amd/cl_amd_media_ops2.txt">cl_amd_media_ops2</a>
</li>
<li value=16> <a href="extensions/intel/cl_intel_thread_local_exec.txt">cl_intel_thread_local_exec</a>
</li>
<li value=17> <a href="extensions/nv/cl_nv_compiler_options.txt">cl_nv_compiler_options</a>
</li>
<li value=18> <a href="extensions/nv/cl_nv_device_attribute_query.txt">cl_nv_device_attribute_query</a>
</li>
<li value=19> <a href="extensions/nv/cl_nv_pragma_unroll.txt">cl_nv_pragma_unroll</a>
</li>
<li value=20> <a href="extensions/intel/cl_intel_device_partition_by_names.txt">cl_intel_device_partition_by_names</a>
</li>
<li value=21> <a href="extensions/qcom/cl_qcom_ext_host_ptr.txt">cl_qcom_ext_host_ptr</a>
</li>
<li value=22> <a href="extensions/qcom/cl_qcom_ion_host_ptr.txt">cl_qcom_ion_host_ptr</a>
</li>
<li value=23> <a href="extensions/intel/cl_intel_motion_estimation.txt">cl_intel_motion_estimation</a>
</li>
<li value=24> <a href="extensions/intel/cl_intel_accelerator.txt">cl_intel_accelerator</a>
</li>
<li value=25> <a href="extensions/amd/cl_amd_bus_addressable_memory.txt">cl_amd_bus_addressable_memory</a>
</li>
<li value=26> <a href="extensions/arm/cl_arm_get_core_id.txt">cl_arm_core_id</a>
</li>
<li value=27> <a href="extensions/arm/cl_arm_printf.txt">cl_arm_printf</a>
</li>
<li value=28> <a href="extensions/altera/cl_altera_live_object_tracking.txt">cl_altera_live_object_tracking</a>
</li>
<li value=29> <a href="extensions/altera/cl_altera_device_temperature.txt">cl_altera_device_temperature</a>
</li>
<li value=30> <a href="extensions/altera/cl_altera_compiler_mode.txt">cl_altera_compiler_mode</a>
</li>
<li value=31> <a href="extensions/intel/cl_intel_d3d11_nv12_media_sharing.txt">cl_intel_d3d11_nv12_media_sharing</a>
</li>
<li value=32> <a href="extensions/qcom/cl_qcom_android_native_buffer_host_ptr.txt">cl_qcom_android_native_buffer_host_ptr</a>
</li>
<li value=33> <a href="extensions/intel/cl_intel_advanced_motion_estimation.txt">cl_intel_advanced_motion_estimation</a>
</li>
<li value=34> <a href="extensions/intel/cl_intel_simultaneous_sharing.txt">cl_intel_simultaneous_sharing</a>
</li>
<li value=35> <a href="extensions/intel/cl_intel_subgroups.txt">cl_intel_subgroups</a>
</li>
<li value=36> <a href="extensions/intel/cl_intel_va_api_media_sharing.txt">cl_intel_va_api_media_sharing</a>
</li>
<li value=37> <a href="extensions/intel/cl_intel_egl_image_yuv.txt">cl_intel_egl_image_yuv</a>
</li>
<li value=38> <a href="extensions/arm/cl_arm_import_memory.txt">cl_arm_import_memory</a>
</li>
<li value=39> <a href="extensions/arm/cl_arm_non_uniform_work_group_size.txt">cl_arm_non_uniform_work_group_size</a>
</li>
<li value=40> <a href="extensions/arm/cl_arm_shared_virtual_memory.txt">cl_arm_shared_virtual_memory</a>
</li>
<li value=41> <a href="extensions/arm/cl_arm_thread_limit_hint.txt">cl_arm_thread_limit_hint</a>
</li>
<li value=42> <a href="extensions/intel/cl_intel_packed_yuv.txt">cl_intel_packed_yuv</a>
</li>
<li value=43> <a href="extensions/intel/cl_intel_required_subgroup_size.txt">cl_intel_required_subgroup_size</a>
</li>
<li value=44> <a href="extensions/img/cl_img_cached_allocations.txt">cl_img_cached_allocations</a>
</li>
<li value=45> <a href="extensions/img/cl_img_use_gralloc_ptr.txt">cl_img_use_gralloc_ptr</a>
</li>
<li value=46> <a href="extensions/img/cl_img_yuv_image.txt">cl_img_yuv_image</a>
</li>
<li value=47> <a href="extensions/intel/cl_intel_driver_diagnostics.txt">cl_intel_driver_diagnostics</a>
</li>
<li value=48> <a href="extensions/intel/cl_intel_subgroups_short.txt">cl_intel_subgroups_short</a>
</li>
</ol>
<?php include_once("../../assets/static_pages/khr_page_bottom.php"); ?>
</body>
</html>
