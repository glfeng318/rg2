#' Funnel chart
#' 
#' Funnel chart
#' 
#' @param xField,yField column name in data for aesthetic mapping
#' @param dynamicHeight `TRUE` for mapping xField to width/angle of funnel with a fixed height, 
#'   `FALSE` for mapping xField to height of funnel with a fixed angle.
#' @param transpose `TRUE` for horizontal funnel, and `FALSE` for vertical funnel
#' @param compareField Required by compare funnel. specified values will overwrite the dynamicHeight to `FALSE`.
#'   you can configure the compare text style in `cfg` parameter with `compareText=list(...)`
#' 
#' @section percentage configuration:
#' In the funnel chart, the conversion rate display consists of three parts: 
#' \enumerate{
#'   \item fixed line
#'   \item fixed text
#'   \item numeric text
#' }
#'  
#'  The style and content can be configured by `line`, `text` and `value` respectively.
#'  
#'  See example for a full configuration of percentage.
#'
#' @examples 
#'  \dontrun{
#'  
#'  cfg = list(
#'    percentage = list(
#'      visible = TRUE,
#'      offsetX = 40,
#'      offsetY = 40,
#'      spacing = 4,
#'      line = list(
#'        visible = TRUE,
#'        style = list()  # lineStyle
#'      ),
#'      text = list(
#'        visible = TRUE,
#'        content = 'conversion rate'
#'        style = list()  # textStyle
#'      ),
#'      value = list(
#'        visible = TRUE,
#'        style = list()  # textStyle
#'      )
#'    )
#'  )
#'  
#'  }
#' 
#' 
#' @inheritParams g2
#' 
#' @export
g2Funnel <- function(data, xField, yField, compareField = NULL,
                     dynamicHeight = FALSE, transpose = FALSE,
                     cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  compareField = as.character(substitute(compareField))
  
  # param?
  cfg$percentage = list(text=list(content='conversion rate'))
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(compareField, character(0))) {
    cfg$compareField = as.character(compareField)
    keep_col = append(keep_col, compareField)
  }
  
  cfg$dynamicHeight = dynamicHeight
  cfg$transpose = transpose
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
  # pass the data and settings using 'x'
  x <- list(
    type = 'Funnel',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}



