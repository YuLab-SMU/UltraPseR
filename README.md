#  UltraPseR: Wappers for UltraPse in R

An R package for biological sequence representations 

- [UltraPse](https://github.com/pufengdu/UltraPse) by [pudengdu](https://github.com/pufengdu)

##  Install development vertion

**!!!NOTE: We have tested these codes on Ubuntu 18.04.2 LTS.** There is no guarantee that these codes can be compiled and executed on other platforms without modifications.(Currently cannot be installed in the **Win**)

The development version from github:


```r
if (!requireNamespace("devtools", quietly=TRUE))
    install.packages("devtools")
devtools::install_github("nyzhoulang/UltraPseR")
```

##  Quick Example 

###  Calculated Component


```r
tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
UltraPseR::UpseR(input = tiny_sequences, format = "svm", module = "comp", note = "stdprot")
```

###  Pse-Protein


```r
tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
UltraPseR::UpseR(input = tiny_sequences, format = "svm", note = "stdprot", module = "pse", property = "ZIMJ680105", w = 0.05, l = 10, t = 2)
```

###  Pse-DiDNA


```r
DNA_sequences <- system.file("extdata", "tiny-dna.fas", package = "UltraPseR")
UltraPseR::UpseR(input = DNA_sequences, format = "svm", note = "didna", module = "pse", property = "DD0033", w = 0.05, l = 3, t = 1)
```

###  Explore proprety

```r
  UltraPseR::availabel_prop(note = "stdprot")
```





