#' WordCloud chart
#' 
#' WordCloud chart
#' 
#' @param wordField,weightField,colorField column name in data for aesthetic mapping
#' @param random number range (0, 1]
#' @param spiral optional 'archimedean' | 'rectangular' default: 'archimedean'
#' @param imageMask The mask image, black-white pixel image will be better, can be specified with a `url` or `base64`.
#' @param color Configure the color. If there is no colorField configured, 
#'   set one single color. Otherwise you can set a series of colors, or you can use callback function.
#'   Default: The color board of the theme.
#' @inheritParams g2
#' 
#' @export
g2WordCloud <- function(data, wordField,weightField,colorField=NULL,
                        random=NULL, spiral='archimedean', imageMask=NULL, color=NULL,
                        cfg = list(), width = NULL, height = NULL) {
  # field name of data mapping
  wordField = as.character(substitute(wordField))
  weightField = as.character(substitute(weightField))
  colorField = as.character(substitute(colorField))
  # prep cfg
  cfg$spiral = spiral
  if (!is.null(random)) {
    cfg$random = random
  }
  if (!is.null(imageMask)) {
    cfg$imageMask = imageMask
  }
  if (!is.null(color)) {
    cfg$color = color
  }
  
  cfg$wordField = wordField
  cfg$weightField = weightField
  keep_col = c(wordField, weightField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'WordCloud',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



