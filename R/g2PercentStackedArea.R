#' PercentStackedArea chart
#' 
#' PercentStackedArea chart
#' 
#' @param xField,yField,stackField column name in data for aesthetic mapping
#' @param color Color vector or javascript function
#' @param smooth smooth the line
#' @param label The label type can be specified with `'area'` or `'line'`, default to NULL
#' @inheritParams g2
#' @family area
#' 
#' @export
g2PercentStackedArea <- function(data, xField, yField, stackField,
                                 color = NULL, smooth = FALSE, label = NULL,
                                 cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  stackField = as.character(substitute(stackField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$stackField = as.character(stackField)
  if (!is.null(label)) {
    cfg$label = list(visible=TRUE, type=label, autoScale=TRUE)
  }
  keep_col = c(xField, yField, stackField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'PercentStackedArea',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



