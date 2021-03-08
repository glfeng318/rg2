#' Box chart
#' 
#' Box chart
#' 
#' @param xField,yField,groupField,outliersField column name in data for aesthetic mapping.
#' @param color color
#' @inheritParams g2
#' @family box
#' 
#' @export
g2Box <- function(data, xField,yField,groupField=NULL,outliersField=NULL,
                  color=NULL,
                  cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  outliersField = as.character(substitute(outliersField))  # NULL returns character(0)
  groupField = as.character(substitute(groupField))
  
  if (!is.null(color)) {
    cfg$color = color
  }

  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(outliersField, character(0))) {
    cfg$outliersField = as.character(outliersField)
    keep_col = append(keep_col, outliersField)
  }
  if (!identical(groupField, character(0))) {
    cfg$groupField = as.character(groupField)
    keep_col = append(keep_col, groupField)
  }
  data = subset(data, select = keep_col)
  # ungroup data
  if (any(duplicated(data[xField]))){
    q = tapply(data[[yField]], data[[xField]], stats::quantile)
    m = matrix(unlist(q), ncol=5, byrow = T)
    data = data.frame(m)
    data[xField] = names(q)
    cfg$yField = c('X1','X2','X3','X4','X5')
  }
  cfg$data = jsonlite::toJSON(data)
  if (is.null(cfg$boxStyle)) {
    cfg$boxStyle = list(stroke='#545454', fill='#1890FF',fillOpacity=0.3,lineWidth=1)
  }
  # pass the data and settings using 'x'
  x <- list(
    type = 'Box',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

