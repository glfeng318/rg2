
# rg2

<!-- badges: start -->
![R-CMD-check](https://github.com/glfeng318/rg2/workflows/R-CMD-check/badge.svg)
[![CRAN status](https://www.r-pkg.org/badges/version/rg2)](https://CRAN.R-project.org/package=rg2)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-experimental-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

rg2 is a wrapper of [G2](https://g2.antv.antgroup.com/en/) for R.

## Installation

You can install rg2 from GitHub:

```r
pak::pkg_install("glfeng318/rg2")
```

## Documentation

- [Wiki](https://github.com/glfeng318/rg2/wiki) (getting started, usage, etc.)
- [G2 Spec](https://g2.antv.antgroup.com/en/spec/overview)

## Example

This is a basic example which shows you how to render a plot:

``` r
library(rg2)

g2(iris, encode('Sepal.Length','Sepal.Width',color='Species', shape='circle')) + g2_point() + title('iris')
```
![](./demo.png)
