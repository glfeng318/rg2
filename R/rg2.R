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
g2plot <- function(data, chart, opt = list(), width = NULL, height = NULL) {
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
  opt$data = jsonlite::toJSON(data, auto_unbox = T, null = 'null')
  opt$g2_chart = chart
  x <- list(opt = opt)
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

#' g2
#'
#' @param opt opt
#' @param width 400
#' @param height 400
#'
#' @export
#'
g2 <- function(opt, width=NULL, height=NULL) {
  opt$data = jsonlite::toJSON(opt$data, auto_unbox = T, null = 'null')
  x = list(opt=opt)
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}


#' g2_line
#'
#' @family g2
#' @inherit opt
#'
#' @export
#'
#' @examples
#'
#' df = jsonlite::read_json("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json",simplifyVector = TRUE)
#' g2_line(df, 'Date','scales') |> g2()
#'
g2_line <- function(data, xField, yField,
                    seriesField=NULL,
                    colorField=NULL) {
  list(
    g2_chart='line',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    colorField=colorField
  )
}

#' g2_area
#'
#' @family g2
#' @inherit opt
#'
#' @export
#' @examples
#' df = jsonlite::read_json("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json",simplifyVector = TRUE)
#' g2_area(df, 'Date','scales') |> g2()
#'
g2_area <- function(data, xField, yField,
                    seriesField=NULL,
                    colorField=NULL){
  list(
    g2_chart='area',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    colorField=colorField
  )
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
g2_column <- function(data, xField, yField,
                      seriesField=NULL,
                      groupField=NULL,
                      colorField=NULL,
                      isGroup=NULL,
                      isStack=NULL,
                      isRange=NULL,
                      isPercent=NULL){
  list(
    g2_chart='column',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    groupField=groupField
  )
}
#' g2_bar
#'
#' @family g2
#' @inherit opt
#'
#' @export
#' @examples
#' jsonlite::fromJSON('[
#'   { "year": "1951", "value": 38 },
#'   { "year": "1952", "value": 52 },
#'   { "year": "1956", "value": 61 },
#'   { "year": "1957", "value": 145 },
#'   { "year": "1958", "value": 48 }]') |>
#'   g2_bar('value', 'year') |>
#'   g2()
#'
g2_bar <- function(data, xField, yField,
                   seriesField=NULL,
                   groupField=NULL,
                   colorField=NULL){
  list(
    g2_chart='bar',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    groupField=groupField
  )
}
#' g2_pie
#'
#'
#' @family g2
#' @inherit opt
#'
#' @export
#' @examples
#' data.frame(
#'   cate = c('a','b','c','d','e'),
#'   value = c(1,2,3,5,8)
#' ) |>
#' g2_pie('value','cate') |>
#' g2_style(radius=.8, innerRadius=.4) |>
#' g2()
#'
g2_pie <- function(data,angleField,colorField){
  list(
    g2_chart='pie',
    data=data,
    angleField=angleField,
    colorField=colorField
  )
}

#' g2_scatter
#'
#' @family g2
#' @inherit opt
#'
#' @export
#' @examples
#' g2_scatter(cars, 'speed', 'dist') |> g2()
#' g2_scatter(iris, 'Sepal.Length', 'Sepal.Width',colorField='Species') |> g2()
#'
g2_scatter <- function(data, xField, yField,
                       sizeField=NULL,
                       shapeField=NULL,
                       colorField=NULL){
  list(
    g2_chart='scatter',
    data=data,
    xField=xField,
    yField=yField,
    sizeField=sizeField,
    shapeField=shapeField,
    colorField=colorField
  )
}

#' g2_dual_axes
#'
#' @export
#' @examples
#' data = data.frame(
#'  time = c('2023-01','2023-02','2023-03','2023-04','2023-05'),
#'  value=c(350,900,300,450,470),
#'  count=c(800,600,400,380,200)
#' )
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_style(geometryOptions = list(list(geometry='line'), list(geometry='line'))) |>
#' g2()
#'
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_style(geometryOptions = list(list(geometry='column'), list(geometry='line'))) |>
#' g2()
#'
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_style(geometryOptions = list(list(geometry='line'), list(geometry='column'))) |>
#' g2()
#'
g2_dual_axes <- function(data, xField, yField){
  list(
    g2_chart='dual-axes',
    data=list(data,data),
    xField=xField,
    yField=yField
  )
}
#' g2_gauge
#'
#'
#' @export
#' @examples
#' g2_gauge(0.618)
#'
g2_gauge <- function(percent){
  list(
    g2_chart='gauge',
    data=NULL,
    percent=percent
  )
}
#' g2_liquid
#'
#' @export
#' @examples
#' g2_liquid(0.618) |> g2()
#'
g2_liquid <- function(percent){
  list(
    g2_chart='liquid',
    data=NULL,
    percent=percent
  )
}
#' g2_bullet
#'
#' @param data The data source is a collection of objects [{title: 'income', ranges: [50,100], measures: [80], target: 85}]
#' @param measureField Use the length of the data bar, the setting field for the actual value, to represent the actual value.
#' @param rangeField Use the setting field for the length of the background bar to represent the range.
#' @param targetField Use a setting field for the position of the scale axis of the measurement mark to represent the target value.
#' @param xField Used to distinguish different types, suitable for grouping bullet diagrams.
#'
#' @export
#' @examples
#' data = jsonlite::fromJSON('[{"title":"the title","ranges":[100],"measures":[80],"target":85}]')
#' g2_bullet(data,'measures','ranges','target') |>
#' g2_style(color=list(range='#f0efff',measure= '#5B8FF9',target='#3D76DD'),
#'          size=list(range=12,measure=12,target=12)) |>
#' g2()
#'
g2_bullet <- function(data, measureField,rangeField,targetField,
                      xField=NULL){
  list(
    g2_chart='bullet',
    data=data,
    measureField=measureField,
    rangeField=rangeField,
    targetField=targetField,
    xField=xField
  )
}
#' g2_radar
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/svFjSfJkYy/radar.json')
#' g2_radar(data,'item','score','user') |> g2_style(area=list()) |> g2()
#'
g2_radar <- function(data,xField,yField,
                     seriesField=NULL){
  list(
    g2_chart='radar',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField
  )
}
#' g2_word_cloud
#'
#' @inherit opt
#' @family g2
#'
#' @export
g2_word_cloud <- function(data, wordField, weightField,
                          colorField=NULL){
  list(
    g2_chart='word-cloud',
    data=data,
    wordField=wordField,
    weightField=weightField,
    colorField=colorField
  )
}
#' g2_funnel
#'
#' @inherit opt
#' @family g2
#' @export
g2_funnel <- function(data, xField, yField,
                      compareField=NULL,
                      seriesField=NULL){
  list(
    g2_cahrt='funnel',
    data=data,
    xField=xField,
    yField=yField,
    compareField=compareField,
    seriesField=seriesField
  )
}

#' g2_histogram
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data.frame(value=rnorm(1000)) |>
#' g2_histogram('value') |>
#' g2()
#'
#' data.frame(value=rnorm(1000)) |>
#' g2_histogram('value') |>
#' g2_style(binNumber=100) |>
#' g2()
#'
g2_histogram <- function(data, binField,
                         stackField=NULL){
  list(
    g2_chart='histogram',
    data=data,
    binField=binField,
    stackField=stackField
  )
}
#' g2_venn
#'
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
g2_venn <- function(data, setsField,
                    sizeField=NULL,
                    colorField=NULL){
  list(
    g2_chart='venn',
    data=data,
    setsField=setsField,
    sizeField=sizeField,
    color=colorField
  )
}
#' g2_rose
#'
#' @return rose
#' @export
g2_rose <- function(data, xField, yField,
                    seriesField=NULL,
                    colorField=NULL){
  lsit(
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    colorField=colorField
  )
}
#' g2_tiny_line
#'
#' @param data number vector
#'
#' @export
#' @examples
#' g2_tiny_line(rnorm(100)) |>
#' g2_style(
#'   smooth=FALSE,
#'   connectNulls=TRUE,
#'   height=80,
#'   color='red',
#'   autoFit=FALSE) |>
#' g2()
#'
g2_tiny_line <- function(data){
  list(
    g2_chart='tiny-line',
    data=data
  )
}
#' g2_tiny_area
#'
#' @return tiny-area
#' @export
#' @examples
#' g2_tiny_area(rnorm(100)) |>
#' g2_style(
#'   smooth=TRUE,
#'   height=80,
#'   color='red',
#'   autoFit=FALSE) |>
#' g2()
#'
g2_tiny_area <- function(data){
  list(
    g2_chart='tiny-area',
    data=data
  )
}
#' g2_tiny_column
#'
#' @export
#' @examples
#' g2_tiny_column(rnorm(100)) |>
#' g2_style(
#'   columnWidthRatio=0.5,
#'   height=80,
#'   color=NULL,
#'   autoFit=FALSE) |>
#' g2()
#'
g2_tiny_column <- function(data){
  list(
    g2_chart='tiny-column',
    data=data
  )
}
#' g2_sunburst
#'
#' The data for sunburst chart has a special format, if your data Node do not follow its key name, you need to specify the `hierarchyConfig` in `g2_style()`
#'
#' @section Data:
#' data schema
#' ```
#'
#' type Node = { name: string; value?: number; children: Node[]; }
#'
#' ```
#' an example data looks like:
#' ```
#' {
#' name: 'root',
#' children: [
#'   { name: 'type1', value: 1 },
#'   { name: 'type2', value: 3, children: [{ name: 'type2-1', value: 2 }] }
#' ]
#' }
#' ```
#'
#' @export
#' @examples
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/ryp44nvUYZ/coffee.json') |> g2_sunburst() |> g2()
#'
#' # Data Node with label/uv/sum/count (default Node with name/value/children)
#' df = jsonlite::fromJSON("https://gw.alipayobjects.com/os/antvdemo/assets/data/sunburst.json", simplifyVector = T)
#' g2_sunburst(df, 'label') |> g2_style(hierarchyConfig = list(field='sum')) |> g2()
#'
#'
g2_sunburst <- function(data,
                        colorField=NULL,
                        rawFields=NULL){
  opt = list(
    g2_chart='sunburst',
    data=data
  )
  if(!is.null(colorField)) {
    opt$colorField=colorField
  }
  if(!is.null(rawFields)) {
    opt$rawFields=rawFields
  }
  opt
}
#' g2_stock
#'
#' @param xField: timestamp like 1436237115500 or datetime string like '2015-03-01', '2015-03-01 12:01:40'，'2015/01/05', '2015-03-01T16:00:00.000Z'
#' @param yField array c('open', 'close', 'high', 'low')
#'
#' @export
#' @examples
#' df = jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/qtQ9nYfYJe/stock-data.json')
#' g2_stock(df, 'trade_date', c('open', 'close', 'high', 'low')) |> g2()
#'
g2_stock <- function(data, xField, yField){
  list(
    g2_chart='stock',
    data=data,
    xField=xField,
    yField=yField
  )
}
#' g2_ring_progress
#'
#' @param color color vector of length 2
#'
#' @export
#' @examples
#' g2_ring_progress(0.75) |>
#' g2_style(
#'   color=c('#5B8FF9', '#E8EDF3'),
#'   radius=0.8,
#'   innerRadius=0.75,
#'   autoFit=FALSE,
#'   width=200,
#'   height=200) |>
#' g2()
#'
g2_ring_progress <- function(percent){
  list(
    g2_chart='ring-progress',
    data=NULL,
    percent=percent
  )
}
#' g2_progress
#'
#' @param color color vector of length 2
#' @param barWidthRatio [0-1]
#'
#' @export
#' @examples
#' g2_progress(0.75, color=c('#F4664A', '#E8EDF3'), barWidthRatio=0.3)
#'
g2_progress <- function(percent,
                        color=NULL,
                        barWidthRatio=0.5,
                        autoFit=FALSE,
                        width=300,
                        height=100){
  opt = list(
    percent=percent,
    color=color,
    barWidthRatio=barWidthRatio,
    autoFit=autoFit,
    width=width,
    height=height
  )
  g2(NULL, 'progress', opt=opt)
}
#' g2_box
#'
#' @param x xField
#' @param y yField
#' @param group Grouping field. It is used for grouping by default, and color is used as visual channel.
#' @param outliers Outlier field.
#' @param boxStyle list(fill="#f6f",...)
#' @param outliersStyle list(fill="#f6f",...)
#'
#' @export
#' @examples
#' df = jsonlite::fromJSON('[
#' { "x": "Oceania", "low": 1, "q1": 9, "median": 16, "q3": 22, "high": 24 },
#' { "x": "East Europe", "low": 1, "q1": 5, "median": 8, "q3": 12, "high": 16 },
#' { "x": "Australia", "low": 1, "q1": 8, "median": 12, "q3": 19, "high": 26 },
#' { "x": "South America", "low": 2, "q1": 8, "median": 12, "q3": 21, "high": 28 },
#' { "x": "North Africa", "low": 1, "q1": 8, "median": 14, "q3": 18, "high": 24 },
#' { "x": "North America", "low": 3, "q1": 10, "median": 17, "q3": 28, "high": 30 },
#' { "x": "West Europe", "low": 1, "q1": 7, "median": 10, "q3": 17, "high": 22 },
#' { "x": "West Africa", "low": 1, "q1": 6, "median": 8, "q3": 13, "high": 16 }
#' ]')
#' g2_box(df, 'x',c('low', 'q1', 'median', 'q3', 'high'))
#'
#' # different data format (yField)
#' df = jsonlite::fromJSON('
#' [
#' { "Species": "I. setosa", "type": "SepalLength", "value": 5.1, "bin": [4.3, 4.8, 5, 5.2, 5.8] },
#' { "Species": "I. setosa", "type": "SepalWidth", "value": 3.5, "bin": [2.3, 3.2, 3.4, 3.7, 4.4] },
#' { "Species": "I. setosa", "type": "PetalLength", "value": 1.4, "bin": [1, 1.4, 1.5, 1.6, 1.9] },
#' { "Species": "I. setosa", "type": "PetalWidth", "value": 0.2, "bin": [0.1, 0.2, 0.2, 0.3, 0.6] },
#' { "Species": "I. versicolor", "type": "SepalLength", "value": 7, "bin": [4.9, 5.6, 5.9, 6.3, 7] },
#' { "Species": "I. versicolor", "type": "SepalWidth", "value": 3.2, "bin": [2, 2.5, 2.8, 3, 3.4] },
#' { "Species": "I. versicolor", "type": "PetalLength", "value": 4.7, "bin": [3, 4, 4.35, 4.6, 5.1] },
#' { "Species": "I. versicolor", "type": "PetalWidth", "value": 1.4, "bin": [1, 1.2, 1.3, 1.5, 1.8] },
#' { "Species": "I. virginica", "type": "SepalLength", "value": 6.3, "bin": [4.9, 6.2, 6.5, 6.9, 7.9] },
#' { "Species": "I. virginica", "type": "SepalWidth", "value": 3.3, "bin": [2.2, 2.8, 3, 3.2, 3.8] },
#' { "Species": "I. virginica", "type": "PetalLength", "value": 6, "bin": [4.5, 5.1, 5.55, 5.9, 6.9] },
#' { "Species": "I. virginica", "type": "PetalWidth", "value": 2.5, "bin": [1.4, 1.8, 2, 2.3, 2.5] }
#' ]')
#' g2_box(df, 'type','bin',group = 'Species')
#'
g2_box <- function(data, x, y,
                   group=NULL,
                   outliers=NULL,
                   boxStyle=NULL,
                   outliersStyle=NULL){
  opt=list(
    xField=x,
    yField=y,
    groupField=group,
    outliersField=outliers,
    boxStyle=boxStyle,
    outliersStyle=outliersStyle
  )
  g2(data,'box',opt=opt)
}
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


