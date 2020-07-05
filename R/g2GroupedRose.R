#' GroupedRose chart
#' 
#' GroupedRose chart
#' 
#' @param radiusField,categoryField,groupField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family rose
#' 
#' @export
g2GroupedRose <- function(data, radiusField, categoryField, groupField, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  radiusField = as.character(substitute(radiusField))
  categoryField = as.character(substitute(categoryField))
  groupField = as.character(substitute(groupField))  # NULL returns character(0)
  
  cfg$radiusField = radiusField
  cfg$categoryField = categoryField
  cfg$groupField = as.character(groupField)
  keep_col = c(radiusField, categoryField, groupField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'GroupedRose',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



