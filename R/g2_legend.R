#' g2_legend
#'
#' @param opt G2Plot options
#' @param legend FALSE to close legend, or LegendCfg
#'
#' @return opt
#' @export
#'
#' @examples
#' opt = list(percent=0.75)
#' g2_legend(opt, FALSE)
g2_legend <- function(opt, legend) {
  opt$legend = legend
  opt
}
