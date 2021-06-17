#' Line chart
#' 
#' Line chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @param smooth smooth the line, default to `FALSE`
#' @param stepType optional hv | vh | hvh | vhv, smooth will be disabled. 
#' @param connectNulls default to TRUE
#' @param isStack default to FALSE
#' @param color color vector or javascript function.
#' @param point `point=list()` to display data point, Or you can specify color,size,shape and style: \url{https://g2plot.antv.vision/en/examples/line/basic/}
#' @inheritParams g2
#' @family line
#' 
#' @export
g2Line <- function(data, xField, yField, seriesField = NULL,
                   smooth = FALSE, stepType = NULL, connectNulls=TRUE, 
                   isStack=FALSE, point=NULL, color = NULL,
                   cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
  }
  
  cfg$smooth = smooth
  cfg$isStack = isStack
  cfg$connectNulls = connectNulls
  
  if (!is.null(stepType)) {
    cfg$stepType = stepType
  }
  if (!is.null(point)) {
    cfg$point = point
  }
  if (!is.null(color)) {
    cfg$color = color
  }
  
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Line',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



