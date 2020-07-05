#' Liquid chart
#' 
#' Liquid chart
#' 
#' @param value,min,max The current value / minimum value / maximum value
#' @param color The color of liquid chart
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Liquid <- function(value, min, max, color = NULL, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$value = value
  cfg$min = min
  cfg$max = max
  if (!is.null(color)) {
    cfg$color = color
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'Liquid',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



