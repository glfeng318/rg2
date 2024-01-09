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
#' df = jsonlite::read_json("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json",simplifyVector = TRUE)
#' g2_line(df, 'Date','scales')
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
#' @examples
#' df = jsonlite::read_json("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json",simplifyVector = TRUE)
#' g2_area(df, 'Date','scales')
#'
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
#' @examples
#' df = jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/8elHX%26irfq/stack-column-data.json',simplifyVector = TRUE)
#' g2_column(df,'year','value','type',isStack=TRUE)
#'
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
#' @examples
#' df = jsonlite::fromJSON('
#' [{ "year": "1951", "value": 38 },
#'   { "year": "1952", "value": 52 },
#'   { "year": "1956", "value": 61 },
#'   { "year": "1957", "value": 145 },
#'   { "year": "1958", "value": 48 }]')
#' g2_bar(df, 'value', 'year')
#'
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
#' @examples
#' df = data.frame(
#'   cate = c('a','b','c','d','e'),
#'   value = c(1,2,3,5,8)
#' )
#' g2_pie(df, angle='value',color='cate', radius=.8, innerRadius=.4)
#'
g2_pie <- function(data,angle,color,
                   radius=NULL,
                   innerRadius=NULL,
                   startAngle=-pi/2,
                   endAngle=pi*1.5,
                   width=NULL,
                   height=NULL){
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

#' g2_scatter
#'
#' @family g2
#' @inherit cfg
#'
#' @export
#' @examples
#' g2_scatter(cars, 'speed', 'dist')
#' g2_scatter(iris, 'Sepal.Length', 'Sepal.Width',color='Species')
#'
g2_scatter <- function(data, x, y,
                       size=NULL,
                       shape=NULL,
                       color=NULL,
                       width=NULL,
                       height=NULL){
  cfg = list(xField=x,
             yField=y,
             sizeField=size,
             shapeField=shape,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'scatter', cfg)}

#' g2_dual_axes
#'
#'
#' @param y should be: c('filed_name1','field_name_2')
#' @param geometry should be: ll(line-line), cl(column-line), lc(column-line). use `g2()` for  complex configurations
#'
#' @export
#' @examples
#' data = data.frame(
#'  time = c('2023-01','2023-02','2023-03','2023-04','2023-05'),
#'  value=c(350,900,300,450,470),
#'  count=c(800,600,400,380,200)
#' )
#' g2_dual_axes(data, x='time', y=c('value','count'), geometry='ll')
#'
g2_dual_axes <- function(data, x, y, geometry){
  cfg = list(xField=x,yField=y)
  if (geometry == 'll') {
    cfg$geometryOptions = list(list(geometry='line'), list(geometry='line'))
  } else if (geometry == 'cl') {
    cfg$geometryOptions = list(list(geometry='column'), list(geometry='line'))
  } else if (geometry == 'lc') {
    cfg$geometryOptions = list(list(geometry='line'), list(geometry='column'))
  }  else {
    stop('param geometry should be one of "ll, "cl", "lc"')
  }
  g2(list(data, data), 'dual-axes', cfg)
}
#' g2_gauge
#'
#' @param percent Indicator ratio data [0-1]
#' @param radius 0.95
#' @param innerRadius 0.9
#' @param startAngle (-7 / 6) * pi
#' @param endAngle (1 / 6) * pi
#' @param range.ticks number vector
#' @param range.color The color swatches of auxiliary arcs are selected in accordance with the color swatches; When ticks are set, color cannot be used as a callback
#' @param range.width width of gauge range. Default using 'radius', 'innerRadius' to calculate the width of range.
#'
#' @export
#' @examples
#' g2_gauge(0.618)
#'
g2_gauge <- function(percent,
                     radius=0.95,
                     innerRadius=0.9,
                     startAngle=(-7 / 6) * pi,
                     endAngle=(1 / 6) * pi,
                     range.ticks=NULL,
                     range.color=NULL,
                     range.width=NULL
                     ){
  cfg = list(percent=percent,
             radius=radius,
             innerRadius=innerRadius,
             startAngle=startAngle,
             endAngle=endAngle,
             range=list(ticks=range.ticks,
                        color=range.color,
                        width=range.width))
  g2(NULL, 'gauge', cfg=cfg)
}
#' g2_liquid
#'
#' @param percent Ratio data [0-1]
#' @param radius Radius of outer ring [0-1]
#' @param shape circle | diamond | triangle | pin | rect
#' @param wave list(count=3, length=192), length in px
#' @param color color name or hex color code
#'
#' @export
#' @examples
#' g2_liquid(0.618)
#'
g2_liquid <- function(percent,
                      radius=0.9,
                      shape='circle',
                      wave=list(count=3, length=192),
                      color=NULL
                      ){
  cfg = list(percent=percent, radius=radius)
  g2(NULL, 'liquid', cfg=cfg)
}
#' g2_bullet
#'
#' @param data The data source is a collection of objects [{title: '满意度', ranges: [50,100], measures: [80], target: 85}]
#' @param measure Use the length of the data bar, the setting field for the actual value, to represent the actual value.
#' @param range Use the setting field for the length of the background bar to represent the range.
#' @param target Use a setting field for the position of the scale axis of the measurement mark to represent the target value.
#' @param x Used to distinguish different types, suitable for grouping bullet diagrams.
#' @param layout optional 'horizontal' | 'vertical' default: 'horizontal'
#' @param color Set color property of each graph of bullet map.
#' @param size Set the size property of each graph of bullet map.
#' @param bulletStyle Set the style properties of each bullet map.
#'
#' @export
#' @examples
#' data = jsonlite::fromJSON('[{"title":"the title","ranges":[100],"measures":[80],"target":85}]')
#' g2_bullet(data,'measures','ranges','target',color=list(range='#f0efff',measure= '#5B8FF9',target='#3D76DD'),size=list(range=12,measure=12,target=12))
#'
g2_bullet <- function(data, measure,range,target,
                      x=NULL,
                      layout='horizontal',
                      color=NULL,
                      size=NULL,
                      bulletStyle=NULL){
  cfg = list(measureField=measure,
             rangeField=range,
             targetField=target,
             xField=x,
             layout=layout,
             color=color,
             size=size,
             bulletStyle=bulletStyle)
  g2(data, 'bullet', cfg=cfg)
}
#' g2_radar
#'
#' @param x xField
#' @param y yField
#' @param series seriesField
#' @param radius The radius of the radar map, starting at the center of the drawing area (not including the chart component area). The configuration range is (0,1), where 1 means to fill the drawing area.
#' @param startAngle The starting angle of the disk.
#' @param endAngle The termination angle of the disk.
#' @param color color name, hex color code or colorField
#' @param smooth Whether to draw as a curve (spline).
#' @inherit cfg
#' @family g2
#' @export
g2_radar <- function(data,x,y,
                     series=NULL,
                     radius=NULL,
                     startAngle=(pi*0/180),
                     endAngle=(pi*180)/180,
                     color=NULL,
                     smooth=FALSE){
  cfg=list(xField=x,
           yField=y,
           seriesField=series,
           radius=radius,
           startAngle=startAngle,
           endAngle=endAngle,
           smooth=smooth)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      cfg$colorField = color
    } else {
      cfg$color = color
    }
  }
  g2(data, 'radar', cfg=cfg)
}
#' g2_word_cloud
#'
#' @return word-cloud
#' @export
g2_word_cloud <- function(){
  'word-cloud'
}
#' g2_funnel
#'
#' @return funnel
#' @export
g2_funnel <- function(){'funnel'}

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


