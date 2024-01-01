#' G2Plot configuration
#' \url{https://g2plot.antv.antgroup.com/en/api}
#'
#' @examples
#' \dontrun{
#' cfg = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left')
#' )
#' # theme: default / dark
#' cfg = list(
#'   theme='dark'
#' )
#' g2(mtcars, 'scatter', cfg = cfg)
#'
#' }
#' @name cfg
NULL

#' g2 plot
#'
#' all g2 plots can be confined in cfg param
#'
#' @param data a data object.Currently supported object is data.frame,
#'    data should only contains the necessary data for chart (reduce json/data size)
#' @param chart the chart type of G2Plot ('line','area','column','bar','pie','scatter','gauge','dual-axes','liquid','radar','word-cloud','funnel','bullet','histogram','venn','rose','tiny-line','tiny-area','tiny-column','sunburst','stock','ring-progress','progress','box','heatmap','waterfall','radial-bar','bidirectional-bar','sankey','chord','treemap','violin','circle-packing','mix','facet')
#' @param cfg configuration of G2Plot. See \url{https://g2plot.antv.antgroup.com/en/api} for more details.
#' @param width width of the chart
#' @param height height of the chart
#'
#' @export
#' @examples
#' \dontrun{
#' cfg = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left')
#' )
#' g2(mtcars, 'scatter', cfg = cfg)
#'
#' }
#'
g2 <- function(data, chart, cfg = list(), width = NULL, height = NULL) {
  chart_type_list = c('line',
                      'area',
                      'column',
                      'bar',
                      'pie',
                      'scatter',
                      'gauge',
                      'dual-axes',
                      'liquid',
                      'radar',
                      'word-cloud',
                      'funnel',
                      'bullet',
                      'histogram',
                      'venn',
                      'rose',
                      'tiny-line',
                      'tiny-area',
                      'tiny-column',
                      'sunburst',
                      'stock',
                      'ring-progress',
                      'progress',
                      'box',
                      'heatmap',
                      'waterfall',
                      'radial-bar',
                      'bidirectional-bar',
                      'sankey',
                      'chord',
                      'treemap',
                      'violin',
                      'circle-packing',
                      'mix',
                      'facet')
  if (! chart %in% chart_type_list) {
    stop("param chart should be one of ", paste(chart_type_list,collapse = ","))
  }
  cfg$data = jsonlite::toJSON(data)
  x <- list(
    chart = chart,
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}
