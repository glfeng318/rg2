#' StackedBar chart
#' 
#' StackedBar chart
#' 
#' @param xField,yField,stackField column name in data for aesthetic mapping
#' @param color color vector or javascript function
#' @param barSize automatic calculation if not specified
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2StackedBar <- function(data, xField, yField, stackField,
                         color = NULL, barSize = NULL,
                         cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  stackField = as.character(substitute(stackField))
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$color = color
  cfg$barSize = barSize
  keep_col = c(xField, yField, stackField)
  if (!identical(stackField, character(0))) {
    cfg$stackField = as.character(stackField)
    keep_col = append(keep_col, stackField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'StackedBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



