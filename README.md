
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsaves

<!-- badges: start -->

[![R-CMD-check](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/ggsaves/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/selkamand/ggsaves/graph/badge.svg)](https://app.codecov.io/gh/selkamand/ggsaves)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggsaves)](https://CRAN.R-project.org/package=ggsaves)
![GitHub Issues or Pull
Requests](https://img.shields.io/github/issues-closed/selkamand/ggsaves)
[![code
size](https://img.shields.io/github/languages/code-size/selkamand/ggsaves.svg)](https://github.com/selkamand/ggsaves)
![GitHub last
commit](https://img.shields.io/github/last-commit/selkamand/ggsaves)
<!-- badges: end -->

ggsaves saves a ggplot as a PDF SVG, 300dpi PNG and TIFF all at once.
This is an exceptionally simple convenience package that wraps
`ggplot2::ggsave()`.

HTMLwidgets (including ggiraph objects) can also be saved to saved as
HTML, SVG, PDF, PNG and TIFF formats with `ggisaves()`

## Installation

    install.packages("ggsaves")

### Development Version

Install the development version of ggsaves from
[GitHub](https://github.com/) with:

``` r
if (!require("remotes"))
    install.packages("remotes")

remotes::install_github("selkamand/ggsaves")
```

## Quick Start

Saving a ggplot:

``` r
library(ggplot2)
library(ggsaves)

# Create Plot
gg_plot <- ggplot(mtcars, aes(mpg, cyl)) + geom_point() 

# Save as all common file formats
ggsaves(gg_plot, prefix = "myplot",  outfolder = "plots")
```

Saving a ggiraph plot (or other HTMLwidget visualisation):

``` r
library(ggiraph)

# Make static ggplot
gg_plot <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point_interactive(aes(data_id  = Species, tooltip = Species))

# Create interactive HTMLwidget
interactive_gg_plot <- girafe(ggobj = gg_plot)
 
# Save HTMLwidget
ggisaves(interactive_gg_plot, prefix = "my_interactive_plot", outfolder = "interactive_plots")
```
