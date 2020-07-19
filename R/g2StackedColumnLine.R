#' StackedColumnLine chart
#' 
#' StackedColumnLine chart
#' 
#' @param xField,yField1,yField2,columnStackField,lineSeriesField column name in data for aesthetic mapping
#' @inheritParams g2
#' 
#' @export
g2StackedColumnLine <- function(data, xField, yField1, yField2, columnStackField,
                                lineSeriesField = NULL,
                                cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField1 = as.character(substitute(yField1))
  yField2 = as.character(substitute(yField2))
  columnStackField = as.character(substitute(columnStackField))
  lineSeriesField = as.character(substitute(lineSeriesField))
  
  cfg$xField = xField
  cfg$yField = c(yField1, yField2)
  cfg$columnStackField = columnStackField
  keep_col1 = c(xField, yField1, columnStackField)
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
    type = 'StackedColumnLine',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



