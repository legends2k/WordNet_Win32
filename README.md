This is the [WordNet library][] to read the WordNet database files (the WordNet API) for Win32.

[Artha][]'s Windows port uses this library along with the WordNet database (dict) files. Only the absolute minimum required to make a library is present; wnb (WordNet browser), documentation, dict files and supporting autotool scripts have been removed.

The version of the database files used doesn't matter, the library will work for any version since the structure/format of the dict files are the same; only the content is updated.

[WordNet library]: https://wordnet.princeton.edu/download/current-version
[Artha]: http://artha.sourceforge.net/
