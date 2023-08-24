#' base class for G2 chart
#'
#' @param data a data object.Currently supported object is data.frame, 
#'    data should only contains the necessary data for chart (reduce json/data size)
#' @param cfg configuration of G2Plot. See \url{https://g2plot.antv.antgroup.com/en/api} for more details. 
#' @param width width of the chart
#' @param height height of the chart
#' @name g2
NULL

#' G2Plot configuration
#' \url{https://g2plot.antv.antgroup.com/en/api}
#' 
#' @examples
#' \dontrun{
#' cfg = list(
#'   legend = list(position = 'top-left')
#' )
#' g2bar(df, x, y, cfg = cfg)
#' 
#' }
#' @name cfg
NULL
