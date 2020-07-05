#' Bullet chart
#' 
#' Bullet chart
#' 
#' @param data data should contain the following columns:
#'   * title: title character of each sample
#'   * measures: number vector, measure of one or multiple stages
#'   * targets: number vector, target values
#'   * ranges: (optional) number vector, color range of the progress bar, value should be a number between 0 and 1
#' @param rangeMax the max value of color range of the progress bar
#' @param measureSize the height of progress bar, default to 20
#' @inheritParams g2
#' @family 
#' 
#' @examples
#' \dontrun{
#' # basic example for one sample
#' df = tibble(title='satisfaction', 
#'             measures=list(measures=83),
#'             targets=list(targets=90)
#'      )
#' g2Bullet(df, rangeMax=100)
#' 
#' # one sample with multiple stages(bad -> good -> excellent)
#' df = tibble(title='satisfaction', 
#'             measures=list(measures=83),
#'             targets=list(targets=90),
#'             ranges=list(ranges=c(0, 0.6, 0.9, 1))
#'      )
#' cfg = list(
#'   rangeColors=c('#EE484C', '#F4A53C', '#84C14C')
#' )
#' g2Bullet(df, rangeMax=100, cfg=cfg)
#' 
#' # one sample with multiple targets
#' df = tibble(title='satisfaction', 
#'             measures=list(measures=83), 
#'             targets=list(targets=c(80, 90)),
#'             ranges=list(ranges=c(0, 0.6, 0.9, 1))
#' )
#' g2Bullet(df, rangeMax=100)
#' 
#' # group bullet chart
#' df = tibble(title=c('python','clojure','R', 'scala'), 
#'             measures=c(80,70,75,85),
#'             targets=c(90,90,90,90)
#' ) %>% mutate_at(all_of(c('measures','targets')), as.list)
#' g2Bullet(df, rangeMax=100)
#' 
#' # group bullet chart with color range
#' df = tibble(title=c('python','clojure','R'), 
#'             measures=c(80,70,75),
#'             targets=c(90,90,90),
#'             ranges = rep(list(ranges = c(0,0.25,0.5,1)),3)
#' ) %>% mutate_at(all_of(c('measures','targets','ranges')), as.list)
#' g2Bullet(df, rangeMax=100, cfg=list(rangeColors=c('#EE484C', '#F4A53C', '#84C14C')))
#' 
#' }
#' 
#' @export
g2Bullet <- function(data, rangeMax, measureSize=20, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$rangeMax = rangeMax
  cfg$measureSize = measureSize
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Bullet',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



