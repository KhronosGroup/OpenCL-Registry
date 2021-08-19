#!/usr/bin/python3
#
# Copyright (c) 2021 The Khronos Group Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# makeindex.py - create HTML indices for the OpenGL extension registry
#
# Use: makeindex.py key
# where 'key' is 'arbnumber', 'number', or 'esnumber' for ARB OpenGL,
# Vendor OpenGL, and OpenGL ES extensions, respectively.
#
# Only extensions marked 'public' will be included in the index.

import argparse, copy, os, re, string, sys

# Keys in OpenCL Registry:
#   arbnumber   OpenGL ARB extension # (if present)
#   number      OpenGL vendor/EXT extension # (if present)
#   flags       Set containing one or more of 'public' 'private' 'obsolete' 'incomplete'
#   url         Relative URL to extension spec
#   alias       Set of additional extension strings defined in the same document
#   comments    Arbitrary string with metainformation about the extension

def makeLink(name, link):
    return '<a href="' + url + '">' + name + '</a>'

# See if the specified key of the extension has the specified flag
def hasFlag(extension, key, flag):
    return (key in extension and flag in extension[key])

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-key', action='store', default='number', help='Key to filter by')
    args = parser.parse_args()

    key = args.key

    #print('makeindex: key =', key)

    # Load the registry
    file = 'registry.py'
    exec(open(file).read())

    # Select extensions with the matching key
    dict = {k:v for k,v in registry.items() if key in v.keys()}

    # Generate the HTML ordered list of extensions (selecting only public ones)
    print('<ul>')
    for (name,ext) in sorted(dict.items()):
        index = ext.get(key)

        if hasFlag(ext, 'flags', 'public'):
            url = ext['url']

            # Create the main indexed link
            print('<li>', makeLink(name, url), sep='')

            if ('alias' in ext):
                for alias in ext['alias']:
                    print('\n    <br> ', makeLink(alias, url), sep='')

            print('</li>')
    print('</ul>')
