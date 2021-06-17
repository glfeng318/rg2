#' DensityHeatmap chart
#' 
#' DensityHeatmap chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param color character color vector. For example: c('#295599', '#3e94c0', '#78c6d0', '#b4d9e4', '#fffef0', '#f9cdac', '#ec7d92', '#bc448c')
#' @param radius  Numeric heat radius. automatic calculation.
#' @param intensity Numeric heat weight, default to 2.
#' @inheritParams g2
#' @family heatmap
#' 
#' @export
g2DensityHeatmap <- function(data, xField, yField, colorField, 
                             color = NULL, radius = NULL, intensity = 2, 
                             cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  
  cfg$xField = xField
  cfg$yField = yField
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
  }
  if (!is.null(color)){
    cfg$color = color
  }
  if (!is.null(radius)){
    cfg$radius = radius
  }
  cfg$intensity = intensity
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'DensityHeatmap',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



