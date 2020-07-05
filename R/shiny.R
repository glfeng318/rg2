#' @export
g2Output <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2', width, height, package = 'rg2')
}

#' @export
renderG2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2Output, env, quoted = TRUE, package = 'rg2')
}


