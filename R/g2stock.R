#' Stock chart
#' 
#' Stock chart
#' 
#' @param xField,yField column name in data for aesthetic mapping. yField should be a length-four vector for ['open', 'close', 'high', 'low']
#' @param color color
#' @inheritParams g2
#' @family stock
#' 
#' @export
g2Stock <- function(data, xField, yField,color=NULL,
                  cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  if (yField[1] != 'c' || length(yField) != 5){
    stop('yField should be a length-four vector')
  }
  yField = yField[-1]

  if (!is.null(color)) {
    cfg$color = color
  }

  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Stock',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

