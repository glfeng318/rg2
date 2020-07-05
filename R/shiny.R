#' Wrapper functions for using rg2 in shiny
#'
#' Use \code{g2Output()} to create a UI element, and \code{renderG2()}
#' to render the map widget.
#' @inheritParams htmlwidgets::shinyWidgetOutput
#' @param width,height the width and height of the chart
#' @export
g2Output <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2', width, height, package = 'rg2')
}

#' use expr description from htmlwidgets to avoid bad inherit params code
#' @param expr An expression that generates g2 widget
#' @inheritParams htmlwidgets::shinyRenderWidget
#' @export
renderG2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2Output, env, quoted = TRUE, package = 'rg2')
}


