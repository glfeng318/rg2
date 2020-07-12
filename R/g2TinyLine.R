#' TinyLine chart
#' 
#' TinyLine chart
#' 
#' @param xField,yField column name in data for aesthetic mapping
#' @param size The width of line
#' @param smooth smooth the line, default to `FALSE`
#' @param color color or javascript function.
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyLine <- function(data, xField, yField, 
                   size = 2, smooth = FALSE, color = NULL,
                   cfg = list(), width = 200, height = 50) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))

  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  cfg$smooth = smooth
  cfg$size = size
  if (!is.null(color)) {
    cfg$color = color
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



