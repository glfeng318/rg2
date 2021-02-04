#' BidirectionalBar chart
#' 
#' BidirectionalBar chart
#' 
#' @param xField,yField column name in data for aesthetic mapping.
#' @param layout Layout modes, optional 'horizontal' | 'vertical' default: 'horizontal'
#' @param yAxis yAxis is a list, Keys are the fields defined in yField, values is the configuration of axis.
#' @param color color
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2BidirectionalBar <- function(data, xField, yField,
                               layout='horizontal', yAxis=NULL,
                               cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))

  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$layout=layout

  if (is.null(yAxis)) {
    cfg$yAxis = list( position='bottom')
  } else {
    cfg$yAxis=yAxis
  }
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'BidirectionalBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

