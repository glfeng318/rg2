#' ColumnLine chart
#' 
#' ColumnLine chart
#' 
#' @param xField,yField1,yField2,lineSeriesField column name in data for aesthetic mapping
#' @inheritParams g2
#' 
#' @export
g2ColumnLine <- function(data, xField, yField1, yField2, 
                         lineSeriesField = NULL,
                         cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField1 = as.character(substitute(yField1))
  yField2 = as.character(substitute(yField2))
  lineSeriesField = as.character(substitute(lineSeriesField))
  
  cfg$xField = xField
  cfg$yField = c(yField1, yField2)
  keep_col1 = c(xField, yField1)
  keep_col2 = c(xField, yField2)
  if (!identical(lineSeriesField, character(0))) {
    cfg$lineSeriesField = as.character(lineSeriesField)
    keep_col2 = append(keep_col2, lineSeriesField)
  }
  # remove duplicated row after separated data
  data1 = unique(subset(data, select = keep_col1))
  data2 = unique(subset(data, select = keep_col2))
  cfg$data = list(jsonlite::toJSON(data1),
                  jsonlite::toJSON(data2))
  # pass the data and settings using 'x'
  x <- list(
    type = 'ColumnLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



