#' TinyArea chart
#' 
#' TinyArea chart
#' 
#' @param xField,yField column name in data for aesthetic mapping
#' @param smooth smooth the line, default to `FALSE`
#' @param color Color or javascript function
#' @inheritParams g2
#' @family tiny-chart
#' 
#' @export
g2TinyArea <- function(data, xField, yField,
                       smooth = FALSE, color = NULL,
                       cfg = list(), width = 200, height = 50) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))

  cfg$xField = xField
  cfg$yField = yField
  cfg$smooth = smooth
  if (!is.null(color)) {
    cfg$color = color
  }
  keep_col = c(xField, yField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'TinyArea',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



