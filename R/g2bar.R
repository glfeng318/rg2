#' Bar chart
#' 
#' Bar chart
#' 
#' @param xField,yField,seriesField,groupField column name in data for aesthetic mapping.
#' @param isGroup,isStack,isRange,isPercent default to FALSE
#' @param color color
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2Bar <- function(data, xField, yField, seriesField=NULL,groupField=NULL,
                  isGroup=FALSE, isStack=FALSE, isRange=FALSE, isPercent=FALSE, color=NULL,
                  cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  seriesField = as.character(substitute(seriesField))  # NULL returns character(0)
  groupField = as.character(substitute(groupField))
  
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$isGroup=isGroup
  cfg$isStack=isStack
  cfg$isRange=isRange
  cfg$isPercent=isPercent
  
  # if isGroup=TRUE, isStack must be TRUE
  if (isGroup) {
    cfg$isStack=TRUE
  }
  
  if (isRange && !all(lapply(data[[yField]], length) == 2)) {
    stop("column [yField] for range bar should be a length-two numeric vector")
  }
  
  if (isPercent || isStack || isPercent) {
    cfg$interactions = c(list(type='element-highlight-by-color'),list(type='element-link'))
  }
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
    keep_col = append(keep_col, seriesField)
  }
  if (!identical(groupField, character(0))) {
    cfg$groupField = as.character(groupField)
    keep_col = append(keep_col, groupField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Bar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

