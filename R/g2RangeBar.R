#' RangeBar chart
#' 
#' RangeBar chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#'   The data in xField column should be a vector with a start and end value, \code{c(10,50)}
#' @param color color vector or javascript function
#' @param barSize automatic calculation if not specified
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2RangeBar <- function(data, xField, yField, colorField = NULL,
                       color = NULL, barSize = NULL,
                       cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$color = color
  cfg$barSize = barSize
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'RangeBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



