#' Gauge chart
#' 
#' Gauge chart
#' 
#' @param percent percent value [0, 1]
#' @param radius,innerRadius default 0.95, 0.9
#' @param startAngle,endAngle default `(-7/6)*pi`, `(1/6)*pi`
#' @param range a list contains `ticks`(numeric vector [0, 1]) and `color`(color string vector)
#' @param indicator NULL to disable indicator, or a list contains `pointer` and `pin`, which both have the same style configuration \url{https://g2plot.antv.vision/en/docs/api/plots/gauge/}
#' @inheritParams g2
#' @family gauge
#' 
#' @section TODO: make statistic as parameter
#' 
#' @export
g2Gauge <- function(percent, radius=0.95, innerRadius=0.9, startAngle=(-7/6)*pi, endAngle=(1/6)*pi, 
                    range=list(),indicator=list(),
                    cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$percent = percent
  cfg$radius = radius
  cfg$innerRadius = innerRadius
  cfg$startAngle = startAngle
  cfg$endAngle = endAngle
  cfg$range = range
  # pass the data and settings using 'x'
  x <- list(
    type = 'Gauge',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



