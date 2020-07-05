library(rg2)
library(dplyr)

data("economics", package="ggplot2")
data("economics_long", package="ggplot2")


g2Bar(df,pv,action)



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

# Gauge
cfg = list(statistic=list(visible=TRUE,text='Good',color='#43E089'))
g2Gauge(50, range = c(0,25,75,100), min=0, max=100)
g2Gauge(50, range = c(  25,75,100), min=0, max=100)
g2Gauge(50, range = c(  25,75,100), min=0, max=100, cfg=cfg)
# MeterGauge
g2MeterGauge(50, range = c(0,25,75,100), min=0, max=100)
g2MeterGauge(50, range = c(  25,75,100), min=0, max=100)
g2MeterGauge(50, range = c(  25,75,100), min=0, max=100, cfg=cfg)
# FanGauge
g2FanGauge(value=0.8)
g2FanGauge(value=0.35, range=c(0, 0.35))
g2FanGauge(value=0.35, range=c(0, 0.35), cfg=cfg)

cfg = list(statistic=list(visible=TRUE,text='Good',color='#43E089'),
           format=htmlwidgets::JS("(v) => {return v + '%';}"))
g2FanGauge(value=35, range=c(0, 75), min=0, max=100,  cfg=cfg)

#Funnel
df = jsonlite::fromJSON('[
{ "action": "浏览", "pv": 5000 },
{ "action": "加购", "pv": 3500 },
{ "action": "下单", "pv": 2500 },
{ "action": "支付", "pv": 1500 },
{ "action": "成交", "pv": 850 }]')
g2Funnel(df, action, pv)
g2Funnel(df, action, pv, dynamicHeight = TRUE)
g2Funnel(df, action, pv, transpose = TRUE)
df = jsonlite::fromJSON('[
  { "action": "浏览", "pv": 50000, "quarter": "2020Q1" },
  { "action": "加购", "pv": 35000, "quarter": "2020Q1" },
  { "action": "下单", "pv": 25000, "quarter": "2020Q1" },
  { "action": "支付", "pv": 15000, "quarter": "2020Q1" },
  { "action": "成交", "pv": 11500, "quarter": "2020Q1" },
  { "action": "浏览", "pv": 80000, "quarter": "2020Q2" },
  { "action": "加购", "pv": 63000, "quarter": "2020Q2" },
  { "action": "下单", "pv": 47000, "quarter": "2020Q2" },
  { "action": "支付", "pv": 24000, "quarter": "2020Q2" },
  { "action": "成交", "pv": 17500, "quarter": "2020Q2" }
]')
g2Funnel(df, action, pv, quarter)

#GroupedBar
g2GroupedBar(df, pv, action, quarter)
g2GroupedBar(df, pv, action, quarter, 
             cfg=list(legend=list(visible=TRUE,position='bottom-center')))

#GroupedColumn
g2GroupedColumn(df, action, pv, quarter)
g2GroupedColumn(df, action, pv, quarter, 
             cfg=list(legend=list(visible=TRUE,position='top-right')))


# Rose
df = jsonlite::fromJSON('[
  {"type": "分类一","value": 27,"user": "用户一"},
  {"type": "分类二","value": 25,"user": "用户一"},
  {"type": "分类三","value": 18,"user": "用户一"},
  {"type": "分类四","value": 15,"user": "用户一"},
  {"type": "分类五","value": 10,"user": "用户一"},
  {"type": "分类一","value": 7,"user": "用户二"},
  {"type": "分类二","value": 5,"user": "用户二"},
  {"type": "分类三","value": 38,"user": "用户二"},
  {"type": "分类四","value": 5,"user": "用户二"},
  {"type": "分类五","value": 20,"user": "用户二"}]')
g2Rose(head(df, 5), value, type, type)
g2StackedRose(df, value, type, user)
g2GroupedRose(df, value, type, user)

# Heatmap
df = jsonlite::read_json('https://gw.alipayobjects.com/os/basement_prod/a719cd4e-bd40-4878-a4b4-df8a6b531dfe.json', TRUE)
df$AQHI = as.numeric(df$AQHI)
g2Heatmap(df, 'Month of Year', 'District', colorField = 'AQHI',color=c('#174c83', '#7eb6d4', '#efefeb', '#efa759', '#9b4d16'))

