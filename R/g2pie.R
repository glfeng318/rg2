#' Pie chart
#' 
#' Pie chart
#' 
#' @param angleField,colorField column name in data for aesthetic mapping
#' @param radius,innerRadius radius default to 0.8
#' @param startAngle,endAngle optional number, startAngle=pi,endAngle=pi*1.5
#' @param color color vector or a javascript function
#' @inheritParams g2
#' @family pie
#' 
#' @export
g2Pie <- function(data, angleField, colorField = NULL, 
                  radius = 0.8, innerRadius=0, startAngle=NULL,endAngle=NULL,color = NULL,
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
  cfg$innerRadius = innerRadius
  if (!is.null(color)){
    cfg$color = color
  }
  if (!is.null(startAngle)) {
    cfg$startAngle = startAngle
  }
  if (!is.null(endAngle)) {
    cfg$endAngle = endAngle
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # make sure angleField and colorField get the right type
  if (all(is.character(data[[angleField]])) || all(is.numeric(data[[colorField]]))) {
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



