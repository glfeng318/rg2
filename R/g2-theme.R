#' Theme
#'
#'
#' @param type light / dark / academy / classic / classicDark
#' @param ... theme options
#'
#' @export
g2_theme <- function(type, ...) {
  opt = list(
    compact(list(...))
  )
  structure(opt,class = c('g2theme','g2'))
}
