## ---- include = FALSE---------------------------------------------------------
library(rg2)
knitr::opts_chunk$set(fig.dpi = 96, collapse = TRUE, comment = "#>")

## ----fig.height=3, fig.width=3------------------------------------------------
cfg = list(
  title = list(
    visible=TRUE, 
    text='title goes here'
  ),
  description = list(
    visible=TRUE, 
    text='this is the description text'
  )
)
g2Gauge(0.8, range=c(0,0.8,1), cfg = cfg)

## ----eval=FALSE---------------------------------------------------------------
#  list(
#    visible = TRUE,
#    text    = 'title text',
#    alignTo = 'left',
#    style   = list(fontSize      = 12,
#                   fill          = '#000000',   # or 'red'
#                   stroke        = '#AEAEAE',
#                   lineWidth     = 2,
#                   lineDash      = 2,
#                   opacity       = 2,
#                   fillOpacity   = 2,
#                   strokeOpacity = 2
#              )
#  )

## -----------------------------------------------------------------------------
cfg = list(theme = 'dark')
g2Liquid(value=0.5, min=0, max=1, cfg=cfg)

## ----eval=FALSE---------------------------------------------------------------
#  cfg = list(
#    xAxis = list(
#      visible  = TRUE,
#      grid     = list(visible = FALSE),
#      line     = list(visible = TRUE),
#      tickLine = list(visible = TRUE),
#      label    = list(visible = TRUE,  autoRotate = TRUE, autoHide = TRUE),
#      title    = list(visible = FALSE, offset = 12)
#    )
#  )

## ----eval=FALSE---------------------------------------------------------------
#  cfg = list(
#    xAxis = list(
#      visible  = TRUE,
#      grid     = list(visible = TRUE),
#      line     = list(visible = FALSE),
#      tickLine = list(visible = FALSE),
#      label    = list(visible = TRUE),
#      title    = list(visible = TRUE, offset = 12)
#    )
#  )

## ----eval=FALSE---------------------------------------------------------------
#  cfg = list(
#    legend = list(
#      visible  = TRUE,
#      flipPage = TRUE,
#      position = 'top'
#    )
#  )
#  

## ----eval=FALSE---------------------------------------------------------------
#  cfg = list(
#    padding = c(50, 50, 50, 50)
#  )

## ----eval=FALSE---------------------------------------------------------------
#  cfg = list(
#    padding = 'auto'
#  )

