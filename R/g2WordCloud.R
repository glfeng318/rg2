#' WordCloud chart
#' 
#' WordCloud chart
#' 
#' @param maskImage The mask image, black-white pixel image will be better, can be specified with a `url` or `base64`.
#' @param shape One of the following: 
#'   * circle
#'   * square
#'   * cardioid
#'   * diamond
#'   * triangle
#'   * triangle-forward
#'   * triangle-backward
#'   * triangle-up
#'   * triangle-down
#'   * pentagon
#'   * star
#' @param backgroundColor background color
#' @param shuffle shuffle the data, default to `TRUE`
#' @inheritParams g2
#' @family 
#' 
#' @export
g2WordCloud <- function(data, maskImage = NULL, shape = 'circle', 
                        backgroundColor = '#ffffff', shuffle = TRUE,
                        cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  if (!is.null(maskImage)) {
    cfg$maskImage = maskImage
  }
  cfg$shape = shape
  cfg$backgroundColor = backgroundColor
  cfg$shuffle = shuffle
  cfg$wordStyle = list() # required wordStyle
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'WordCloud',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



