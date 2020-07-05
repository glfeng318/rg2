#' Heatmap chart
#' 
#' Heatmap chart
#' 
#' @param xField,yField,colorField,sizeField column name in data for aesthetic mapping
#' @param shapeType specified one of 'rect' and 'circle', default to `'rect'`
#' @param color color range vector
#' @param forceSquare Default to `FALSE`
#' @param shapeSize the size range of shape, c(min, max), default to `c(5, 50)`
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Heatmap <- function(data, xField, yField, colorField, sizeField = NULL,
                      color = NULL, shapeType = 'rect', 
                      forceSquare = FALSE, shapeSize = c(5, 50),
                      cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  sizeField = as.character(substitute(sizeField)) # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  cfg$colorField = colorField
  keep_col = c(xField, yField, colorField)
  if (!identical(sizeField, character(0))) {
    cfg$sizeField = as.character(sizeField)
    keep_col = append(keep_col, sizeField)
  }
  cfg$color = color
  cfg$shapeType = shapeType
  cfg$forceSquare = forceSquare
  cfg$shapeSize = shapeSize
  # meta, make sure x and y are all category
  cfg$meta = list()
  cfg$meta[[xField]] = list(type='cat')
  cfg$meta[[yField]] = list(type='cat')
  
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Heatmap',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



