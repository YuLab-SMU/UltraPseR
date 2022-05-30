<!-- README.md is generated from README.Rmd. Please edit that file -->

# UltraPseR: Wappers for UltraPse in R

An R package for biological sequence representations

-   [UltraPse](https://github.com/pufengdu/UltraPse) by
    [pudengdu](https://github.com/pufengdu)

## Install development vertion

~~!!!NOTE: We have tested these codes on Ubuntu 18.04.2 LTS. There is no
guarantee that these codes can be compiled and executed on other
platforms without modifications.(Currently cannot be installed in the
**Win**)~~ Now, `UltraPseR` support all platforms.

The development version from github:

``` r
if (!requireNamespace("devtools", quietly=TRUE))
    install.packages("devtools")
devtools::install_github("nyzhoulang/UltraPseR")
```

## Quick Example

### Calculated Component

``` r
library(dplyr)
```

``` r
tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
x <- UltraPseR::UpseR(input = tiny_sequences, format = "tsv", module = "comp", note = "stdprot") 
x
```

    ## [[1]]
    ##  [1]  0.000  4.310  7.759  7.759  5.172  3.448  0.000 14.655 12.931 10.345
    ## [11]  2.586 13.793  1.724  1.724  0.862  2.586  2.586  3.448  0.862  3.448
    ## 
    ## [[2]]
    ##  [1]  1.695  3.390  3.390  5.085  3.390  3.390  2.542 11.864 11.017  9.322
    ## [11]  4.237 14.407  0.847  2.542  1.695  7.627  5.932  2.542  0.000  5.085

### Pse-Protein

``` r
tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
UltraPseR::UpseR(input = tiny_sequences, format = "tsv", note = "stdprot", module = "pse", property = "ZIMJ680105", w = 0.05, l = 10, t = 2)
```

    ## [[1]]
    ##  [1]  0.000  4.341  7.813  7.813  5.209  3.473  0.000 14.759 13.022 10.418
    ## [11]  2.604 13.891  1.736  1.736  0.868  2.604  2.604  3.473  0.868  3.473
    ## [21] -1.019  0.895 -1.150  0.711 -0.812  0.017 -0.184  0.547  0.148  0.140
    ## 
    ## [[2]]
    ##  [1]  1.719  3.438  3.438  5.157  3.438  3.438  2.578 12.033 11.173  9.454
    ## [11]  4.297 14.611  0.859  2.578  1.719  7.735  6.016  2.578  0.000  5.157
    ## [21] -0.069 -0.060 -0.371  0.179 -0.013  0.281 -0.213 -0.598 -0.163 -0.391

### Pse-DiDNA

``` r
DNA_sequences <- system.file("extdata", "tiny-dna.fas", package = "UltraPseR")
UltraPseR::UpseR(input = DNA_sequences, format = "tsv", note = "didna", module = "pse", property = "DD0033", w = 0.05, l = 3, t = 1)
```

    ## [[1]]
    ##  [1]  0.000  8.216  8.216  8.216  8.216  0.000  0.000  0.000  8.216  0.000
    ## [11]  0.000  8.216  4.108  4.108  8.216  4.108 11.690 11.220  7.251
    ## 
    ## [[2]]
    ##  [1]  0.000  8.216  8.216  8.216  8.216  0.000  0.000  0.000  8.216  0.000
    ## [11]  0.000  8.216  4.108  4.108  8.216  4.108 11.690 11.220  7.251

### Explore proprety

``` r
UltraPseR::available_prop(note = "didna")
```

    ## DD0001   Base stacking
    ## DD0002   Protein induced deformability
    ## DD0003   B-DNA twist
    ## DD0004   Dinucleotide GC Content
    ## DD0005   A-philicity
    ## DD0006   Propeller twist
    ## DD0007   Duplex stability (freeenergy)
    ## DD0008   Duplex stability (disruptenergy)
    ## DD0009   DNA denaturation
    ## DD0010   Bending stiffness
    ## DD0011   Protein DNA twist
    ## DD0012   Stabilising energy of Z-DNA
    ## DD0013   Aida_BA_transition
    ## DD0014   Breslauer_dG
    ## DD0015   Breslauer_dH
    ## DD0016   Breslauer_dS
    ## DD0017   Electron_interaction
    ## DD0018   Hartman_trans_free_energy
    ## DD0019   Helix-Coil_transition
    ## DD0020   Ivanov_BA_transition
    ## DD0021   Lisser_BZ_transition
    ## DD0022   Polar_interaction
    ## DD0023   SantaLucia_dG
    ## DD0024   SantaLucia_dH
    ## DD0025   SantaLucia_dS
    ## DD0026   Sarai_flexibility
    ## DD0027   Stability
    ## DD0028   Stacking_energy
    ## DD0029   Sugimoto_dG
    ## DD0030   Sugimoto_dH
    ## DD0031   Sugimoto_dS
    ## DD0032   Watson-Crick_interaction
    ## DD0033   Twist
    ## DD0034   Tilt
    ## DD0035   Roll
    ## DD0036   Shift
    ## DD0037   Slide
    ## DD0038   Rise
    ## DD0039   Stacking energy
    ## DD0040   Bend
    ## DD0041   Tip
    ## DD0042   Inclination
    ## DD0043   Major Groove Width
    ## DD0044   Major Groove Depth
    ## DD0045   Major Groove Size
    ## DD0046   Major Groove Distance
    ## DD0047   Minor Groove Width
    ## DD0048   Minor Groove Depth
    ## DD0049   Minor Groove Size
    ## DD0050   Minor Groove Distance
    ## DD0051   PersistanceLength
    ## DD0052   MeltingTemperature
    ## DD0053   Mobilitytobendtowardsmajorgroove
    ## DD0054   Mobilitytobendtowardsminorgroove
    ## DD0055   PropellerTwist
    ## DD0056   ClashStrength
    ## DD0057   Enthalpy
    ## DD0058   Shift(RNA)
    ## DD0059   Hydrophilicity(RNA)
    ## DD0060   Freeenergy
    ## DD0061   Twist_twist
    ## DD0062   Tilt_tilt
    ## DD0063   Roll_roll
    ## DD0064   Twist_tilt
    ## DD0065   Twist_roll
    ## DD0066   Tilt_roll
    ## DD0067   Shift_shift
    ## DD0068   Slide_slide
    ## DD0069   Rise_rise
    ## DD0070   Shift_slide
    ## DD0071   Shift_rise
    ## DD0072   Slide_rise
    ## DD0073   Twist_shift
    ## DD0074   Twist_slide
    ## DD0075   Twist_rise
    ## DD0076   Tilt_shift
    ## DD0077   Tilt_slide
    ## DD0078   Tilt_rise
    ## DD0079   Roll_shift
    ## DD0080   Roll_slide
    ## DD0081   Roll_rise
    ## DD0082   Slidestiffness
    ## DD0083   Shiftstiffness
    ## DD0084   Rollstiffness
    ## DD0085   Risestiffness
    ## DD0086   Tiltstiffness
    ## DD0087   Twiststiffness
    ## DD0088   Wedge
    ## DD0089   Direction
    ## DD0090   Flexibility_slide
    ## DD0091   Flexibility_shift
    ## DD0092   Entropy
    ## Total number of properties : 92
