#' DualAxes chart
#' 
#' DualAxes chart
#' 
#' @param xField,yField1,yField2 column name in data for aesthetic mapping
#' @param type ll for line-line, cl for column-line
#' @param geometryOptions check \url{https://g2plot.antv.vision/en/docs/api/plots/dual-axes/#geometryoptions} for more dtail.
#'   column geometry can specify: seriesField,groupField,isStack,isGroup and some other param in g2Column, for example `list(list(geometry='column', isStack=TRUE), list(geometry='line'))`
#'   line geometry can specify: seriesField,smooth and some other param in g2Line, for example `list(list(geometry='column'), list(geometry='line',seriesField='cate'))`
#' @inheritParams g2
#' @family area
#' 
#' 
#' #' @examples
#' \dontrun{
#' 
#' df = jsonlite::fromJSON(' [
#' { "year": "1991", "value": 3,   "count": 10 },
#' { "year": "1992", "value": 4,   "count": 4 },
#' { "year": "1993", "value": 3.5, "count": 5 },
#' { "year": "1994", "value": 5,   "count": 5 },
#' { "year": "1995", "value": 4.9, "count": 4.9 },
#' { "year": "1996", "value": 6,   "count": 35 },
#' { "year": "1997", "value": 7,   "count": 7 },
#' { "year": "1998", "value": 9,   "count": 1 },
#' { "year": "1999", "value": 13,  "count": 20 }
#' ]')
#' g2DualAxes(df, year, value, count)
#' g2DualAxes(df, year, value, count, type='cl')
#' g2DualAxes(df, year, value, count, type='lc')
#' df = list(jsonlite::fromJSON('[
#'   { "time": "2019-03", "value": 35 },
#'   { "time": "2019-04", "value": 90 },
#'   { "time": "2019-05", "value": 30 },
#'   { "time": "2019-06", "value": 45 },
#'   { "time": "2019-07", "value": 47 }
#' ]'),jsonlite::fromJSON('[
#'   { "time": "2019-03", "count": 800, "name": "a" },
#'   { "time": "2019-04", "count": 600, "name": "a" },
#'   { "time": "2019-05", "count": 400, "name": "a" },
#'   { "time": "2019-06", "count": 380, "name": "a" },
#'   { "time": "2019-07", "count": 220, "name": "a" },
#'   { "time": "2019-03", "count": 750, "name": "b" },
#'   { "time": "2019-04", "count": 650, "name": "b" },
#'   { "time": "2019-05", "count": 450, "name": "b" },
#'   { "time": "2019-06", "count": 400, "name": "b" },
#'   { "time": "2019-07", "count": 320, "name": "b" },
#'   { "time": "2019-03", "count": 900, "name": "c" },
#'   { "time": "2019-04", "count": 600, "name": "c" },
#'   { "time": "2019-05", "count": 450, "name": "c" },
#'   { "time": "2019-06", "count": 300, "name": "c" },
#'   { "time": "2019-07", "count": 200, "name": "c" }
#' ]'))
#' g2DualAxes(df, time, value, count, type='lc', geometryOptions = list(list(geometry='column'), list(geometry='line',seriesField='name')))
#' 
#' 
#' }
#' 
#' @export
g2DualAxes <- function(data, xField, yField1, yField2, type='ll',geometryOptions=NULL,
                       cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField1 = as.character(substitute(yField1))
  yField2 = as.character(substitute(yField2))

  cfg$xField = xField
  cfg$yField = c(yField1, yField2)
  
  if (is.null(geometryOptions)) {
    if (type == 'll') {
      cfg$geometryOptions = list(list(geometry='line'), list(geometry='line'))
    } else if (type == 'cl') {
      cfg$geometryOptions = list(list(geometry='column'), list(geometry='line'))
    } else if (type == 'lc') {
      cfg$geometryOptions = list(list(geometry='line'), list(geometry='column'))  
    }  else {
      stop('param type should be one of "ll, "cl"')
    }
    # make data
    if (class(data)=='data.frame') {
      cfg$data = list(jsonlite::toJSON(subset(data, select = c(xField, yField1))),
                      jsonlite::toJSON(subset(data, select = c(xField, yField2))))
    } else{
      stop('data should be a data.frame')
    }
  } else {
    cfg$geometryOptions = geometryOptions
    # make data
    if (class(data) == 'list' && length(data)==2) {
      keep_col1 = c(xField, yField1)
      if (!is.null(geometryOptions[[1]]$seriesField)) {
        keep_col1 = append(keep_col1, geometryOptions[[1]]$seriesField)
      }
      if (!is.null(geometryOptions[[1]]$groupField)) {
        keep_col1 = append(keep_col1, geometryOptions[[1]]$groupField)
      }
      data1 = subset(data[[1]], select=keep_col1)
      
      keep_col2 = c(xField, yField2)
      if (!is.null(geometryOptions[[2]]$seriesField)) {
        keep_col2 = append(keep_col2, geometryOptions[[2]]$seriesField)
      }
      if (!is.null(geometryOptions[[2]]$groupField)) {
        keep_col2 = append(keep_col2, geometryOptions[[2]]$groupField)
      }
      data2 = subset(data[[2]], select=keep_col2)
      
      cfg$data = jsonlite::toJSON(list(data1, data2))
    } else {
      stop('data should be a lenth-two list with two data.frame')
    }
  }
  
  
  
  
  
  # pass the data and settings using 'x'
  x <- list(
    type = 'DualAxes',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



