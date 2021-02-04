#' Progress chart
#' 
#' Progress chart
#' 
#' @param percent The percent of progress, value should between 0 and 1.
#' @param barWidthRatio Ragne [0, 1], defualt 0.5
#' @param color The color of chart, single color or length-two color vector
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2Progress <- function(percent, barWidthRatio = 10, color = NULL, 
                     cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$percent = percent
  cfg$barWidthRatio = barWidthRatio
  if (!is.null(color)) {
    cfg$color = color
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'Progress',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}
