#' Rose chart
#' 
#' Rose chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param radius,innerRadius range (0, 1]
#' @param isGroup,isStack default to FALSE
#' @param color Configure the color. If there is no colorField configured, 
#'   set one single color. Otherwise you can set a series of colors, or you can use callback function.
#'   Default: The color board of the theme.
#' @inheritParams g2
#' @family rose
#' 
#' @export
g2Rose <- function(data, xField, yField, seriesField = NULL, 
                   radius = NULL, innerRadius = NULL, color = NULL,
                   isGroup = FALSE, isStack = FALSE,
                   cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$isGroup = isGroup
  cfg$isStack = isStack
  if (!is.null(radius)) {
    cfg$radius = radius
  }
  if (!is.null(innerRadius)) {
    cfg$innerRadius = innerRadius
  }
  if (!is.null(color)) {
    cfg$color = color
  }
  
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
    type = 'Rose',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



