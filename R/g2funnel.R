#' Funnel chart
#' 
#' Funnel chart
#' 
#' @param xField,yField column name in data for aesthetic mapping
#' @param dynamicHeight `TRUE` for mapping xField to width/angle of funnel with a fixed height, 
#'   `FALSE` for mapping xField to height of funnel with a fixed angle.
#' @param transpose `TRUE` for horizontal funnel, and `FALSE` for vertical funnel
#' @param compareField Required by compare funnel. specified values will overwrite the dynamicHeight to `FALSE`.
#'   you can configure the compare text style in `cfg` parameter with `compareText=list(...)`
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Funnel <- function(data, xField, yField, compareField = NULL,
                     dynamicHeight = FALSE, transpose = FALSE,
                     cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  compareField = as.character(substitute(compareField))
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(compareField, character(0))) {
    cfg$compareField = as.character(compareField)
    keep_col = append(keep_col, compareField)
  }
  
  cfg$dynamicHeight = dynamicHeight
  cfg$transpose = transpose
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



