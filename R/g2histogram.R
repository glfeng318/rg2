#' Histogram chart
#' 
#' Histogram chart
#' 
#' @param binField,stackField column name in data for aesthetic mapping
#' @param binWidth,binNumber width/number of bins. you must specify at least one of these.
#' @param color color of histogram chart
#' @inheritParams g2
#' 
#' @export
g2Histogram <- function(data, binField,stackField=NULL, binWidth, binNumber = NULL, color = NULL, 
                        cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  binField = as.character(substitute(binField))
  stackField = as.character(substitute(stackField))
  
  cfg$binField = binField
  if (!is.null(binWidth)) {
    cfg$binWidth = binWidth
  } else if (!is.null(binNumber)) {
    cfg$binNumber = binNumber
  } else {
    stop('you must specify at least one of binWidth and binNumber')
  }
  keep_col = c(binField)
  if (!identical(stackField, character(0))) {
    cfg$stackField = as.character(stackField)
    keep_col = append(keep_col, stackField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Histogram',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

