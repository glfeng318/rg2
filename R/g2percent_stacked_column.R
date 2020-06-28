#' PercentStackedColumn chart
#' 
#' PercentStackedColumn chart
#' 
#' @param xField,yField,colorField colname in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2percent_stacked_column <- function(data, xField, yField, colorField = '', cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$data       = jsonlite::toJSON(data)
  cfg$xField     = xField
  cfg$yField     = yField
  cfg$colorField = colorField
  
  # pass the data and settings using 'x'
  x <- list(
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2percent_stacked_column', x, width = width, height = height, package='rg2')
}


#' @export
g2percent_stacked_columnOutput <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2percent_stacked_column', width, height, package = 'rg2')
}

#' @export
renderG2percent_stacked_column <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2percent_stacked_columnOutput, env, quoted = TRUE, package = 'rg2')
}


