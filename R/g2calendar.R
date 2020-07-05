#' Calendar chart
#' 
#' Calendar chart
#' 
#' @param dateField,valueField column name in data for aesthetic mapping
#' @param dateRange the date range of chart, a vector like \code{c('2020-01-01','2020-06-30')} 
#' @param colors valueField color mapping, color string or vector like \code{'#BAE7FF-#1890FF-#0050B3'} or \code{c('#BAE7FF', '#1890FF', '#0050B3')}
#' @param months months name, default to c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
#' @param weeks weeks name, default to c('Sun', 'Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat'), week start on sunday 
#' @inheritParams g2
#' @family 
#' 
#' @examples 
#' \dontrun{
#' 
#' df = jsonlite::read_json('https://antv-g2plot.gitee.io/zh/examples//data/contributions.json',TRUE)
#' g2Calendar(df,date,commits,c('2017-05-01','2017-10-31'),color='#BAE7FF-#1890FF-#0050B3')
#' 
#' }
#' @export
g2Calendar <- function(data, dateField, valueField, dateRange, colors = NULL,
                       months = c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'), 
                       weeks = c('Sun', 'Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat'), 
                       cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  dateField = as.character(substitute(dateField))
  valueField = as.character(substitute(valueField))

  cfg$dateField = dateField
  cfg$valueField = valueField
  cfg$dateRange = dateRange
  if (!is.null(colors)){
    cfg$colors = colors
  }
  cfg$label = list(visible=TRUE)
  keep_col = c(dateField, valueField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Calendar',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



