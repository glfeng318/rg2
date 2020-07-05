#' Radar chart
#' 
#' Radar chart
#' 
#' @param angleField,radiusField,seriesField column name in data for aesthetic mapping
#' @param color color vector or a javascript function
#' @param smooth smooth the line
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Radar <- function(data, angleField, radiusField, seriesField = NULL, 
                    color = NULL, smooth = FALSE, 
                    cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  angleField = as.character(substitute(angleField))
  radiusField = as.character(substitute(radiusField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$angleField = angleField
  cfg$radiusField = radiusField
  keep_col = c(angleField, radiusField)
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
    keep_col = append(keep_col, seriesField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Radar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



