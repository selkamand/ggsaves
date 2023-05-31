
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsaves

<!-- badges: start -->

[![R-CMD-check](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of ggsaves is to allow you to save PDF, 300dpi PNG, and SVG
versions of the same plot all at once

## Installation

You can install the development version of ggsaves from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("selkamand/ggsaves")
```

## Quick Start

``` r
library(ggplot2)
library(ggsaves)

my_gg_plot <- mtcars |> 
  ggplot(aes(mpg, cyl)) + 
  geom_point() 

ggsaves(my_gg_plot, prefix = "asdsa",  outfolder = ".")
```
