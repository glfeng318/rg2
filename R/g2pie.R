#' Pie chart
#' 
#' Pie chart
#' 
#' @param angleField,colorField column name in data for aesthetic mapping
#' @param radius default to 0.8
#' @param color color vector or a javascript function
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Pie <- function(data, angleField, colorField = NULL, 
                  radius = 0.8, color = NULL,
                  cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  angleField = as.character(substitute(angleField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$angleField = angleField
  keep_col = c(angleField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  cfg$radius = radius
  if (!is.null(color)){
    cfg$color = color
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # make sure angleField and colorField get the right type
  if (is.character(df[[angleField]]) | is.numeric(df[[colorField]])) {
    stop('angleField should be numeric and colorField should be character')
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'Pie',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



