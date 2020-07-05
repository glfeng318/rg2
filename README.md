# rg2 <img src="man/figures/whale.128.png" align="right" width="128" />

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/rg2)](https://cran.r-project.org/package=rg2)

## Overview

rg2 is a wrapper of [G2Plot](https://g2plot.antv.vision/) for R.

![cover](man/figures/cover.png)

## Installation

```
# install the development version from GitHub:
devtools::install_github("13kay/rg2")
```

## quickstart

```r
library(rg2)

df = jsonlite::fromJSON('[
{ "action": "浏览", "pv": 5000 },
{ "action": "加购", "pv": 3500 },
{ "action": "下单", "pv": 2500 },
{ "action": "支付", "pv": 1500 },
{ "action": "成交", "pv": 850 }]')

cfg = list(
  title = list(
    visible=TRUE, text='店铺转化率'
  ),
  description = list(
    visible=TRUE, text='浏览->加购->下单->支付->成交'
  ),
  conversionTag = list(visible=TRUE)
)
g2Bar(df, pv, action, cfg = cfg)
```

<img src="man/figures/quickstart.png" width="639" />
