# What's this?

"personal-tools" contains some tiny utilities/scripts which SimpleBoxes is using personally.


## rm_rsrc

Removes resource fork data from a file in OS X.

> $ rm_rsrc FILE

Internally it uses `xattr -d` command to remove resource fork.

* language: perl
* platform: OS X

## sumup

Sums up files which have the same prefix.

> $ sumup FILE_PREFIX

For example, the following files in a directory:

> * ScreenShot 2012-12-07 at 8.57.27 PM.png> * ScreenShot 2012-12-07 at 9.13.20 AM.png> * ScreenShot 2012-12-08 at 9.14.22 AM.png> * ScreenShot 2012-12-08 at 9.14.43 AM.png> * ScreenShot 2012-12-09 at 9.14.56 AM.png> * ScreenShot 2012-12-09 at 9.15.12 AM.png> * ScreenShot 2012-12-09 at 9.15.37 AM.png> * ScreenShot 2012-12-09 at 9.15.55 AM.png> * ScreenShot 2012-12-09 at 9.16.13 AM.png> * ScreenShot 2012-12-09 at 9.16.47 AM.png

Run the following command:

> $ sumup ScreenShot\ 2012-12-09

The script will create "ScreenShot 2012-12-09/" and move the asscoaued files into it.

> * ScreenShot 2012-12-07 at 8.57.27 PM.png> * ScreenShot 2012-12-07 at 9.13.20 AM.png> * ScreenShot 2012-12-08 at 9.14.22 AM.png> * ScreenShot 2012-12-08 at 9.14.43 AM.png> * ScreenShot 2012-12-09/

It works the files with extension.

* language: bash

# Copyright 

All scripts in "personal-tools" are developed by Takuya Otani / SimpleBoxes.

Copyright (c) 2012 [SerendipityNZ](http://serendipitynz.com/) Ltd. 

# License 
All scripts in "personal-tools" will be released under the MIT-license.

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to 
the following conditions:

The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
