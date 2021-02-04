#' RadialBar chart
#' 
#' RadialBar chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @param type Display type of plot. You can specify type='line' to display a Radial-Line plot.
#' @param radius,innerRadius radius/innerRadius of Polar coordinate. Value can be: (0, 1]
#' @param startAngle,endAngle,maxAngle Angle of the coordinate system.
#' @param minBarWidth,maxBarWidth Specify the min/max width of bar, pixel value. Auto adapt by default.
#' @param color color can be a character, list or javascript function:
#'   * '#60d7a7'
#'   * list(rising='#60d7a7', falling='#dedede', total='#fedca9')
#' @inheritParams g2
#' 
#' @export
g2RadialBar <- function(data, xField, yField,colorField=NULL,type=NULL,
                        radius=1, innerRadius=0.2, startAngle=-pi/2, endAngle=pi/2*3,maxAngle=240,
                        minBarWidth=NULL,maxBarWidth=NULL,color = NULL,
                        cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  
  if (!is.null(type)){
    cfg$type = type
  }
  cfg$radius = radius
  cfg$innerRadius = innerRadius
  cfg$startAngle = startAngle
  cfg$endAngle = endAngle
  cfg$maxAngle = maxAngle
  if (!is.null(minBarWidth)){
    cfg$minBarWidth = minBarWidth
  }
  if (!is.null(maxBarWidth)){
    cfg$maxBarWidth = maxBarWidth
  }
  if (!is.null(color)){
    cfg$color = color
  }
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'RadialBar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



