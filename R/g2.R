#' base class for G2 chart
#'
#' @param data a data object.Currently supported object is data.frame, 
#'    data should only contains the necessary data for chart (reduce json/data transmission)
#' @param cfg configuration of G2Plot. See \url{https://antv-g2plot.gitee.io/zh/examples/general/axis} and \url{https://antv-g2plot.gitee.io/zh/docs/manual/graphic-style} for more details. 
#' @param width the width of the chart
#' @param height the width of the chart
#' @name g2
NULL

#' base configuration class
#' 
#' @section width and height:
#' Both width and height are default to 400
#' 
#' @section forceFit:
#' if `TRUE`, the default, width and height in cfg will be ignored
#' 
#' @section pixelRatio: 
#' default to 2
#' 
#' @section renderer:
#' One of the following:
#' \itemize{
#'    \item "canvas"
#'    \item "svg"
#' }
#' 
#' @section theme:
#' chart theme. One of the following:
#' \itemize{
#'   \item "default" (the default)
#'   \item "dark"
#' }
#' 
#' @section title and description:
#' Both title and description in cfg should be list.
#' 
#' @examples
#' \dontrun{
#' # Default cfg for title and description
#' cfg = list(
#'   title = list(visible = FALSE,
#'                alignTo = 'left',
#'                text    = '',
#'                style   = list(fontSize=18, fill='black')
#'   ),
#'   description = lsit(visible = FALSE,
#'                      alignTo = 'left',
#'                      text    = '',
#'                      style   = list(fontSize=12, fill='grey')
#'   )
#' )
#' g2bar(df, 'x', 'y', cfg=cfg)
#' 
#' 
#' }
#' @name cfg
NULL
