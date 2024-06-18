#' Label
#'
#' label is just added to the first mark
#' you should pass `labels` param to g2_ family functions if you need to define label for every mark
#' https://g2.antv.antgroup.com/en/spec/label/overview
#'
#' @param ... label options
#'
#' @export
label <- function(...) {
  opt = list(
    compact(list(...))
  )
  structure(opt,class = c('g2label','g2'))
}
