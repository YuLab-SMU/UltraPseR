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
x <- UltraPseR::UpseR(input = tiny_sequences, format = "csv", module = "comp", note = "stdprot") %>% capture.output
x
```

    ## [1] "043L_IIV6|0, 0.000, 4.310, 7.759, 7.759, 5.172, 3.448, 0.000, 14.655, 12.931, 10.345, 2.586, 13.793, 1.724, 1.724, 0.862, 2.586, 2.586, 3.448, 0.862, 3.448, (nil)"
    ## [2] "094L_IIV6|0, 1.695, 3.390, 3.390, 5.085, 3.390, 3.390, 2.542, 11.864, 11.017, 9.322, 4.237, 14.407, 0.847, 2.542, 1.695, 7.627, 5.932, 2.542, 0.000, 5.085, (nil)"

### Pse-Protein

``` r
tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
UltraPseR::UpseR(input = tiny_sequences, format = "svm", note = "stdprot", module = "pse", property = "ZIMJ680105", w = 0.05, l = 10, t = 2)
```

    ## 0  1:0.000 2:4.341 3:7.813 4:7.813 5:5.209 6:3.473 7:0.000 8:14.759 9:13.022 10:10.418 11:2.604 12:13.891 13:1.736 14:1.736 15:0.868 16:2.604 17:2.604 18:3.473 19:0.868 20:3.473 21:-1.019 22:0.895 23:-1.150 24:0.711 25:-0.812 26:0.017 27:-0.184 28:0.547 29:0.148 30:0.140 # 043L_IIV6|0
    ## 0  1:1.719 2:3.438 3:3.438 4:5.157 5:3.438 6:3.438 7:2.578 8:12.033 9:11.173 10:9.454 11:4.297 12:14.611 13:0.859 14:2.578 15:1.719 16:7.735 17:6.016 18:2.578 19:0.000 20:5.157 21:-0.069 22:-0.060 23:-0.371 24:0.179 25:-0.013 26:0.281 27:-0.213 28:-0.598 29:-0.163 30:-0.391 # 094L_IIV6|0

### Pse-DiDNA

``` r
DNA_sequences <- system.file("extdata", "tiny-dna.fas", package = "UltraPseR")
UltraPseR::UpseR(input = DNA_sequences, format = "tsv", note = "didna", module = "pse", property = "DD0033", w = 0.05, l = 3, t = 1)
```

    ## Example1 0.000   8.216   8.216   8.216   8.216   0.000   0.000   0.000   8.216   0.000   0.000   8.216   4.108   4.108   8.216   4.108   11.690  11.220  7.251   (nil)
    ## Example2 0.000   8.216   8.216   8.216   8.216   0.000   0.000   0.000   8.216   0.000   0.000   8.216   4.108   4.108   8.216   4.108   11.690  11.220  7.251   (nil)

### Explore proprety

``` r
UltraPseR::availabel_prop(note = "didna")
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
