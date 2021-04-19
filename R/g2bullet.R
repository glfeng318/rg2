#' Bullet chart
#' 
#' Bullet chart
#' \url{https://g2plot.antv.vision/en/docs/api/plots/bullet/}
#' 
#' @param data data should contain the following columns:
#'   * title: title character of each sample
#'   * measures: number vector, measure of one or multiple stages
#'   * target: number vector, target values
#'   * ranges: (optional) number vector, color range of the progress bar, value should be a number between 0 and 1
#' @param measureField,rangeField,targetField,xField column name in data for aesthetic mapping
#' @param layout optional 'horizontal' | 'vertical' default: 'horizontal'
#' @inheritParams g2
#' 
#' 
#' @examples
#' \dontrun{
#' 
#' # basic example for one sample
#' df = tibble(title='satisfaction', 
#'             measures=83,
#'             targets=90
#' )
#' g2Bullet(df, rangeMax=100)
#' 
#' # one sample with multiple stages(bad -> good -> excellent)
#' df = tibble(title='satisfaction', 
#'             measures=83,
#'             targets=90,
#'             ranges=list(c(0, 0.6, 0.9, 1))
#' )
#' cfg = list(
#'   rangeColors=c('#EE484C', '#F4A53C', '#84C14C')
#' )
#' g2Bullet(df, rangeMax=100, cfg=cfg)
#' 
#' # one sample with multiple targets
#' df = tibble(title='satisfaction', 
#'             measures=83, 
#'             targets=list(c(80, 90)),
#'             ranges=list(c(0, 0.6, 0.9, 1))
#' )
#' g2Bullet(df, rangeMax=100)
#' 
#' # group bullet chart
#' df = tibble(title=c('python','clojure','R', 'scala'), 
#'             measures=c(80,70,75,82),
#'             targets=c(90,90,85,85)
#' )
#' g2Bullet(df, rangeMax=100)
#' 
#' # group bullet chart with color range
#' df = tibble(title=c('python','clojure','R'), 
#'             measures=c(80,70,75),
#'             targets=c(90,90,90),
#'             ranges = rep(list(ranges = c(0,0.25,0.5,1)),3)
#' )
#' g2Bullet(df, rangeMax=100, cfg=list(rangeColors=c('#EE484C', '#F4A53C', '#84C14C')))
#' 
#' }
#' 
#' @export
g2Bullet <- function(data, measureField,rangeField,targetField,xField=NULL,
                     layout='horizontal', cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  measureField = as.character(substitute(measureField))
  rangeField = as.character(substitute(rangeField))
  targetField = as.character(substitute(targetField))
  xField = as.character(substitute(xField))
  cfg$layout = layout
  if (class(data[[measureField]]) != 'list') {
    data[[measureField]] = as.list(data[[measureField]])  
  }
  if (class(data[[rangeField]]) != 'list') {
    data[[rangeField]] = as.list(data[[rangeField]])
  }
  
  cfg$measureField = measureField
  cfg$rangeField = rangeField
  cfg$targetField = targetField
  keep_col = c(measureField, rangeField, targetField)
  if (!identical(xField, character(0))) {
    cfg$xField = as.character(xField)
    keep_col = append(keep_col, xField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  
  # default style for Bullet
  cfg$xAxis = list(line=NULL)
  cfg$yAxis = FALSE
  cfg$label = list(measure=list(position='middle',style=list(fill='#fff')))
  # pass the data and settings using 'x'
  x <- list(
    type = 'Bullet',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



