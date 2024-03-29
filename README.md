# rg2

<!-- badges: start -->
![R-CMD-check](https://github.com/glfeng318/rg2/workflows/R-CMD-check/badge.svg)
[![CRAN status](https://www.r-pkg.org/badges/version/rg2)](https://CRAN.R-project.org/package=rg2)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

rg2 is a wrapper of [G2Plot](https://g2plot.antv.antgroup.com/) for R.

## Installation

You can install rg2 from GitHub:

```r
pak::pkg_install("glfeng318/rg2")
```

## Documentation

- [Wiki](https://github.com/glfeng318/rg2/wiki) (getting started, usage, etc.)
- [G2Plot options](https://g2plot.antv.antgroup.com/en/api/plot-api)

## Example

This is a basic example which shows you how to render a plot:

``` r
library(rg2)

g2_scatter(iris,'Sepal.Length','Sepal.Width',colorField='Species') |> 
  g2_opt(
    legend=list(position='right'),
    shape='circle',
    size=5
  ) |> 
  g2()
```
![](./demo.png)

