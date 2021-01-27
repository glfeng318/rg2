#' TinyLine chart
#' 
#' TinyLine chart
#' 
#' @param data numeric vector
#' @param connectNulls The width of line
#' @param smooth smooth the line, default to `FALSE`
#' @param color color or javascript function.
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyLine <- function(data, smooth = FALSE, connectNulls=FALSE, color = NULL,
                   cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$smooth = smooth
  cfg$connectNulls = connectNulls
  cfg$size = size
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



