#' GroupedBar chart
#' 
#' GroupedBar chart
#' 
#' @param xField,yField,groupField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2GroupedBar <- function(data, xField, yField, groupField, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  groupField = as.character(substitute(groupField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(groupField, character(0))) {
    cfg$groupField = as.character(groupField)
    keep_col = append(keep_col, groupField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'GroupedBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



