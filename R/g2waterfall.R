#' Waterfall chart
#' 
#' Waterfall chart
#' 
#' @param xField,yField column name in data for aesthetic mapping
#' @param labelMode Label data mode, optional values: 'absolute' (absolute value of data), 'difference' (relative difference of data).
#' @param total Whether to display totals (automatic statistics, add a column with totals).
#' @param leaderLine Whether to show leader line.
#' @param columnWidthRatio Width ratio of histogram [0-1].
#' @param risingFill,fallingFill Rising/Drop color configuration.
#' @param color color can be a character, list or javascript function:
#'   * '#60d7a7'
#'   * list(rising='#60d7a7', falling='#dedede', total='#fedca9')
#' @inheritParams g2
#' 
#' @export
g2Waterfall <- function(data, xField, yField,
                        labelMode='difference',total=NULL,leaderLine=NULL,columnWidthRatio=NULL,
                        risingFill='#f4664a',fallingFill='#30bf78',color = NULL,
                        cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))

  cfg$labelMode = labelMode
  cfg$risingFill = risingFill
  cfg$fallingFill = fallingFill
  if (!is.null(total)){
    cfg$total = total
  }
  if (!is.null(leaderLine)){
    cfg$leaderLine = leaderLine
  }
  if (!is.null(columnWidthRatio)){
    cfg$columnWidthRatio = columnWidthRatio
  }
  if (!is.null(color)){
    cfg$color = color
  }
  cfg$xField = xField
  cfg$yField = yField
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Waterfall',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



