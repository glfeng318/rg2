#' Area chart
#' 
#' Area chart
#' 
#' @param xField,yField,seriesField column name in data for aesthetic mapping
#' @param isStack,isPercent default to TRUE
#' @param color Color vector or javascript function
#' @inheritParams g2
#' @family area
#' 
#' @export
g2Area <- function(data, xField, yField, seriesField = NULL,
                   isStack=TRUE, isPercent=TRUE,color = NULL,
                   cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  
  cfg$isStack = isStack
  cfg$isPercent = isPercent
  # if (isPercent && identical(seriesField, character(0))) {
  #   stop('percent stack area requires seriesField')
  #}
  
  cfg$xField = xField
  cfg$yField = yField
  if (!is.null(color)) {
    cfg$color = color
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
    type = 'Area',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



