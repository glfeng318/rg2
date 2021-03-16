#' Sunburst chart
#' 
#' Sunburst chart
#' 
#' @param seriesField,colorField column name in data for aesthetic mapping
#' @param type type
#' @param radius,innerRadius range (0, 1]
#' @param reflect reflect
#' @param color Configure the color. If there is no colorField configured, 
#'   set one single color. Otherwise you can set a series of colors, or you can use callback function.
#'   Default: The color board of the theme.
#' @inheritParams g2
#' @family rose
#' 
#' @export
g2Sunburst <- function(data, seriesField=NULL,colorField=NULL, type = 'partition',
                       radius=1,innerRadius=0.1, reflect = NULL, color = NULL,
                       cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  colorField = as.character(substitute(colorField))
  
  cfg$type = type
  cfg$radius = radius
  cfg$innerRadius = innerRadius
  if (!is.null(reflect)) {
    cfg$reflect = reflect
  }
  if (!is.null(innerRadius)) {
    cfg$innerRadius = innerRadius
  }
  if (!is.null(color)) {
    cfg$color = color
  }
  
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
  }
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
  }
  cfg$data = jsonlite::toJSON(data, auto_unbox = TRUE)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Sunburst',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



