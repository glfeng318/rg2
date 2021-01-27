#' Radar chart
#' 
#' Radar chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @param radius range (0, 1]
#' @param color color vector or a javascript function
#' @param smooth smooth the line
#' @inheritParams g2
#' 
#' @export
g2Radar <- function(data, xField, yField, seriesField = NULL, 
                    radius=NULL, color = NULL, smooth = FALSE, 
                    cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  if(!is.null(radius)) {
    cfg$radius = radius
  }
  if(!is.null(color)) {
    cfg$color = color
  }
  cfg$smooth = smooth
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
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



