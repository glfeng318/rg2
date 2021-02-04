#' Sankey chart
#' 
#' Sankey chart
#' 
#' @param sourceField,targetField,weightField column name in data for aesthetic mapping.
#' @param nodeWidthRatio Sankey diagram node width configuration, 0 ~ 1, refer to the width of the canvas, the default is' 0.008 '.
#' @param nodeWidthPadding The vertical spacing between nodes in Sankey diagram, 0 ~ 1, referring to the height of the canvas, default is' 0.01 '.
#' @param nodeAlign The sankey diagram node layout direction, the default is the justify, can choose the 'left' | 'right' | 'center' | 'the justify' four ways.
#' @param color color
#' @inheritParams g2
#' @family g2
#' 
#' @export
g2Sankey <- function(data, sourceField, targetField,weightField,
                     nodeWidthRatio=0.0008, nodeWidthPadding=0.001,nodeAlign='the justify',color=NULL,
                     cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  sourceField = as.character(substitute(sourceField))
  targetField = as.character(substitute(targetField))
  weightField = as.character(substitute(weightField))
  
  if (!is.null(color)) {
    cfg$color = color
  }
  cfg$nodeWidthRatio=nodeWidthRatio
  cfg$nodeWidthPadding=nodeWidthPadding
  cfg$nodeAlign=nodeAlign
  
  cfg$sourceField = sourceField
  cfg$targetField = targetField
  cfg$weightField = weightField
  keep_col = c(sourceField, targetField, weightField)
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Sankey',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

