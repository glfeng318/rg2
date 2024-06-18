#' Scale
#'
#' @details
#' Additional details...
#' `[{x: {...}}, ...]`
#'
#' @md
#' @param x x
#' @param y y
#' @param z z
#' @export
scale <- function(x=NULL, y=NULL, ...) {
  structure(
    list(scale=discard_null(list_assign(list(x=x, y=y), !!!list(...)))),
    class = c('g2scale', 'g2')
  )
}
