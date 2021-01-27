#' Liquid chart
#' 
#' Liquid chart
#' 
#' @param percent percent value 
#' @param radius radius [0, 1]
#' @param color The color of liquid chart
#' @param outline default `list(border=2, distance=0)`
#' @param wave default `list(count=3, length=192)`
#' @inheritParams g2
#' 
#' @export
g2Liquid <- function(percent, radius=0.9, color = NULL, 
                     outline=list(border=2, distance=0), wave=list(count=3, length=192),
                     cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$percent = percent
  cfg$outline = outline
  cfg$outline = outline
  if (!is.null(color)) {
    cfg$color = color
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'Liquid',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



