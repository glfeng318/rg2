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
#' @param interaction You can specify `'slider'` or `'scrollbar'` for a large dataset
#' @param point display data point and the data label, default to `FALSE`. You can also configure the point
#'   by cfg parameter using `point = list(...)`, see \url{https://g2plot.antv.vision/en/docs/api/plots/line#point} for detail.
#' @inheritParams g2
#' @family line
#' 
#' @export
g2Line <- function(data, xField, yField, seriesField = NULL,
                   smooth = FALSE, stepType = NULL, connectNulls=TRUE, 
                   isStack=FALSE, point=NULL, color = NULL,
                   interaction=NULL,
                   cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
    keep_col = append(keep_col, seriesField)
  }
  
  if (!is.null(interaction)) {
    cfg$interactions = c(list(type=interaction, cfg=list(start=0.1,end=0.2)),list())
  }
  cfg$smooth = smooth
  if (!is.null(stepType)) {
    cfg$stepType = stepType
  }
  if (!is.null(point)) {
    cfg$point = point
  }
  if (!is.null(color)) {
    cfg$color = color
  }
  
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Line',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



