#' ColumnLine chart
#' 
#' ColumnLine chart
#' 
#' @param xField,yField1,yField2 column name in data for aesthetic mapping
#' @inheritParams g2
#' 
#' @export
g2ColumnLine <- function(data, xField, yField1, yField2, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField1 = as.character(substitute(yField1))
  yField2 = as.character(substitute(yField2))
  
  cfg$xField = xField
  cfg$yField = c(yField1, yField2)
  
  cfg$data = list(jsonlite::toJSON(subset(data, select = c(xField, yField1))),
                  jsonlite::toJSON(subset(data, select = c(xField, yField2))))
  # pass the data and settings using 'x'
  x <- list(
    type = 'ColumnLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



