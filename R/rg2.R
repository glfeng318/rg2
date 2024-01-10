#' G2Plot options
#'
#' opt param in rg2 is the PlotOptions for G2Plot.
#' You can construct an opt in two way:
#' - use `list()` function in R base package.
#' - use `opt_from_json()` from rg2 package.
#' \url{https://g2plot.antv.antgroup.com/en/api} for details
#'
#' @param width optional number default: 400. width of the chart.
#' @param height optional number default: 400. height of the chart.
#' @param data required. Data frame for plot.
#' @param xField the name of the data field corresponding to the graph in the x direction. you should config the `opt` param with `xField` in `g2()` function, and `x` (short for `xField`) is param name for functions with `g2_` prefix.
#' @param yField the name of the data field corresponding to the graph in the y direction.
#' @param x short for xField
#' @param y short for yField
#' @param color,colorField the name of the data field or color name or hex color code
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
#' opt = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left'),
#'   theme='dark' # default / dark
#' )
#' g2(mtcars, 'scatter', opt = opt)
#'
#' opt = opt_from_json('{"xField":"drat","yField":"wt", "shape":"circle","lengend":{"position":"top-left"},"theme":"dark"}')
#' g2(mtcars, 'scatter', opt = opt)
#'
#' g2_scatter(mtcars, 'drat', 'wt', shape='circle')
#'
#'
#' @name opt
NULL


#' opt_from_json
#'
#' @param json a json string of G2Plot options
#'
#' @return a list of options for G2Plot
#' @export
#'
#' @examples
#' opt = opt_from_json('{"xField":"displ", "yField":"hwy", "colorField":"class", "shape":"circle"}')
opt_from_json <- function(json) {
  jsonlite::fromJSON(json)
}

#' g2 plot
#'
#' all g2 plots can be confined in opt param
#'
#' @param data a data object.Currently supported object is data.frame,
#'    data should only contains the necessary data for chart (reduce json/data size)
#' @param chart the chart type of G2Plot ('line','area','column','bar','pie','scatter','gauge','dual-axes','liquid','radar','word-cloud','funnel','bullet','histogram','venn','rose','tiny-line','tiny-area','tiny-column','sunburst','stock','ring-progress','progress','box','heatmap','waterfall','radial-bar','bidirectional-bar','sankey','chord','treemap','violin','circle-packing','mix','facet')
#' @param opt options of G2Plot. you can use function `opt_from_json()` to build an options or use `list()` to make it. See \url{https://g2plot.antv.antgroup.com/en/api} for details.
#'
#' @inherit opt
#' @family g2
#' @seealso [opt]
#'
#' @export
#' @examples
#' opt = list(
#'   xField='drat',
#'   yField='wt',
#'   shape='circle',
#'   legend = list(position = 'top-left')
#' )
#' g2(mtcars, 'scatter', opt = opt)
#'
#'
g2 <- function(data, chart, opt = list(), width = NULL, height = NULL) {
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
  opt$data = jsonlite::toJSON(data)
  x <- list(
    chart = chart,
    opt = opt
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}


#' g2_line
#'
#'
#' @family g2
#' @inherit opt
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
  opt = list(xField=x,
             yField=y,
             seriesField=series,
             smooth=smooth,
             stepType=stepType,
             isStack=isStack,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'line', opt)
}

#' g2_area
#'
#' @family g2
#' @inherit opt
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
  opt = list(xField=x,
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
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'area', opt)
}
#' g2_column
#'
#' @family g2
#' @inherit opt
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
  opt = list(xField=x,
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
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'column', opt)
}
#' g2_bar
#'
#' @family g2
#' @inherit opt
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
  opt = list(xField=x,
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
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'bar', opt)
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
#' @inherit opt
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
  opt = list(angleField=angle,
             colorField=color,
             radius=radius,
             innerRadius=innerRadius,
             startAngle=startAngle,
             endAngle=endAngle,
             width=width,
             height=height)
  g2(data, 'pie', opt)
}

#' g2_scatter
#'
#' @family g2
#' @inherit opt
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
  opt = list(xField=x,
             yField=y,
             sizeField=size,
             shapeField=shape,
             width=width,
             height=height)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'scatter', opt)}

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
  opt = list(xField=x,yField=y)
  if (geometry == 'll') {
    opt$geometryOptions = list(list(geometry='line'), list(geometry='line'))
  } else if (geometry == 'cl') {
    opt$geometryOptions = list(list(geometry='column'), list(geometry='line'))
  } else if (geometry == 'lc') {
    opt$geometryOptions = list(list(geometry='line'), list(geometry='column'))
  }  else {
    stop('param geometry should be one of "ll, "cl", "lc"')
  }
  g2(list(data, data), 'dual-axes', opt)
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
  opt = list(percent=percent,
             radius=radius,
             innerRadius=innerRadius,
             startAngle=startAngle,
             endAngle=endAngle,
             range=list(ticks=range.ticks,
                        color=range.color,
                        width=range.width))
  g2(NULL, 'gauge', opt=opt)
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
  opt = list(percent=percent, radius=radius)
  g2(NULL, 'liquid', opt=opt)
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
  opt = list(measureField=measure,
             rangeField=range,
             targetField=target,
             xField=x,
             layout=layout,
             color=color,
             size=size,
             bulletStyle=bulletStyle)
  g2(data, 'bullet', opt=opt)
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
#' @inherit opt
#' @family g2
#' @export
g2_radar <- function(data,x,y,
                     series=NULL,
                     radius=NULL,
                     startAngle=(pi*0/180),
                     endAngle=(pi*180)/180,
                     color=NULL,
                     smooth=FALSE){
  opt=list(xField=x,
           yField=y,
           seriesField=series,
           radius=radius,
           startAngle=startAngle,
           endAngle=endAngle,
           smooth=smooth)
  if (!is.null(color)) {
    if (color %in% colnames(data)) {
      opt$colorField = color
    } else {
      opt$color = color
    }
  }
  g2(data, 'radar', opt=opt)
}
#' g2_word_cloud
#'
#' @param word wordField
#' @param weight weightField
#' @param color colorField
#' @param random The value of a js random function can be a value in the interval [0, 1] or a function that returns the value. When the value is a fixed value, the layout coordinates of each word corresponding to the word cloud of the same data will be the same every time the word cloud of the same data is rendered.
#' @param spiral 'archimedean' | 'rectangular' default: 'archimedean'
#' @param timeInterval Sets the maximum execution time of the drawing program in milliseconds. If the time is set too short, it may draw only part of the words.default 2000
#'
#' @inherit opt
#'
#' @export
g2_word_cloud <- function(data, word, weight,
                          color=NULL,
                          random=NULL,
                          spiral='archimedean',
                          timeInterval=2000){
  opt = list(
    wordField=word,
    weightField=weight,
    colorField=color,
    random=random,
    spiral=sprial,
    timeInterval=timeInterval
    )
  g2(data, 'word-cloud', opt = opt)
}
#' g2_funnel
#'
#' @param isTransposed Whether the plot is transposed.
#' @param shape 'funnel' ｜ 'pyramid'
#' @param maxSize the max size of graphic，is between 0 and 1, default 1
#' @param minSize the min size of graphic，is between 0 and 1, default 0
#' @param showFacetTitle
#'
#' @export
g2_funnel <- function(data, x, y,
                      series=NULL,
                      isTransposed=FALSE,
                      shape='funnel',
                      maxSize=1,
                      minSize=0,
                      showFacetTitle=TRUE){
  opt = list(
    xField=x,
    yField=y,
    seriesField=series
  )
  g2(data, 'funnel', opt=opt)
}

#' g2_histogram
#'
#' @param bin binField
#' @param stack stackField
#' @param binWidth  Set the box width of the histogram. BinWidth affects how many boxes the histogram is divided into. Cannot be used with BinNumber.
#' @param binNumber Set the number of histogram boxes. BinNumber affects the width of each column after histogram boxes.
#'
#' @export
#' @examples
#' df = data.frame(value=rnorm(1000))
#' g2_histogram(df, 'value', binNumber)
#'
g2_histogram <- function(data, bin,
                         stack=NULL,
                         binWidth=NULL,
                         binNumber=NULL){
  opt = list(
    binField=bin,
    stackField=stack,
    binWidth=binWidth,
    binNumber=binNumber
  )
  g2(data, 'histogram', opt=opt)
}
#' g2_venn
#'
#' @param data
#' @param sets The field of the collection(sets).
#' @param size The name of the data field corresponding to the point size map.
#' @param color color or color vector or javascript function return color.
#' @param blendMode Color blend mode of the intersection area, default: multiply. Other: normal, darken, lighten, screen, overlay, burn, and dodge. reference：https://gka.github.io/chroma.js/#chroma-blend
#'
#' @export
#' @examples
#' df = jsonlite::fromJSON('[
#'   {"sets": ["A"], "size": 5},
#'   {"sets": ["B"], "size": 10},
#'   {"sets": ["A", "B"], "size": 2},
#' ]')
#' g2_venn(df, 'sets', 'size')
g2_venn <- function(data, sets,
                    size=NULL,
                    color=NULL,
                    blendMode='multiply'){
  opt = list(
    setsField=sets,
    sizeField=size,
    color=color,
    blendMode=blendMode
    )
  g2(data, 'venn', opt=opt)
}
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


