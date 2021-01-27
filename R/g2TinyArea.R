#' TinyArea chart
#' 
#' TinyArea chart
#' 
#' @param data numeric vector
#' @param smooth smooth the line, default to `FALSE`
#' @param color Color or javascript function
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyArea <- function(data, smooth = FALSE, color = NULL,
                       cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$smooth = smooth
  cfg$color = color
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyArea',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



