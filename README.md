# OpenCL-Registry

This repository contains the OpenCL API and Extension Registry. It is also
used as a backing store for the web view of the registry at
https://www.khronos.org/registry/cl/ ; commits to the master branch of this
repository will be reflected there.

In the past, the OpenCL registry was maintained in a public Subversion
repository. The history in that repository has not been imported to github,
but it is still available at
https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/ .

Interesting files in this repository include:

* index.php - toplevel index page for the web view. This relies on PHP
  include files found elsewhere on www.khronos.org and so is not very useful
  in isolation.
* cl.xml - enumerant and extension number registry. Documents the assigned
  OpenCL enumerant ranges, and the names and index numbers assigned to
  OpenCL extension specifications.
* extensions/ - OpenCL extension specifications, grouped into
  vendor-specific subdirectories.
* sdk/ - OpenCL reference pages and reference cards. There are separate sets
  for each API version.
* specs - OpenCL specification documents.
