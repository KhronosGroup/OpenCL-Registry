# OpenCL-Registry

The OpenCL-Registry repository contains the OpenCL API and Extension
Registry, including specifications, reference pages and reference cards, and
the enumerant registry. It is also used as a backing store for the web view
of the registry at https://www.khronos.org/registry/cl/ ; commits to the
master branch of this repository will be reflected there.

In the past, the OpenCL registry was maintained in a public Subversion
repository. The history in that repository has not been imported to github,
but it is still available at
https://cvs.khronos.org/svn/repos/registry/trunk/public/cl/ .

Interesting files in this repository include:

* index.php - toplevel index page for the web view. This relies on PHP
  include files found elsewhere on www.khronos.org and so is not very useful
  in isolation.
* api/cl.xml - enumerant and extension number registry. Documents the
  assigned OpenCL enumerant ranges, and the names and index numbers assigned
  to OpenCL extension specifications.
* extensions/ - OpenCL extension specifications, grouped into
  vendor-specific subdirectories.
* sdk/ - OpenCL reference pages and reference cards. There are separate sets
  for each API version.
* specs/ - OpenCL specification documents.


## Reserving OpenCL Enumerant Ranges

OpenCL enumerants are documented in api/cl.xml . New ranges can be allocated
by proposing a pull request to master modifying this file, following the
existing examples. Allocate ranges starting at the lowest free values
available (search for "Reserved for vendor extensions"). Ranges are not
officially allocated until your pull request is *accepted* into master. At
that point you can use values from your assigned range for API extensions.


## Adding Extension Specifications

Extension specification documents can be added by proposing a pull request
to master, adding the specification .txt file under
extensions/<vendor>/filename.txt . You must also:

* Allocate an extension number in api/cl.xml (follow the existing
  <extension> examples, search for "Next free extension number", and use the
  lowest available extension number).
* Include that extension number in the extension specification document.
* Add a link from the extensions section of index.php to the extension
  document, using the specified extension number, so it shows up in the web
  view (this could in principle be generated automatically from cl.xml, but
  isn't at present).

Sometimes extension text files contain inappropriate UTF-8 characters. They
should be restricted to the ASCII subset of UTF-8 at present. They can be
removed using the iconv Linux command-line tool via

    iconv -c -f utf-8 -t ascii filename.txt

(see internal Bugzilla issue 16141 for more).

We will be transitioning to an asciidoc-based extension specification format
at some point.
