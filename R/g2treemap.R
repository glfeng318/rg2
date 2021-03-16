#' Treemap chart
#' 
#' Treemap chart
#' 
#' @param colorField column name in data for aesthetic mapping.
#' @param color color
#' @inheritParams g2
#' 
#' @export
g2Treemap <- function(data, colorField=NULL,
                      color = NULL, 
                      cfg = list(), width = NULL, height = NULL) {
  if (!'name' %in% colnames(data) || !'value' %in% colnames(data)) {
    stop("data should at least have [`name`, `value`] columns")
  }
  # prep cfg
  colorField = as.character(substitute(colorField))

  if (!is.null(color)) {
    cfg$color = color
  }

  data = list(name='root', children=data)
  
  if (!identical(colorField, character(0))) {
    cfg$colorField = colorField
  } else {
    cfg$colorField='name'
  }
  if (TRUE) {
    cfg$interactions = list(list(type='treemap-drill-down'))
  }
  
  cfg$data = jsonlite::toJSON(data, auto_unbox = TRUE)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Treemap',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



