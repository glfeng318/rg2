#' TinyColumn chart
#' 
#' TinyColumn chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param color color character, color vector or javascript function
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyColumn <- function(data, xField, yField, colorField = NULL, 
                         color = NULL,
                         cfg = list(), width = 200, height = 50) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  if (!is.null(color)) {
    cfg$color = color
  }
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyColumn',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

