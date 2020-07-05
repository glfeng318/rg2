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

g2Bar(df,pv,action)

g2Funnel(df, action, 'pv')

g2Line(economics,date,uempmed)

df_tmp = economics_long %>% filter(variable %in% c('psavert','uempmed'))
g2Line(df_tmp,'date','value','variable')
g2Line(df_tmp,'date','value','variable',cfg=list(theme='dark'))


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

# density
df = data.frame(x=rnorm(1000, mean = 50, sd=5))
g2Density(df, x, binWidth = 2)
                      

#DensityHeatmap
df = jsonlite::read_json('https://antv-g2plot.gitee.io/zh/examples/data/jobpaying.json',TRUE)
g2DensityHeatmap(df, 'prob', 'Average annual wage', 'numbEmployed')
g2DensityHeatmap(df, 'prob', 'Average annual wage', 'numbEmployed', 
                 radius=15,
                 color=c('#295599', '#3e94c0', '#78c6d0', '#b4d9e4', '#fffef0', '#f9cdac', '#ec7d92', '#bc448c'))

# Donut
df = jsonlite::fromJSON('[{"type": "分类一","value": 27},
 {"type": "分类二","value": 25},
 {"type": "分类三","value": 18},
 {"type": "分类四","value": 15},
 {"type": "分类五","value": 10},
 {"type": "其它","value": 5}]')
g2Donut(df, value, type)
g2Donut(df, type, value)





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
  print(paste0(geom,'-',))
}


for (geom in geoms) {
  writeLines(paste0("#' ",geom," chart
#' 
#' ",geom," chart
#' 
#' @param xField,yField,colorField column name in data for aesthetic mapping
#' @inheritParams g2
#' @family ",case_when(grepl('Area',geom) ~ 'area',grepl('Rose',geom) ~ 'rose',grepl('Gauge',geom) ~ 'gauge',grepl('Bar',geom) ~ 'bar',grepl('Line',geom) ~ 'line',grepl('Column',geom) ~ 'column',TRUE ~ ''),"
#' 
#' @export
g2",geom," <- function(data, xField, yField, colorField = NULL, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField = as.character(substitute(xField))
  yField = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))  # NULL returns character(0)
  
  cfg$xField = xField
  cfg$yField = yField
  keep_col = c(xField, yField)
  if (!identical(colorField, character(0))) {
    cfg$colorField = as.character(colorField)
    keep_col = append(keep_col, colorField)
  }
  data = subset(data, select = keep_col)
  cfg$data = jsonlite::toJSON(data)
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



test <- function(data, xField, yField, colorField=NULL, cfg = list(), width = NULL, height = NULL) {
  # prep cfg
  xField     = as.character(substitute(xField))
  yField     = as.character(substitute(yField))
  colorField = as.character(substitute(colorField))
  print(xField)
  print(yField)
  print(colorField)
  
  if (!identical(colorField, character(0))) {
    print('set color field')
  }
}

test(df,pv)
test(df,pv,action)
test(df,'pv','action')
test(df,pv,action,action)

