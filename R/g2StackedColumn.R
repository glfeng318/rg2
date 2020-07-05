#' StackedColumn chart
#' 
#' StackedColumn chart
#' 
#' @param xField,yField,stackField column name in data for aesthetic mapping
#' @param color color vector or javascript function
#' @columnSize automatic calculation if not specified
#' @param connectedArea `TRUE` fro display the connected line, default to `FALSE`
#' @inheritParams g2
#' @family column
#' 
#' @export
g2StackedColumn <- function(data, xField, yField, stackField,
                            color = NULL, columnSize = NULL,connectedArea = FALSE,
                            cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  stackField = as.character(substitute(stackField))
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$color = color
  cfg$columnSize = columnSize
  if (connectedArea){
    cfg$connectedArea = list(visible=TRUE, triggerOn=FALSE)
  }
  keep_col = c(xField, yField, stackField)
  if (!identical(stackField, character(0))) {
    cfg$stackField = as.character(stackField)
    keep_col = append(keep_col, stackField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'StackedColumn',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



