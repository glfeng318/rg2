#' Line chart
#' 
#' Line chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @param smooth smooth the line, default to `FALSE`
#' @param point display data point and the data label, default to `FALSE`. You can also configure the point
#'   by cfg parameter using `point = list(...)`, see \url{https://antv-g2plot.gitee.io/zh/examples/line/basic/API} for detail.
#' @inheritParams g2
#' @family line
#' 
#' @export
g2Line <- function(data, xField, yField, seriesField = NULL,
                   smooth = FALSE, point = FALSE,
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
  cfg$smooth = smooth
  cfg$point$visible = point
  if (point) {
    # TODO: label Overlap configuration https://g2.antv.vision/zh/docs/manual/tutorial/label
    # cfg$label = list(visible=TRUE,type='point')
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



