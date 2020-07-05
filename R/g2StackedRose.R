#' StackedRose chart
#' 
#' StackedRose chart
#' 
#' @param radiusField,categoryField,stackField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family rose
#' 
#' @export
g2StackedRose <- function(data, radiusField, categoryField, stackField, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  radiusField = as.character(substitute(radiusField))
  categoryField = as.character(substitute(categoryField))
  stackField = as.character(substitute(stackField))
  
  cfg$radiusField = radiusField
  cfg$categoryField = categoryField
  cfg$stackField = as.character(stackField)
  keep_col = c(radiusField, categoryField, stackField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'StackedRose',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



