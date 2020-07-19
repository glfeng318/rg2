#' Scatter chart
#' 
#' Scatter chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param color points color, overwritten by colorField parameter.
#' @param shape default to circle. Optional values: 'circle','square','bowtie','diamond',
#'   'hexagon','triangle','triangle-down','cross','tick','plus','hyphen','line',
#'   'hollow-circle','hollow-square','hollow-bowtie','hollow-diamond','hollow-hexagon',
#'   'hollow-triangle','hollow-triangle-down'
#' @inheritParams g2
#' 
#' @export
g2Scatter <- function(data, xField, yField, colorField = NULL,
                      color = NULL, shape = 'circle',
                      cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$shape = shape
  if (!is.null(color)) {
    cfg$color = color
  }
  
  cfg$xField = xField
  cfg$yField = yField
  
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
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

