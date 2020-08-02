#' MeterGauge chart
#' 
#' MeterGauge chart
#' 
#' @param value Numeric value
#' @param range color range of the gauge, it separate the gauge to several parts by color, example: \code{range=c(0,25,50,75,100)}
#' @param min,max minimum and maximum value of the chart
#' @param color color vector, support gradient color: `c('l(0) 0:#5d7cef 1:#e35767')`
#' @param rangeSize The width of gauge
#' @inheritParams g2
#' @family gauge
#' 
#' @export
g2MeterGauge <- function(value, range, min=0, max=1, 
                         color = NULL, rangeSize=24,
                         cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$value = value
  cfg$min = min
  cfg$max = max
  cfg$range = range
  cfg$rangeSize = rangeSize
  if (!is.null(color)) {
    cfg$color = ifelse(length(color)==1, list(color), color)
    if (length(range) != length(color)) {
      warning('The length of color vector should match the color-range separated by param range.')
    }
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'MeterGauge',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



