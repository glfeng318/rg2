#' TinyColumn chart
#' 
#' TinyColumn chart
#' 
#' @param data numeric vector
#' @param columnWidthRatio optional number default: 0.5
#' @param color color character, color vector or javascript function
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyColumn <- function(data, columnWidthRatio=0.5, color = NULL,
                         cfg = list(), width = 200, height = 50) {
  # prep cfg
  cfg$columnWidthRatio = columnWidthRatio
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyColumn',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

