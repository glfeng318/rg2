#' RingProgress chart
#' 
#' RingProgress chart
#' 
#' @param percent The percent of RingProgress, value should between 0 and 1.
#' @param color The color of chart
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2RingProgress <- function(percent, color = NULL,  
                       cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$percent = percent
  if (!is.null(color)) {
    cfg$color = color
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'RingProgress',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}
