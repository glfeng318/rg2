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

g2Bar(df,'pv','action')

g2Funnel(df,'action','pv')

g2Line(economics,'date','uempmed')

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

                      


geoms = c(
  'Bar',
  'Line',
  'StepLine',
  'Treemap',
  'Bar',
  'StackedBar',
  'GroupedBar',
  'PercentStackedBar',
  'RangeBar',
  'Area',
  'StackedArea',
  'PercentStackedArea',
  'Column',
  'ColumnLabel',
  'GroupedColumn',
  'StackedColumn',
  'StackedColumnLabel',
  'RangeColumn',
  'PercentStackedColumn',
  'Pie',
  'DensityHeatmap',
  'Heatmap',
  'WordCloud',
  'Rose',
  'Funnel',
  'StackedRose',
  'GroupedRose',
  'Radar',
  'Liquid',
  'Histogram',
  'Density',
  'Donut',
  'Waterfall',
  'Scatter',
  'Bubble',
  'Bullet',
  'Calendar',
  'Gauge',
  'FanGauge',
  'MeterGauge'
)


for (geom in geoms) {
  cat(paste0("\n          case '",geom,"':
            chart = new G2Plot.",geom,"(el.id, x.cfg);
            break;"))
}


for (geom in geoms) {
  writeLines(paste0("#' ",geom," chart
#' 
#' ",geom," chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
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
    type = '",geom,"',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}


"),paste0('./R/g2',geom,'.R'))
}


