#' Funnel chart
#' 
#' Funnel chart
#' 
#' @param xField,yField,compareField,seriesField column name in data for aesthetic mapping
#' @param isTransposed default to FALSE
#' @param dynamicHeight `TRUE` for mapping xField to width/angle of funnel with a fixed height, 
#'   `FALSE` for mapping xField to height of funnel with a fixed angle.
#' @param maxSize,minSize these fields are invalid when dynamicHeight=true
#' @param conversionTag FALSE for hide the conversion info or specify a `htmlwidgets::JS` \url{https://g2plot.antv.vision/en/docs/api/plots/funnel/}
#' @param color color
#' @inheritParams g2
#' 
#' @export
g2Funnel <- function(data, xField, yField, compareField = NULL,seriesField=NULL,
                     isTransposed=FALSE, dynamicHeight = FALSE,maxSize=1,minSize=1,conversionTag=NULL,color=NULL,
                     cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  compareField = as.character(substitute(compareField))
  seriesField = as.character(substitute(seriesField))
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(compareField, character(0))) {
    cfg$compareField = as.character(compareField)
    keep_col = append(keep_col, compareField)
  }
  if (!identical(seriesField, character(0))) {
    cfg$seriesField = as.character(seriesField)
    keep_col = append(keep_col, seriesField)
  }
  
  cfg$dynamicHeight = dynamicHeight
  cfg$isTransposed = isTransposed
  cfg$maxSize = maxSize
  cfg$minSize = minSize
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$conversionTag = list(offsetX=10, offsetY=0, formatter=htmlwidgets::JS("(datum) => 'conversion rate' + datum.$$percentage$$ * 100 + '%'"))
  
  
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Funnel',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



