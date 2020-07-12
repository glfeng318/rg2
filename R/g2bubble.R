#' Bubble chart
#' 
#' Bubble chart
#' 
#' @param xField,yField,colorField,sizeField column name in data for aesthetic mapping
#' @inheritParams g2
#' 
#' @export
g2Bubble <- function(data, xField, yField, colorField, sizeField, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  sizeField = as.character(substitute(sizeField))
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$colorField = as.character(colorField)
  cfg$sizeField = as.character(sizeField)
  keep_col = c(xField, yField,colorField,sizeField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Bubble',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



