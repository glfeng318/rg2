#' base class for G2 chart
#'
#' @param data a data object.Currently supported object is data.frame, 
#'    data should only contains the necessary data for chart (reduce json/data transmission)
#' @param cfg configuration of G2Plot. See \url{https://g2plot.antv.vision/en/docs/api/plot-api} for more details. 
#' @param width width of the chart
#' @param height height of the chart
#' @name g2
NULL

#' Base configuration
#' \url{https://g2plot.antv.vision/en/docs/api/plots/bar}
#' 
#' @section Plot Container:
#' \itemize{
#'    \item width
#'    \item height
#'    \item autoFit
#'    \item padding
#'    \item appendPadding
#'    \item renderer
#'    \item pixelRatio
#'    \item limitInPlot
#' }
#' 
#' - width
#' optional number default: 400
#' Set the width of the chart.
#' 
#' - height
#' optional number default: 400
#' Set the height of the chart.
#' 
#' - autoFit
#' optional boolean default: true
#' Whether the chart automatically adjusts to fit the container. If it is set to true, width and height configuration would fail.
#' 
#' - padding
#' optional number[] | number | 'auto'
#' Set padding value of the canvas. You can also use auto.
#' 
#' - appendPadding
#' optional number[] | number
#' Extra appendPadding value.
#' 
#' - renderer
#' optional string default: canvas
#' Set the render way to canvas or svg.
#' 
#' - pixelRatio
#' optional number default: window.devicePixelRatio
#' Set the pixel ratio of the chart.
#' 
#' - limitInPlot
#' optional boolean
#' Whether clip the Geometry beyond the coordinate system.
#' 
#' @section Components: 
#' \url{https://g2plot.antv.vision/en/docs/api/components/axis}
#' 
#' 
#' @section Graphic Style:
#' \url{https://g2plot.antv.vision/en/docs/api/graphic-style}
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
