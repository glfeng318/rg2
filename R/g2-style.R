#' Style
#'
#' Style
#'
#' @family component
#' @export
style <- function(...) {
  opt = list(...)
  structure(
    list(style = discard_null(opt)),
    class = c('g2style', 'g2')
  )
}
