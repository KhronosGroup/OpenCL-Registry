<?php
$static_title = 'Khronos OpenCL Registry';

include_once("../../assets/static_pages/khr_page_top.php");
?>

<p> The OpenCL registry contains formatted specifications of the OpenCL
    API, OpenCL C programming language, OpenCL SPIR-V environment, and
    OpenCL extensions. </p>

<p> The OpenCL registry also includes header files, links to reference pages,
    reference cards, and other related documentation. </p>

<p> The asciidoctor source for the specifications in this registry is
    available in the <a href="https://github.com/KhronosGroup/OpenCL-Docs" rel="external">
    OpenCL-Docs </a> GitHub repository. </p>

<p> This registry is hosted in the <a
    href="https://github.com/KhronosGroup/OpenCL-Registry/" rel="external"> OpenCL-Registry
    </a> GitHub repository. </p>


<h6> OpenCL 3.0 Unified Specifications </h6>

<p> The latest version of OpenCL is OpenCL 3.0. </p>

<p> The OpenCL specifications are now unified so they describe OpenCL 3.0
    and all previous versions of OpenCL, and include <tt>khr</tt> extensions
    integrated into the core API and C specification language. </p>

<ul>
<li> OpenCL API Specification
     (<a href="specs/3.0-unified/html/OpenCL_API.html">HTML</a>)
     (<a href="specs/3.0-unified/pdf/OpenCL_API.pdf">PDF</a>)
     (July 10, 2025). </li>
<li> OpenCL C Language Specification
     (<a href="specs/3.0-unified/html/OpenCL_C.html">HTML</a>)
     (<a href="specs/3.0-unified/pdf/OpenCL_C.pdf">PDF</a>)
     (July 10, 2025). </li>
<li> OpenCL Extension Specification
     (<a href="specs/3.0-unified/html/OpenCL_Ext.html">HTML</a>)
     (<a href="specs/3.0-unified/pdf/OpenCL_Ext.pdf">PDF</a>)
     (July 10, 2025). </li>
<li> OpenCL SPIR-V Environment Specification
     (<a href="specs/3.0-unified/html/OpenCL_Env.html">HTML</a>)
     (<a href="specs/3.0-unified/pdf/OpenCL_Env.pdf">PDF</a>)
     (July 10, 2025). </li>
<li> <a href="sdk/3.0/docs/man/html/">
     OpenCL 3.0 Reference Pages.</a> </li>
<li> <a href="https://www.khronos.org/files/opencl30-reference-guide.pdf" rel="external">
     OpenCL 3.0 Reference Guide.</a> </li>
</ul>


<h6> Related Specifications and Resources </h6>

<ul>
<li> C language header files for the OpenCL API are in the <a
     href="https://github.com/KhronosGroup/OpenCL-Headers">
     OpenCL-Headers</a> GitHub repository. </li>
<li> Header files providing C++ bindings for the OpenCL API are in the <a
     href="https://www.github.com/KhronosGroup/OpenCL-CLHPP">
     OpenCL-CLHPP </a> GitHub repository.
     <ul>
     <li> <a href="https://khronosgroup.github.io/OpenCL-CLHPP/">
          Doxygen documentation</a> for the C++ bindings is also available. </li>
     </ul> </li>
<li> An OpenCL Installable Client Driver (ICD) Loader can be obtained
     from the <a href="https://github.com/KhronosGroup/OpenCL-ICD-Loader">
     OpenCL-ICD-Loader </a> GitHub repository.
     <ul>
     <li> OpenCL ICD Installation Guide Specification
          (<a href="specs/2.2/html/OpenCL_ICD_Installation.html">HTML</a>)
          (<a href="specs/2.2/pdf/OpenCL_ICD_Installation.pdf">PDF</a>) </li>
     </ul> </li>
<li> The Standard Portable Intermediate Representation (SPIR-V)
     specification is in the <a href="../spir-v/">SPIR-V
     Registry</a>.
     <ul>
     <li> The <a href="/SPIR-V/"> OpenCL Extended
          Instruction Set for SPIR-V</a> is included as part of the SPIR-V
          registry. </li>
     </ul> </li>
<li> The SYCL specification is found in the <a href="/SYCL/">SYCL
     Registry</a>. </li>
</ul>


<h6> Older Specifications </h6>

<p> Older versions of OpenCL are provided for reference. </p>

<p> OpenCL 2.2. </p>

<ul>
<li> OpenCL 2.2 API Specification
     (<a href="specs/2.2/html/OpenCL_API.html" rel="nofollow">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_API.pdf" rel="nofollow">PDF</a>)
     (July 19, 2019). </li>
<li> OpenCL Extension Specification
     (<a href="specs/2.2/html/OpenCL_Ext.html" rel="nofollow">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Ext.pdf" rel="nofollow">PDF</a>)
     (July 19, 2019). </li>
<li> OpenCL SPIR-V Environment Specification
     (<a href="specs/2.2/html/OpenCL_Env.html" rel="nofollow">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Env.pdf" rel="nofollow">PDF</a>)
     (July 19, 2019). </li>
<li> OpenCL C Language Specification
     (<a href="specs/2.2/html/OpenCL_C.html" rel="nofollow">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_C.pdf" rel="nofollow">PDF</a>)
     (July 19, 2019). </li>
<li> OpenCL C++ Language Specification
     (<a href="specs/2.2/html/OpenCL_Cxx.html" rel="nofollow">HTML</a>)
     (<a href="specs/2.2/pdf/OpenCL_Cxx.pdf" rel="nofollow">PDF</a>)
     (July 19, 2019). </li>
<li> <a href="sdk/2.2/docs/man/html/" rel="nofollow">
     OpenCL 2.2 Reference Pages.</a> </li>
<li> <a href="https://www.khronos.org/files/opencl22-reference-guide.pdf" rel="nofollow">
     OpenCL 2.2 Reference Guide.</a> </li>
</ul>


<p> OpenCL 2.1 </p>

<ul>
<li> OpenCL 2.1 API
     <a href="specs/opencl-2.1.pdf" rel="nofollow">
     Specification </a> (November 11, 2015). </li>
<li> OpenCL 2.1 Extensions
     <a href="specs/opencl-2.1-extensions.pdf" rel="nofollow">
     Specification </a> (November 5, 2015). </li>
<li> OpenCL 2.1 Environment
     <a href="specs/opencl-2.1-environment.pdf" rel="nofollow">
     Specification</a>. </li>
<li> <a href="sdk/2.1/docs/man/xhtml/">
     OpenCL 2.1 Reference Pages.</a>
<li> <a href="sdk/2.1/docs/OpenCL-2.1-refcard.pdf" rel="nofollow">
     OpenCL 2.1 Quick Reference Card.</a> </li>
</ul>


<h6> OpenCL 2.0 </h6>

<ul>
<li> OpenCL 2.0 API
     <a href="specs/opencl-2.0.pdf" rel="nofollow">
     Specification </a> (July 21, 2015). </li>
<li> OpenCL 2.0 C Language
     <a href="specs/opencl-2.0-openclc.pdf" rel="nofollow">
     Specification </a> (April 13, 2016). </li>
<li> OpenCL 2.0 Extension
     <a href="specs/opencl-2.0-extensions.pdf" rel="nofollow">
     Specification </a> (March 11, 2016). </li>
<li> <a href="sdk/2.0/docs/man/xhtml/">
     OpenCL 2.0 Reference Pages.</a>
<li> <a href="sdk/2.0/docs/OpenCL-2.0-refcard.pdf" rel="nofollow">
     OpenCL 2.0 Quick Reference Card.</a> </li>
</ul>


<h6> OpenCL 1.2 </h6>

<ul>
<li> OpenCL 1.2 API and C Language
     <a href="specs/opencl-1.2.pdf" rel="nofollow">
     Specification </a> (November 14, 2012). </li>
<li> OpenCL 1.2 Extensions
     <a href="specs/opencl-1.2-extensions.pdf" rel="nofollow">
     Specification </a> (September 22, 2015). </li>
<li> <a href="sdk/1.2/docs/man/xhtml/" rel="nofollow">
     OpenCL 1.2 Reference Pages.</a> </li>
<li> <a href="sdk/1.2/docs/OpenCL-1.2-refcard.pdf" rel="nofollow">
     OpenCL 1.2 Quick Reference Card.</a> </li>
</ul>


<h6> OpenCL 1.1 </h6>

<ul>
<li> OpenCL 1.1 API and C Language
     <a href="specs/opencl-1.1.pdf" rel="nofollow">
     Specification </a> (revision 44, June 1, 2011).
     A
     <a href="http://www.cutt.co.jp/book/978-4-87783-256-8.html" rel="nofollow">
     Japanese translation </a>
     of the specification is also available. </li>
<li> <a href="sdk/1.1/docs/man/xhtml/" rel="nofollow">
     OpenCL 1.1 Reference Pages.</a> </li>
<li> <a href="sdk/1.1/docs/OpenCL-1.1-refcard.pdf" rel="nofollow">
     OpenCL 1.1 Reference Card.</a> </li>
</ul>


<h6> OpenCL 1.0 </h6>

<ul>
<li> OpenCL 1.0 API and C Language
     <a href="specs/opencl-1.0.pdf" rel="nofollow">
     Specification </a> (revision 48, October 6, 2009). </li>
<li> <a href="sdk/1.0/docs/man/xhtml/" rel="nofollow">
     OpenCL 1.0 Reference Pages.</a> </li>
<li> <a href="sdk/1.0/docs/OpenCL-1.0-refcard.pdf" rel="nofollow">
     OpenCL 1.0 Reference Card.</a> </li>
</ul>


<h6> Providing Feedback on the Registry </h6>

<p> Khronos welcomes comments and bug reports. To provide feedback on the
    OpenCL reference pages, or on the OpenCL registry itself (such as
    reporting missing content, bad links, etc.), file an issue in the <a
    href="https://github.com/KhronosGroup/OpenCL-Registry/issues" rel="external">
    OpenCL-Registry </a> GitHub repository. </p>

<p> Feedback on related OpenCL components can be provided as follows: </p>

<ul>
<li> For the OpenCL API, C/C++ Language, and SPIR-V Environment
     Specifications, file an issue on the
     <a href="https://github.com/KhronosGroup/OpenCL-Docs/issues" rel="external">
     OpenCL-Docs </a> GitHub repository. </li>
<li> For the OpenCL C header files, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-Headers/issues" rel="external">
     OpenCL-Headers </a> GitHub repository. </li>
<li> For the OpenCL C++ bindings, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-CLHPP/issues" rel="external">
     OpenCL-CLHPP </a> GitHub repository. </li>
<li> For the OpenCL ICD Loader, file an issue in the <a
     href="https://github.com/KhronosGroup/OpenCL-ICD-Loader/issues" rel="external">
     OpenCL-ICD-Loader </a> GitHub repository. </li>
</ul>


<h6> Extension Template </h6>

<p> The <a href="extensions/template.txt"> extension template </a> for
    writing an OpenCL extension specification shows the structure of
    vendor extension specifications in the registry (listed below) and
    serves as a guide for writing new extension specifications. The
    template describes the purpose of each section in an extension
    specification. </p>


<h6> Enumerant and Extension Number Registry </h6>

<p> <a href="https://github.com/KhronosGroup/OpenCL-Docs/blob/main/xml/cl.xml" rel="external">
    cl.xml </a> is the registry of reserved OpenCL API enumerant ranges.
    (Note that following this link will probably not render sensibly in
    browsers, since the file is not entirely valid XML, simply a manually
    updated placeholder.)</p>


<h6 id="khrextspecs"> Khronos Extension Specifications </h6>

<p> Khronos <tt>khr</tt> extensions are now integrated into the core API and
    C language Specifications. These links are to the appropriate extension
    appendix of the OpenCL API Specification.</p>

<p> <tt>khr</tt> extensions have been removed from the OpenCL Extensions
    specification, and that document will eventually be retired once its
    remaining content is integrated elsewhere. </p>

<?php include("extensions/khrext.php"); ?>

<h6 id="otherextspecs">Vendor and Multi-Vendor Extension Specifications</h6>

<?php include("extensions/clext.php"); ?>

<?php include_once("../../assets/static_pages/khr_page_bottom.php"); ?>
</body>
</html>
