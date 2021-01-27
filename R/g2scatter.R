#' Scatter chart
#' 
#' Scatter chart
#' 
#' @param xField,yField,colorField,sizeField,shapeField column name in data for aesthetic mapping
#' @param color points color, overwritten by colorField parameter. If there is no colorField configured, 
#'   set one single color. Otherwise you can set a series of colors, or you can use callback function.
#'   Default: The color board of the theme.
#' @param shape default to 'circle', Optional values: 'circle','square','bowtie','diamond',
#'   'hexagon','triangle','triangle-down','cross','tick','plus','hyphen','line',
#'   'hollow-circle','hollow-square','hollow-bowtie','hollow-diamond','hollow-hexagon',
#'   'hollow-triangle','hollow-triangle-down'
#' @param regression type of regression line, exp | linear | loess | log | poly | pow | quad
#' @inheritParams g2
#' 
#' @export
g2Scatter <- function(data, xField, yField, 
                      colorField = NULL, sizeField = NULL, shapeField = NULL,
                      color = NULL, size = NULL, shape = 'circle',
                      regression = NULL,
                      cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  sizeField = as.character(substitute(sizeField))
  shapeField = as.character(substitute(shapeField))
  
  cfg$shape = shape
  if (!is.null(color)) {
    cfg$color = color
  }
  if (!is.null(size)) {
    cfg$size = size
  }
  if (!is.null(regression)) {
    cfg$regressionLine = list(type=regression)
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
  if (!identical(shapeField, character(0))) {
    cfg$shapeField = as.character(shapeField)
    keep_col = append(keep_col, shapeField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Scatter',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

