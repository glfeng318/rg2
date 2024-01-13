#' g2_opt
#'
#' @param opt G2Plot options
#' @param ...  more options
#'
#' @export
#'
#' @examples
#' g2_opt(list(), legend=FALSE)
#' g2_opt(list(), legend=FALSE, label=FALSE)
#'
#' g2_opt(
#'   list(),
#'   color='rgb(252, 253, 191)-rgb(231, 82, 99)-rgb(183, 55, 121)',
#'   pointStyle=list(
#'     stroke='rgb(183, 55, 121)',
#'     lineWidth= 0.5
#'   )
#' )
#'
g2_opt <- function(opt, ...) {
  c(opt, list(...))
}

#' g2_opt_from_json
#'
#' @param json a json string of G2Plot options
#'
#' @return a list of options for G2Plot
#' @export
#'
#' @examples
#' opt = opt_from_json('{"xField":"displ", "yField":"hwy", "colorField":"class", "shape":"circle"}')
g2_opt_from_json <- function(json) {
  jsonlite::fromJSON(json)
}
