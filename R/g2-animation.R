#' Animate
#'
#' Animate in G2 is an important part of visualization
#' and can improve the expressiveness of visualization.
#'
#' Animate can be declared at the level of mark.
#'
#' @details
#' Mark specifies animation properties through mark.animate,
#' there are three parts of animation that can be specified:
#' - enter- New graphics
#' - update- Updated graphics
#' - exit- deleted graphics
#' Each part of the animation has the following properties:
#' - type
#' - duration
#' - delay
#' - easing
#'
#' animate types:
#' - fadeIn
#' - fadeOut
#' - growInX
#' - growInY
#' - morphing
#' - pathIn
#' - scaleInX
#' - scaleInY
#' - scaleOutX
#' - scaleOutY
#' - waveIn
#' - zoomIn
#' - zoomOut
#' @md
#'
#' @family animation
#' @param enter list(type=NULL,duration=NULL,delay=NULL,easing=NULL)
#' @param update list(type=NULL,duration=NULL,delay=NULL,easing=NULL)
#' @param exit list(type=NULL,duration=NULL,delay=NULL,easing=NULL)
#' @export
animate <- function(enter=NULL, update=NULL, exit=NULL) {
  opt = list(
    enter = enter,
    update = update,
    exit = exit
  )
  structure(
    compact(opt),
    class = c('g2animate', 'g2')
  )
}
