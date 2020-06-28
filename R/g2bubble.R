#' Bubble chart
#' 
#' Bubble chart
#' 
#' @param xField,yField,colorField,sizeField colname in data for aesthetic mapping
#' @inheritParams g2
#' @family NULL
#' 
#' @export
g2bubble <- function(data, xField, yField, colorField, sizeField, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$data       = jsonlite::toJSON(data)
  cfg$xField     = xField
  cfg$yField     = yField
  cfg$colorField = colorField
  cfg$sizeField  = sizeField
  
  # pass the data and settings using 'x'
  x <- list(
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2bubble', x, width = width, height = height, package='rg2')
}


#' @export
g2bubbleOutput <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2bubble', width, height, package = 'rg2')
}

#' @export
renderG2bubble <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2bubbleOutput, env, quoted = TRUE, package = 'rg2')
}


