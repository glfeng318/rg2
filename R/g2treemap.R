#' Treemap chart
#' 
#' Treemap chart
#' 
#' @param maxLevel Default to 2
#' @inheritParams g2
#' @family 
#' 
#' @export
g2Treemap <- function(data, maxLevel = 2, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  # sort N-1 colmuns by level
  data_sort = subset(data, select=names(sort(apply(data, 2, function(x) length(unique(x))))))
  data_json = list(name='root', value=sum(data_sort[, ncol(data_sort)]), children=df2treemap_json(data_sort))
  
  if (dim(data_sort)[2] == 2){
    cfg$colorField = 'name'
  } else {
    cfg$colorField = 'color'
  }
  cfg$data = jsonlite::toJSON(data_json, auto_unbox = TRUE)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Treemap',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



