
# rg2

<!-- badges: start -->
![R-CMD-check](https://github.com/glfeng318/rg2/workflows/R-CMD-check/badge.svg)
[![CRAN status](https://www.r-pkg.org/badges/version/rg2)](https://CRAN.R-project.org/package=rg2)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

rg2 is a wrapper of [G2Plot](https://g2plot.antv.antgroup.com/) for R.

## Installation

You can install the development version of rg2 like so:

```r
pak::pkg_install("glfeng318/rg2")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rg2)
data(mpg, package = 'ggplot2')

# g2plot with options that made by list()
opt = list(
  xField='displ',
  yField='hwy',
  colorField='class',
  shape='circle',
  legend=list(position='right')
)
g2plot(mpg,'scatter', opt)

# g2plot with options that made by g2_opt_from_json()
opt = g2_opt_from_json('{"xField":"displ","yField":"hwy","colorField": "class", "shape":"circle","legend":{"position":"right"}}')
g2plot(mpg,'scatter', opt)

# g2 with options that made by plot function with prefix 'g2_' and g2_opt()
g2_scatter(mpg, 'displ', 'hwy') |> 
  g2_opt(
    legend=list(position='right'),
    color='class'
    shape='circle'
  ) |> 
  g2()
```
![](./demo.png)

