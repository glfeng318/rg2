#' StackedBar chart
#' 
#' StackedBar chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2StackedBar <- function(data, xField, yField, colorField = '', cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$data       = jsonlite::toJSON(data)
  cfg$xField     = xField
  cfg$yField     = yField
  cfg$colorField = colorField
  
  # pass the data and settings using 'x'
  x <- list(
    type = 'StackedBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



