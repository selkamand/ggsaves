
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsaves

<!-- badges: start -->

[![R-CMD-check](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggsaves)](https://CRAN.R-project.org/package=ggsaves)
<!-- badges: end -->

ggsaves saves a ggplot as a PDF, 300dpi PNG, and SVG all at once. This
is an exceptionally simple convenience package that wraps
`ggplot2::ggsave()`.

It can also save ggiraph objects in html, svg, and png formats with
`ggisaves`

## Installation

Install ggsaves from CRAN

``` r
install.packages('ggsaves')
#> Installing package into '/private/var/folders/93/mb2bzm5j2v7625bbl3pnxb1h0000gp/T/RtmpbvOXCv/temp_libpath16ffc5a0c0cac'
#> (as 'lib' is unspecified)
#> Warning: package 'ggsaves' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
```

Alternatively, install the development version of ggsaves from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("selkamand/ggsaves")
```

## Quick Start

Saving a ggplot

``` r
library(ggplot2)
library(ggsaves)

gg_plot <- mtcars |> 
  ggplot(aes(mpg, cyl)) + 
  geom_point() 

ggsaves(gg_plot, prefix = "myplot",  outfolder = ".")
```

Saving a ggiraph plot

``` r
library(ggiraph)
gg_plot <- iris |> 
  ggplot(aes(Sepal.Length, Sepal.Width)) + 
  geom_point_interactive(aes(data_id  = Species, tooltip = Species))

 interactive_gg_plot <- girafe(ggobj = gg_plot)
 
 ggisaves(interactive_gg_plot, prefix = "my_interactive_plot", outfolder = ".")
```
