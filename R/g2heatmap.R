#' Heatmap chart
#' 
#' Heatmap chart
#' 
#' @param xField,yField,colorField,sizeField column name in data for aesthetic mapping
#' @param type optional polygon | density default: polygon
#' @param reflect Axis mapping, optional x | y
#' @param color color range vector
#' @param shape optional rect | square | circle
#' @param sizeRatio The scale of the shapes in the thermal lattice, optional, takes effect only if the shape and sizeField specify at least one of these.
#' @inheritParams g2
#' @family heatmap
#' 
#' @export
g2Heatmap <- function(data, xField, yField, colorField=NULL, sizeField=NULL,
                      type='polygon',reflect='x',color = NULL, shape = 'rect', sizeRatio=NULL,
                      cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  sizeField = as.character(substitute(sizeField)) # NULL returns character(0)
  
  cfg$type = type
  cfg$reflect = reflect
  cfg$shape = shape
  if (!is.null(color)) {
    cfg$color = color
  }
  if (!is.null(sizeRatio)) {
    cfg$sizeRatio = sizeRatio
  }
  
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  if (!identical(sizeField, character(0))) {
    cfg$sizeField = as.character(sizeField)
    keep_col = append(keep_col, sizeField)
  }

  # meta, make sure x and y are all category
  cfg$meta = list()
  cfg$meta[[xField]] = list(type='cat')
  cfg$meta[[yField]] = list(type='cat')
  
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Heatmap',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



