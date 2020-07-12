#' Waterfall chart
#' 
#' Waterfall chart
#' It's not recommended to use colorField param for waterfall chart (such as basic the column chart)
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param color color can be a character, list or javascript function:
#'   * '#60d7a7'
#'   * list(rising='#60d7a7', falling='#dedede', total='#fedca9')
#' @inheritParams g2
#' 
#' @export
g2Waterfall <- function(data, xField, yField, colorField = NULL, 
                        color = NULL,
                        cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  if (!is.null(color)){
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
    type = 'Waterfall',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



