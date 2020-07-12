#' Progress chart
#' 
#' Progress chart
#' 
#' @param percent The percent of progress, value should between 0 and 1.
#' @param color The color of chart
#' @param size The height of progress bar, default to 10.
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2Progress <- function(percent, color = NULL, size = 10, 
                     cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$percent = percent
  cfg$size = size
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
