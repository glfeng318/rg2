#' PercentStackedArea chart
#' 
#' PercentStackedArea chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2PercentStackedArea <- function(data, xField, yField, colorField = NULL, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField     = as.character(substitute(xField))
  yField     = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$xField     = xField
  cfg$yField     = yField
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data       = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'PercentStackedArea',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



