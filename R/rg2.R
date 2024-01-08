#' G2Plot configuration
#' \url{https://g2plot.antv.antgroup.com/en/api}
#'
#' @param width optional number default: 400. width of the chart.
#' @param height optional number default: 400. height of the chart.
#' @param data required. Data frame for plot.
#' @param xField the name of the data field corresponding to the graph in the x direction. you should config the `cfg` param with `xField` in `g2()` function, and `x` (short for `xField`) is param name for functions with `g2_` prefix.
#' @param yField the name of the data field corresponding to the graph in the y direction.
#' @param x short for xField
#' @param y short for yField
#' @param color,colorField the name of the data field or a string represent the color, '#ffffff', 'red'
#' @param series,seriesField grouping field
#' @param group,groupField grouping field
#' @param series,seriesField grouping field
#' @param smooth TRUE/FALSE. whether the curve is smooth.
#' @param isStack to stack charts
#' @param isGroup to group charts
#' @param isPercent to percent charts
#' @param isRange to range charts
#'
#' @examples
#'
#' cfg = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left'),
#'   theme='dark' # default / dark
#' )
#' g2(mtcars, 'scatter', cfg = cfg)
#' g2_scatter(mtcars, 'drat', 'wt', shape='circle')
#'
#'
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
#'
#' @inherit cfg
#' @family g2
#' @seealso [cfg]
#'
#' @export
#' @examples
#' cfg = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left')
#' )
#' g2(mtcars, 'scatter', cfg = cfg)
#'
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


#' g2_line
#'
#'
#' @family g2
#' @inherit cfg
#'
#' @export
#'
#' @examples
#'
#' df = jsonlite::read_json("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json",simplifyVector = T)
#' g2(df, 'line', list(
#'   xField = 'Date',
#'   yField = 'scales',
#'   xAxis = list(type = 'timeCat',
#'                tickCount = 5)
#'))
#'
g2_line <- function(data, x, y,
                    series=NULL,
                    color=NULL,
                    smooth=FALSE,
                    isStack=FALSE,
                    stepType=NULL,
                    width=NULL,
                    height=NULL) {
  cfg = list(xField=x,
             yField=y,
             seriesField=series,
             smooth=smooth,
             stepType=stepType,
             isStack=isStack,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'line', cfg)
}

#' g2_area
#'
#' @family g2
#' @inherit cfg
#'
#' @export
g2_area <- function(data, x, y,
                    series=NULL,
                    color=NULL,
                    smooth=FALSE,
                    isStack=TRUE,
                    isPercent=FALSE,
                    startOnZero=TRUE,
                    width=NULL,
                    height=NULL){
  cfg = list(xField=x,
             yField=y,
             seriesField=series,
             smooth=smooth,
             isStack=isStack,
             isPercent=isPercent,
             startOnZero=startOnZero,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'area', cfg)
}
#' g2_column
#'
#' @family g2
#' @inherit cfg
#'
#' @export
g2_column <- function(data, x, y,
                      series=NULL,
                      group=NULL,
                      color=NULL,
                      isGroup=NULL,
                      isStack=NULL,
                      isRange=NULL,
                      isPercent=NULL,
                      width=NULL,
                      height=NULL){
  cfg = list(xField=x,
             yField=y,
             seriesField=series,
             groupField=group,
             isGroup=isGroup,
             isStack=isStack,
             isPercent=isPercent,
             isRange=isRange,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'column', cfg)
}
#' g2_bar
#'
#' @family g2
#' @inherit cfg
#'
#' @export
g2_bar <- function(data, x, y,
                   series=NULL,
                   group=NULL,
                   color=NULL,
                   isGroup=NULL,
                   isStack=NULL,
                   isRange=NULL,
                   isPercent=NULL,
                   width=NULL,
                   height=NULL){
  cfg = list(xField=x,
             yField=y,
             seriesField=series,
             groupField=group,
             isGroup=isGroup,
             isStack=isStack,
             isPercent=isPercent,
             isRange=isRange,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'bar', cfg)
}
#' g2_pie
#'
#' @param angle angleField
#' @param color colorField
#' @param radius The radius of the pie chart, the origin is the center of the canvas. The configuration range is (0,1), where 1 represents a pie chart that fills the drawing area.
#' @param innerRadius The inner radius of the pie chart, starting at the center of the canvas. Configure the range (0,1)
#' @param startAngle Configure the starting angle of the coordinate system. try `pi`.
#' @param endAngle Configure the end angle of the coordinate system.
#'
#' @family g2
#' @inherit cfg
#'
#' @export
g2_pie <- function(data,angle,color,
                   radius=NULL,
                   innerRadius=NULL,
                   startAngle=NULL,
                   endAngle=NULL){
  cfg = list(angleField=angle,
             colorField=color,
             radius=radius,
             innerRadius=innerRadius,
             startAngle=startAngle,
             endAngle=endAngle,
             width=width,
             height=height)
  g2(data, 'pie', cfg)
}
#' g2_gauge
#'
#' @return gauge
#' @export
g2_gauge <- function(data,percent,
                     radius=NULL,
                     innerRadius=NULL,
                     startAngle=NULL,
                     endAngle=NULL){
  cfg = list(percent=percent,
             radius=radius,
             innerRadius=innerRadius,
             startAngle=startAngle,
             endAngle=endAngle,
             width=width,
             height=height)
  g2(data, 'gauge', cfg)}
#' g2_scatter
#'
#' @export
g2_scatter <- function(){'scatter'}

#' g2_dual_axes
#'
#' @return dual-axes
#' @export
g2_dual_axes <- function(){'dual-axes'}
#' g2_liquid
#'
#' @return liquid
#' @export
g2_liquid <- function(){'liquid'}
#' g2_radar
#'
#' @return radar
#' @export
g2_radar <- function(){'radar'}
#' g2_word_cloud
#'
#' @return word-cloud
#' @export
g2_word_cloud <- function(){'word-cloud'}
#' g2_funnel
#'
#' @return funnel
#' @export
g2_funnel <- function(){'funnel'}
#' g2_bullet
#'
#' @return bullet
#' @export
g2_bullet <- function(){'bullet'}
#' g2_histogram
#'
#' @return histogram
#' @export
g2_histogram <- function(){'histogram'}
#' g2_venn
#'
#' @return venn
#' @export
g2_venn <- function(){'venn'}
#' g2_rose
#'
#' @return rose
#' @export
g2_rose <- function(){'rose'}
#' g2_tiny_line
#'
#' @return tiny-line
#' @export
g2_tiny_line <- function(){'tiny-line'}
#' g2_tiny_area
#'
#' @return tiny-area
#' @export
g2_tiny_area <- function(){'tiny-area'}
#' g2_tiny_column
#'
#' @return tiny-column
#' @export
g2_tiny_column <- function(){'tiny-column'}
#' g2_sunburst
#'
#' @return sunburst
#' @export
g2_sunburst <- function(){'sunburst'}
#' g2_stock
#'
#' @return stock
#' @export
g2_stock <- function(){'stock'}
#' g2_ring_progress
#'
#' @return ring-progress
#' @export
g2_ring_progress <- function(){'ring-progress'}
#' g2_progress
#'
#' @return progress
#' @export
g2_progress <- function(){'progress'}
#' g2_box
#'
#' @return box
#' @export
g2_box <- function(){'box'}
#' g2_heatmap
#'
#' @return heatmap
#' @export
g2_heatmap <- function(){'heatmap'}
#' g2_waterfall
#'
#' @return waterfall
#' @export
g2_waterfall <- function(){'waterfall'}
#' g2_radial_bar
#'
#' @return radial-bar
#' @export
g2_radial_bar <- function(){'radial_bar'}
#' g2_bidirectional_bar
#'
#' @return bidirectional-bar
#' @export
g2_bidirectional_bar <- function(){'bidirectional-bar'}
#' g2_sankey
#'
#' @return sankey
#' @export
g2_sankey <- function(){'sankey'}
#' g2_chord
#'
#' @return chord
#' @export
g2_chord <- function(){'chord'}
#' g2_treemap
#'
#' @return treemap
#' @export
g2_treemap <- function(){'treemap'}
#' g2_violin
#'
#' @return voilin
#' @export
g2_violin <- function(){'violin'}
#' g2_circle_packing
#'
#' @return circle-packing
#' @export
g2_circle_packing <- function(){'circle-packing'}
#' g2_mix
#'
#' @return mix
#' @export
g2_mix <- function(){'mix'}
#' g2_facet
#'
#' @return facet
#' @export
g2_facet <- function(){'facet'}


