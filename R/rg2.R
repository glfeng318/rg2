
#' Line chart
#' 
#' Line chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family line
#' 
#' @export
g2Line <- function(data, xField, yField, seriesField = NULL,
                   cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
  }
  
  cfg$data = jsonlite::toJSON(data)
  x <- list(
    type = 'Line',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}
