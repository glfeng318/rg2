#' GroupedColumn chart
#' 
#' GroupedColumn chart
#' 
#' @param xField,yField,colorField colname in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2grouped_column <- function(data, xField, yField, colorField = '', cfg = list(), width = NULL, height = NULL) {
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
  htmlwidgets::createWidget('g2grouped_column', x, width = width, height = height, package='rg2')
}


#' @export
g2grouped_columnOutput <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2grouped_column', width, height, package = 'rg2')
}

#' @export
renderG2grouped_column <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2grouped_columnOutput, env, quoted = TRUE, package = 'rg2')
}


