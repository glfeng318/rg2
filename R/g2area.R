#' Area chart
#' 
#' Area chart
#' 
#' @param xField,yField,seriesField colname in data for aesthetic mapping
#' @inheritParams g2
#' @family area
#' 
#' @export
g2area <- function(data, xField, yField, seriesField = '', cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$data        = jsonlite::toJSON(data)
  cfg$xField      = xField
  cfg$yField      = yField
  cfg$seriesField = seriesField
  
  # pass the data and settings using 'x'
  x <- list(
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2area', x, width = width, height = height, package='rg2')
}


#' @export
g2areaOutput <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2area', width, height, package = 'rg2')
}

#' @export
renderG2area <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2areaOutput, env, quoted = TRUE, package = 'rg2')
}


