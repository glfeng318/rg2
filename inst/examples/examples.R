library(rg2)
library(dplyr)

data("economics", package="ggplot2")
data("economics_long", package="ggplot2")

df = jsonlite::fromJSON('[
{ "action": "浏览", "pv": 5000 },
{ "action": "加购", "pv": 3500 },
{ "action": "下单", "pv": 2500 },
{ "action": "支付", "pv": 1500 },
{ "action": "成交", "pv": 850 }]')

g2bar(df,'pv','action')

g2funnel(df,'action','pv')

g2line(economics,'date','uempmed')

df_tmp = economics_long %>% filter(variable %in% c('psavert','uempmed'))
g2line(df_tmp,'date','value','variable')
g2line(df_tmp,'date','value','variable',cfg=list(theme='dark'))


# bullet
df = tibble(
  title = c('A','B','C','D'),
  measures = c(83,13,45,83),
  targets = c(90,90,90,90),
  ranges = rep(list(ranges = c(0,0.25,0.5,0.75,1)),4)
) 
g2bullet(df, 
         rangeMax = 100,
         cfg=list(title=list(visible=TRUE,text='Bullet chart'),
                  rangeColors=c('#F8DA41','#F3C173','#EE8C51','#E0605A'))
)

                      

# generate geom file

geom1 = readr::read_csv('./inst/examples/geom1.csv')
geom2 = readr::read_csv('./inst/examples/geom2.csv')


# generate geom

# for (geom in c('line','treemap','step_line','stacked_bar','grouped_bar','percent_stacked_bar','range_bar','area','stacked_area','percent_stacked_area','column','grouped_column','stacked_column','range_column','percent_stacked_column','pie','density_heatmap','heatmap','rose','funnel','stacked_rose','grouped_rose','radar','histogram','density','donut','waterfall','scatter','bubble','bullet','calendar','word_cloud','gauge','fan_gauge','meter_gauge','liquid')) {
#   file.copy('./R/g2bar.R',paste0('./R/g2',geom,'.R'))
#   file.copy('./inst/htmlwidgets/g2bar.yaml',paste0('./R/g2',geom,'.yaml'))
# }

geom = list(
  line = 'Line',
  step_line = 'StepLine',
  treemap = 'Treemap',
  bar = 'Bar',
  stacked_bar = 'StackedBar',
  grouped_bar = 'GroupedBar',
  percent_stacked_bar = 'PercentStackedBar',
  range_bar = 'RangeBar',
  area = 'Area',
  stacked_area = 'StackedArea',
  percent_stacked_area = 'PercentStackedArea',
  column = 'Column',
  column_label = 'ColumnLabel',
  grouped_column = 'GroupedColumn',
  stacked_column = 'StackedColumn',
  stacked_column_label = 'StackedColumnLabel',
  range_column = 'RangeColumn',
  percent_stacked_column = 'PercentStackedColumn',
  pie = 'Pie',
  density_heatmap = 'DensityHeatmap',
  heatmap = 'Heatmap',
  word_cloud = 'WordCloud',
  rose = 'Rose',
  funnel = 'Funnel',
  stacked_rose = 'StackedRose',
  grouped_rose = 'GroupedRose',
  radar = 'Radar',
  liquid = 'Liquid',
  histogram = 'Histogram',
  density = 'Density',
  donut = 'Donut',
  waterfall = 'Waterfall',
  scatter = 'Scatter',
  bubble = 'Bubble',
  bullet = 'Bullet',
  calendar = 'Calendar',
  gauge = 'Gauge',
  fan_gauge = 'FanGauge',
  meter_gauge = 'MeterGauge'
)


for (geom in names(geoms)) {
  writeLines(paste0('HTMLWidgets.widget({
  name: "g2',geom,'",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.',geoms[[geom]],'(el.id, x.cfg);
        chart.render();
      }
    };
  }
});'), paste0('./inst/htmlwidgets/g2',geom,'.js'))
}

for (geom in names(geoms)) {
  writeLines(paste0("#' ",geoms[[geom]]," chart
#' 
#' ",geoms[[geom]]," chart
#' 
#' @param xField,yField,colorField colname in data for aesthetic mapping
#' @inheritParams g2
#' @family bar
#' 
#' @export
g2",geom," <- function(data, xField, yField, colorField = '', cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  cfg$data       = jsonlite::toJSON(data)
  cfg$xField     = xField
  cfg$yField     = yField
  cfg$colorField = colorField
  
  # pass the data and settings using 'x'
  x <- list(
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2",geom,"', x, width = width, height = height, package='rg2')
}


#' @export
g2",geom,"Output <- function(outputId, width = '100%', height = '400px') {
  shinyWidgetOutput(outputId, 'g2",geom,"', width, height, package = 'rg2')
}

#' @export
renderG2",geom," <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, g2",geom,"Output, env, quoted = TRUE, package = 'rg2')
}

"),paste0('./R/g2',geom,'.R'))
}


