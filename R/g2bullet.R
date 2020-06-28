#' Bullet chart
#' 
#' Bullet chart
#' 
#' The data in bullet chart MUST contains the following columns:
#' title, string, title of each sample 
#' measures, number[], the measure of one or multiple stages
#' targets, number[], the target value
#' ranges, number[], its item should be in [0, 1]
#' 
#' @example 
#' \dotrun{
#' df = tibble(title = c('A','B','C','D'),
#'             measures = c(83,13,45,83),
#'             targets = c(90,90,90,90),
#'             ranges = rep(list(ranges = c(0,0.25,0.5,0.75,1)),4)
#' ) %>% mutate_at(all_of(c('measures','targets','ranges')), as.list)
#' g2bullet(df, 
#'          rangeMax = 100,
#'          cfg=list(title=list(visible=TRUE,text='Bullet chart'),
#'                   rangeColors=c('#F8DA41','#F3C173','#EE8C51','#E0605A'))
#' )
#' 
#' }
#' 
#' 
#' 
#' 
#' @param rangeMax The max value of color range in progress bar
#' @param measureSize The height of progress bar, default to 20
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2bullet <- function(data, rangeMax, measureSize=20, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  data = data %>% mutate_at(all_of(c('measures','targets','ranges')), as.list)
  cfg$data        = jsonlite::toJSON(data)
  cfg$rangeMax    = rangeMax
  cfg$measureSize = measureSize

  # pass the data and settings using 'x'
  x <- list(
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2bullet', x, width = width, height = height, package='rg2')
}


#' @export
g2bulletOutput <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2bullet', width, height, package = 'rg2')
}

#' @export
renderG2bullet <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2bulletOutput, env, quoted = TRUE, package = 'rg2')
}


