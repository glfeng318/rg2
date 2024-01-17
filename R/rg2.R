#' G2Plot options
#'
#' opt param in rg2 is the PlotOptions for G2Plot.
#' You can construct an opt in two way:
#' - use `list()` function in R base package.
#' - use `g2_opt_from_json()` from rg2 package.
#' \url{https://g2plot.antv.antgroup.com/en/api} for details
#'
#' @param width optional number default: 400. width of the chart.
#' @param height optional number default: 400. height of the chart.
#' @param data required. Data frame for plot.
#' @param reflect Apply reflect transform to the coordinate of line plot. When reflect: 'y' is set, y-axis can be inverted; in the same way, you can set reflect: 'x' to invert x-axis, and invert x-axis and y-axis at the same time is also supported with 'c('x','y')'.
#' @param xField The name of the data field corresponding to the graph in the x direction, usually the field corresponding to the horizontal coordinate axis. For example, to see how many people are in different classes, the class field is the corresponding xField.
#' @param yField The name of the data field corresponding to the graph in the y direction, usually the field corresponding to the vertical coordinate axis. For example, to see the number of students in different classes, the number field is the corresponding yField.
#' @param colorField the name of the data field or color name or hex color code
#' @param seriesField grouping field
#' @param groupField grouping field
#' @param stackField stack field
#' @param sizeField size field
#' @param shapeField shape field
#' @param colorField color field
#' @param angleField angle field
#' @param binField bin field
#' @param setsField sets field
#' @param outliersField outliers field
#' @param measureField measure field
#' @param rangeField range field
#' @param sourceField source field
#' @param targetField target field
#' @param wordField word field
#' @param weightField weight field
#' @param rawFields raw fields
#' @param compareField compare field
#' @param percent percent
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
#' g2plot(mtcars, 'scatter', opt = opt)
#'
#' opt = g2_opt_from_json('{"xField":"drat","yField":"wt", "shape":"circle","lengend":{"position":"top-left"},"theme":"dark"}')
#' g2plot(mtcars, 'scatter', opt = opt)
#'
#' g2_scatter(mtcars, 'drat', 'wt') |>
#'   g2_opt(shape='circle', theme='dark') |>
#'   g2()
#'
#'
#' @name opt
NULL


#' g2 plot
#'
#' all g2 plots can be confined in opt param
#'
#' @param data a data object.Currently supported object is data.frame,
#'    data should only contains the necessary data for chart (reduce json/data size)
#' @param chart the chart type of G2Plot ('line','area','column','bar','pie','scatter','gauge','dual-axes','liquid','radar','word-cloud','funnel','bullet','histogram','venn','rose','tiny-line','tiny-area','tiny-column','sunburst','stock','ring-progress','progress','box','heatmap','waterfall','radial-bar','bidirectional-bar','sankey','chord','treemap','violin','circle-packing','mix','facet')
#' @param opt options of G2Plot. you can use function `g2_opt_from_json()` to build an options or use `list()` to make it. See \url{https://g2plot.antv.antgroup.com/en/api} for details.
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
#' g2plot(mtcars, 'scatter', opt = opt)
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
#' @param opt G2Plot options build from plot function with prefix 'g2_'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_liquid(0.6) |> g2()
#'
g2 <- function(opt, width=NULL, height=NULL) {
  auto_unbox = TRUE
  if (opt$g2_chart == 'venn') {
    auto_unbox = FALSE
  }
  opt$data = jsonlite::toJSON(opt$data, auto_unbox = auto_unbox, null = 'null')
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
#' g2_column(df,'year','value','type') |> g2_opt(isStack=TRUE) |> g2()
#'
g2_column <- function(data, xField, yField,
                      seriesField=NULL,
                      groupField=NULL,
                      colorField=NULL){
  list(
    g2_chart='column',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField,
    groupField=groupField,
    colorField=colorField
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
#'   g2_pie('value','cate') |>
#'   g2_opt(radius=.8, innerRadius=.4) |>
#'   g2()
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = data.frame(
#'  time = c('2023-01','2023-02','2023-03','2023-04','2023-05'),
#'  value=c(350,900,300,450,470),
#'  count=c(800,600,400,380,200)
#' )
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_opt(geometryOptions = list(list(geometry='line'), list(geometry='line'))) |>
#' g2()
#'
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_opt(geometryOptions = list(list(geometry='column'), list(geometry='line'))) |>
#' g2()
#'
#' g2_dual_axes(data, 'time', c('value','count')) |>
#' g2_opt(geometryOptions = list(list(geometry='line'), list(geometry='column'))) |>
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
#' @inherit opt
#' @family g2
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
#' @inherit opt
#' @family g2
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = jsonlite::fromJSON('[{"title":"the title","ranges":[100],"measures":[80],"target":85}]')
#' g2_bullet(data,'measures','ranges','target') |>
#' g2_opt(color=list(range='#f0efff',measure= '#5B8FF9',target='#3D76DD'),
#'        size=list(range=12,measure=12,target=12)) |>
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
#' g2_radar(data,'item','score','user') |> g2_opt(area=list()) |> g2()
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
#' @export
#' @examples
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/jPKbal7r9r/mock.json') |>
#'   g2_word_cloud('x','value') |>
#'   g2_opt(
#'     color='#122c6a',
#'     wordStyle=list(
#'       fontFamily='Verdana',
#'       fontSize=c(24, 80)
#'     )
#'   ) |>
#'   g2()
#'
#'
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antvdemo/assets/data/antv-keywords.json') |>
#'   g2_word_cloud('name','value','name') |>
#'   g2_opt(
#'     imageMask='https://gw.alipayobjects.com/mdn/rms_2274c3/afts/img/A*07tdTIOmvlYAAAAAAAAAAABkARQnAQ',
#'     wordStyle=list(
#'       fontFamily='Verdana',
#'       fontSize=c(8, 32)
#'     )
#'   ) |>
#'   g2()
#'
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
#' @examples
#' data.frame(stage=paste0('L', 1:5),value=c(253,151,113,87,59)) |> g2_funnel('stage','value') |> g2()
#'
#' data.frame(stage=paste0('L', 1:5),value=c(253,151,113,87,59)) |> g2_funnel('stage','value') |> g2_opt(isTransposed=TRUE) |> g2()
#'
#' data.frame(stage=paste0('L', 1:5),value=c(253,151,113,87,59)) |> g2_funnel('stage','value') |> g2_opt(legend=FALSE,shape='pyramid') |> g2()
#'
#' data.frame(stage=paste0('L', 1:5),value=c(253,151,113,87,59)) |> g2_funnel('stage','value') |> g2_opt(legend=FALSE,dynamicHeight=TRUE) |> g2()
#'
#' data.frame(stage=paste0('L', rep(1:5,2)),value=c(253,151,113,87,59,303,251,135,117,79),cate=rep(c('A','B'),each=5)) |> g2_funnel('stage','value',compareField='cate') |> g2()
#' data.frame(stage=paste0('L', rep(1:5,2)),value=c(253,151,113,87,59,303,251,135,117,79),cate=rep(c('A','B'),each=5)) |> g2_funnel('stage','value',seriesField='cate') |> g2()
#'
g2_funnel <- function(data, xField, yField,
                      compareField=NULL,
                      seriesField=NULL){
  list(
    g2_chart='funnel',
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
#' g2_opt(binNumber=100) |>
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' df = jsonlite::fromJSON('[
#'   {"sets": ["A"], "size": 5},
#'   {"sets": ["B"], "size": 10},
#'   {"sets": ["A", "B"], "size": 2}
#' ]')
#' g2_venn(df, 'sets', 'size') |> g2()
g2_venn <- function(data, setsField,
                    sizeField=NULL,
                    colorField=NULL){
  list(
    g2_chart='venn',
    data=data,
    setsField=setsField,
    sizeField=sizeField,
    colorField=colorField
  )
}
#' g2_rose
#'
#' @inherit opt
#' @family g2
#' @return rose
#' @export
#' @examples
#' data = data.frame(cate=c('a','b','c','d','e','f'), value=c(27,25,18,15,10,5))
#' g2_rose(data, 'cate','value','cate') |> g2_opt(radius=0.9) |> g2()
#'
g2_rose <- function(data, xField, yField,
                    seriesField=NULL,
                    colorField=NULL){
  list(
    g2_chart='rose',
    data=data,
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
#' g2_opt(
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_tiny_area(rnorm(100)) |>
#' g2_opt(
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_tiny_column(rnorm(100)) |>
#' g2_opt(
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
#' The data for sunburst chart has a special format, if your data Node do not follow its key name, you need to specify the `hierarchyConfig` in `g2_opt()`
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/ryp44nvUYZ/coffee.json') |> g2_sunburst() |> g2()
#'
#' # Data Node with label/uv/sum/count (default Node with name/value/children)
#' df = jsonlite::fromJSON("https://gw.alipayobjects.com/os/antvdemo/assets/data/sunburst.json",simplifyVector=TRUE)
#' g2_sunburst(df, 'label') |> g2_opt(hierarchyConfig = list(field='sum')) |> g2()
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
#' @inherit opt
#' @family g2
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_ring_progress(0.75) |>
#' g2_opt(
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
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_progress(0.75) |>
#' g2_opt(
#'   color=c('#F4664A', '#E8EDF3'),
#'   barWidthRatio=0.3,
#'   autoFit=FALSE,
#'   width=300,
#'   height=100) |>
#' g2()
#'
g2_progress <- function(percent){
  list(
    g2_chart='progress',
    data=NULL,
    percent=percent
  )
}
#' g2_box
#'
#' @inherit opt
#' @family g2
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
#' g2_box(df, 'type','bin', 'Species') |>
#' g2_opt(boxStyle=list(fill="#f6f"),outliersStyle=list(fill="#f6f")) |>
#' g2()
#'
g2_box <- function(data, xField, yField,
                   groupField=NULL,
                   outliersField=NULL){
  list(
    g2_chart='box',
    data=data,
    xField=xField,
    yField=yField,
    groupField=groupField,
    outliersField=outliersField
  )
}
#' g2_heatmap
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/basement_prod/a719cd4e-bd40-4878-a4b4-df8a6b531dfe.json') |>
#' g2_heatmap('Month of Year','District','AQHI') |>
#' g2_opt(
#'   color=c('#174c83', '#7eb6d4', '#efefeb', '#efa759', '#9b4d16'),
#'   meta=list('Month of Year'=list(type='cat'))
#' ) |>
#' g2()
#'
g2_heatmap <- function(data,xField,yField,
                       colorField=NULL,
                       sizeField=NULL) {
  list(
    g2_chart='heatmap',
    data=data,
    xField=xField,
    yField=yField,
    colorField=colorField,
    sizeField=sizeField
  )
}
#' g2_waterfall
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data.frame(cate=letters[1:7], money=c(120,900,200,300,1200,1000,-2000)) |> g2_waterfall('cate','money') |> g2()
#'
g2_waterfall <- function(data,xField,yField){
  list(
    g2_chart='waterfall',
    data=data,
    xField=xField,
    yField=yField
  )
}
#' g2_radial_bar
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = data.frame(cate=c('a','b','c'), value=c(430, 650,800))
#' g2_radial_bar(data, 'cate', 'value') |> g2_opt(radius=0.8,innerRadius=0.2) |>  g2()
g2_radial_bar <- function(data, xField,yField){
  list(
    g2_chart='radial-bar',
    data=data,
    xField=xField,
    yField=yField
  )
}
#' g2_bidirectional_bar
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = data.frame(city=c('a','b','c','d','e','f'),cate_a=1:6, cate_b=7:12)
#'
#' g2_bidirectional_bar(data,'city',c('cate_a','cate_b')) |> g2()
#'
#' g2_bidirectional_bar(data,'city',c('cate_a','cate_b')) |> g2_opt(xAxis=list(position='bottom'),label=list(position='right')) |> g2()
#'
#' g2_bidirectional_bar(data,'city',c('cate_a','cate_b')) |> g2_opt(layout='vertical',xAxis=list(position='bottom'),label=list(position='right')) |> g2()
#'
g2_bidirectional_bar <- function(data,xField,yField){
  list(
    g2_chart='bidirectional-bar',
    data=data,
    xField=xField,
    yField=yField
  )
}
#' g2_sankey
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = jsonlite::fromJSON('[
#' { "source": "首次打开","target": "首页 UV", "value": 160 },
#' { "source": "结果页",  "target": "首页 UV", "value": 40 },
#' { "source": "验证页",  "target": "首页 UV", "value": 10 },
#' { "source": "我的",    "target": "首页 UV", "value": 10 },
#' { "source": "朋友",    "target": "首页 UV", "value": 8 },
#' { "source": "其他",    "target": "首页 UV", "value": 27 },
#' { "source": "首页 UV", "target": "理财",    "value": 30 },
#' { "source": "首页 UV", "target": "扫一扫",  "value": 40 },
#' { "source": "首页 UV", "target": "服务",    "value": 35 },
#' { "source": "首页 UV", "target": "蚂蚁森林","value": 25 },
#' { "source": "首页 UV", "target": "跳失",    "value": 10 },
#' { "source": "首页 UV", "target": "借呗",    "value": 30 },
#' { "source": "首页 UV", "target": "花呗",    "value": 40 },
#' { "source": "首页 UV", "target": "其他流向","value": 45 }
#' ]')
#' g2_sankey(data, 'source', 'target', 'value') |> g2()
#'
#' g2_sankey(data, 'source', 'target', 'value') |> g2_opt(nodeWidthRatio=0.008,nodePaddingRatio=0.03) |> g2()
#'
g2_sankey <- function(data,sourceField,targetField,weightField,
                      rawFields=NULL){
  opt = list(
    g2_chart='sankey',
    data=data,
    sourceField=sourceField,
    targetField=targetField,
    weightField=weightField
  )
  if (!is.null(rawFields)) {
    opt$rawFields=rawFields
  }
  opt
}
#' g2_chord
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' data = jsonlite::fromJSON('[
#' { "source": "北京", "target": "天津", "value": 30 },
#' { "source": "北京", "target": "上海", "value": 80 },
#' { "source": "北京", "target": "河北", "value": 46 },
#' { "source": "北京", "target": "辽宁", "value": 49 },
#' { "source": "北京", "target": "黑龙江", "value": 69 },
#' { "source": "北京", "target": "吉林", "value": 19 },
#' { "source": "天津", "target": "河北", "value": 62 },
#' { "source": "天津", "target": "辽宁", "value": 82 },
#' { "source": "天津", "target": "上海", "value": 16 },
#' { "source": "上海", "target": "黑龙江", "value": 16 },
#' { "source": "河北", "target": "黑龙江", "value": 76 },
#' { "source": "河北", "target": "内蒙古", "value": 24 },
#' { "source": "内蒙古", "target": "北京", "value": 32 }
#' ]')
#' g2_chord(data, 'source','target', 'value') |> g2()
#'
g2_chord <- function(data,sourceField,targetField,weightField){
  list(
    g2_chart='chord',
    data=data,
    sourceField=sourceField,
    targetField=targetField,
    weightField=weightField
  )
}
#' g2_treemap
#'
#' @inherit opt
#' @family g2
#' @export
g2_treemap <- function(data,colorField,rawFields){
  list(
    g2_chart='treemap',
    data=data,
    colorField=colorField,
    rawFields=rawFields
  )
}
#' g2_violin
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' g2_violin(iris, 'Species','Sepal.Length') |> g2()
#'
g2_violin <- function(data,xField,yField,
                      seriesField=NULL){
  list(
    g2_chart='violin',
    data=data,
    xField=xField,
    yField=yField,
    seriesField=seriesField
  )
}
#' g2_circle_packing
#'
#' @inherit opt
#' @family g2
#' @export
#' @examples
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/%24m0nDoQYqH/basic-packing.json') |>
#'   g2_circle_packing() |>
#'   g2()
#'
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/%24m0nDoQYqH/basic-packing.json') |>
#'   g2_circle_packing() |>
#'   g2_opt(
#'     label=FALSE,
#'     legend=FALSE,
#'     hierarchyConfig=list(sort=htmlwidgets::JS('(a, b) => b.depth - a.depth'))
#'   ) |>
#'   g2()
#'
#' jsonlite::fromJSON('https://gw.alipayobjects.com/os/antvdemo/assets/data/flare.json') |>
#'   g2_circle_packing(sizeField = 'r',colorField = 'r') |>
#'   g2_opt(
#'     color='rgb(252, 253, 191)-rgb(231, 82, 99)-rgb(183, 55, 121)',
#'     pointStyle=list(
#'       stroke='rgb(183, 55, 121)',
#'       lineWidth= 0.5
#'     ),
#'     label=FALSE,
#'     legend=FALSE,
#'     drilldown=list(
#'       enabled=TRUE,
#'       breadCrumb= list(
#'         position='top-left'
#'       )
#'     )
#'   ) |>
#'   g2()
#'
g2_circle_packing <- function(data,
                              colorField=NULL,
                              sizeField=NULL,
                              rawFields=NULL){
  opt = list(
    g2_chart='circle-packing',
    data=data
  )
  if (!is.null(colorField)) {
    opt$colorField=colorField
  }
  if (!is.null(sizeField)) {
    opt$sizeField=sizeField
  }
  if (!is.null(rawFields)) {
    opt$rawFields=rawFields
  }
  opt
}
