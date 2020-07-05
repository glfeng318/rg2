#' Rose chart
#' 
#' Rose chart
#' 
#' @param radiusField,categoryField,colorField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family rose
#' 
#' @export
g2Rose <- function(data, radiusField, categoryField, colorField = NULL, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  radiusField = as.character(substitute(radiusField))
  categoryField = as.character(substitute(categoryField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$radiusField = radiusField
  cfg$categoryField = categoryField
  keep_col = c(radiusField, categoryField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Rose',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



