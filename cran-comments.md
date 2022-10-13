## Release Summary
Minor release after peer review with JOSS

## R CMD check results
There are no ERRORs or WARNINGs, but there was 1 NOTE:

#### Found only on windows-x86_64-devel:

```
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
```

As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this is likely a bug/crash in MiKTeX and can likely be ignored.


#### Found on windows-x86_64-devel, ubuntu-gcc-release and fedora-clang-devel:
 
```
Possibly misspelled words in DESCRIPTION:
  Quadrat (2:37)
  quadrats (8:21, 8:43, 9:5)
```
  
These are correctly spelt words.

## Downstream dependencies
There are currently no downstream dependencies for this package


## Test environments
- Windows Server 2022, R-devel, 64 bit (windows-x86_64-devel), rhub, R 4.2.1 
- Ubuntu Linux 20.04.1 LTS, R-devel, GCC (ubuntu-gcc-release), rhub, R 4.2.1
- Fedora Linux, R-devel, clang, gfortran (fedora-clang-devel), rhub, R 4.2.1
- macOS 10.13.6 High Sierra, R-release, CRAN's setup (macos-highsierra-release-cran), rhub, R 4.2.1
