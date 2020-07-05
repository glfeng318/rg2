#' StepLine chart
#' 
#' StepLine chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @param step The step turning pattern, one of 'hv' | 'vh' | 'vhv' | 'hvh', default to 'hv'
#' @param color color vector or javascript function
#' @param interaction You can specify `'slider'` or `'scrollbar'` for a large dataset
#' @param lineSize default to 2
#' @inheritParams g2
#' @family line
#' 
#' @export
g2StepLine <- function(data, xField, yField, seriesField = NULL, 
                       step = 'hv', color = NULL, lineSize = 2, 
                       interaction = NULL,
                       cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$step = step
  cfg$color = color
  cfg$lineSize = lineSize
  if (!is.null(interaction)) {
    cfg$interactions = c(list(type=interaction, cfg=list(start=0.1,end=0.2)),list())
  }
  keep_col = c(xField, yField)
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
    keep_col = append(keep_col, seriesField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'StepLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



