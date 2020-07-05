#' MeterGauge chart
#' 
#' MeterGauge chart
#' 
#' @param value Numeric value
#' @param range color range of the gauge, it separate the gauge to several parts by color, example: \code{range=c(0,25,50,75,100)}
#' @param min,max minimum and maximum value of the chart
#' @inheritParams g2
#' @family gauge
#' 
#' @export
g2MeterGauge <- function(value, range, min=0, max=1, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$value = value
  cfg$min = min
  cfg$max = max
  cfg$range = range
  # pass the data and settings using 'x'
  x <- list(
    type = 'MeterGauge',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



