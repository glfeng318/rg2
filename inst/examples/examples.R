library(rg2)
library(dplyr)

data("economics", package="ggplot2")
data("economics_long", package="ggplot2")
g2Line(economics,date,uempmed)
readline("next <return>:")

df_tmp = economics_long %>% filter(variable %in% c('psavert','uempmed'))
g2Line(df_tmp,'date','value','variable')
readline("next <return>:")

g2Line(df_tmp,'date','value','variable',cfg=list(theme='dark'))
readline("next <return>:")

# bullet
df = tibble(
  title = c('A','B','C','D'),
  measures = c(83,13,45,83),
  targets = c(90,90,90,90),
  ranges = rep(list(ranges = c(0,0.25,0.5,0.75,1)),4)
) %>% mutate_at(all_of(c('measures','targets','ranges')), as.list)
g2Bullet(df, 
         rangeMax = 100,
         cfg=list(title=list(visible=TRUE,text='Bullet chart'),
                  rangeColors=c('#F8DA41','#F3C173','#EE8C51','#E0605A')))
readline("next <return>:")

# density
df = data.frame(x=rnorm(1000, mean = 50, sd=5))
g2Density(df, x, binWidth = 2)
readline("next <return>:")

# Histogram
df = data.frame(x=rnorm(1000, mean = 50, sd=5))
g2Histogram(df, x, binWidth = 2)
readline("next <return>:")

# DensityHeatmap
df = jsonlite::read_json('https://antv-g2plot.gitee.io/zh/examples/data/jobpaying.json',TRUE)
g2DensityHeatmap(df, 'prob', 'Average annual wage', 'numbEmployed')
readline("next <return>:")

g2DensityHeatmap(df, 'prob', 'Average annual wage', 'numbEmployed', 
                 radius=15,
                 color=c('#295599', '#3e94c0', '#78c6d0', '#b4d9e4', '#fffef0', '#f9cdac', '#ec7d92', '#bc448c'))
readline("next <return>:")

# Donut
df = jsonlite::fromJSON('[
 {"type": "分类一","value": 27},
 {"type": "分类二","value": 25},
 {"type": "分类三","value": 18}]')
g2Donut(df, value, type)
readline("next <return>:")

g2Donut(df, value, type, color=c('#8AD8D3','#02BABC','#FF5D30'))
readline("next <return>:")

g2Donut(df, value, type, 
        color=htmlwidgets::JS("(color)=>{if(color==='分类一'){return '#FF5D30';} else {return '#02BABC';}}"))
readline("next <return>:")

g2Pie(df, value, type)
readline("next <return>:")

g2Pie(df, value, type, 
      color=htmlwidgets::JS("(color)=>{if(color==='分类一'){return '#FF5D30';} else {return '#02BABC';}}"))
readline("next <return>:")

# Gauge
cfg = list(statistic=list(visible=TRUE,text='Good',color='#43E089'))
g2Gauge(50, range = c(0,25,75,100), min=0, max=100)
readline("next <return>:")

g2Gauge(50, range = c(  25,75,100), min=0, max=100)
readline("next <return>:")

g2Gauge(50, range = c(  25,75,100), min=0, max=100, cfg=cfg)
readline("next <return>:")

# MeterGauge
g2MeterGauge(50, range = c(0,25,75,100), min=0, max=100)
readline("next <return>:")

g2MeterGauge(50, range = c(  25,75,100), min=0, max=100)
readline("next <return>:")

g2MeterGauge(50, range = c(  25,75,100), min=0, max=100, cfg=cfg)
readline("next <return>:")

# FanGauge
g2FanGauge(value=0.8, range = c(0, 0.8))
readline("next <return>:")

g2FanGauge(value=0.35, range=c(0, 0.35))
readline("next <return>:")

g2FanGauge(value=0.35, range=c(0, 0.35), cfg=cfg)
readline("next <return>:")

cfg = list(statistic=list(visible=TRUE,text='Good',color='#43E089'),
           format=htmlwidgets::JS("(v) => {return v + '%';}"))
g2FanGauge(value=35, range=c(0, 75), min=0, max=100,  cfg=cfg)
readline("next <return>:")


df = jsonlite::fromJSON('[
{ "action": "浏览", "pv": 5000 },
{ "action": "加购", "pv": 3500 },
{ "action": "下单", "pv": 2500 },
{ "action": "支付", "pv": 1500 },
{ "action": "成交", "pv": 850 }]')

# Bar
g2Bar(df, pv, action)
readline("next <return>:")

g2Bar(df, pv, action, cfg = list(conversionTag=list(visible=TRUE)))
readline("next <return>:")

#Funnel
g2Funnel(df, action, pv)
readline("next <return>:")

g2Funnel(df, action, pv, dynamicHeight = TRUE)
readline("next <return>:")

g2Funnel(df, action, pv, transpose = TRUE)
readline("next <return>:")

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
readline("next <return>:")

#GroupedBar
g2GroupedBar(df, pv, action, quarter)
readline("next <return>:")

g2GroupedBar(df, pv, action, quarter, 
             cfg=list(legend=list(visible=TRUE,position='bottom-center')))
readline("next <return>:")

#GroupedColumn
g2GroupedColumn(df, action, pv, quarter)
readline("next <return>:")


g2GroupedColumn(df, action, pv, quarter, 
             cfg=list(legend=list(visible=TRUE,position='top-right')))
readline("next <return>:")

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
readline("next <return>:")

g2StackedRose(df, value, type, user)
readline("next <return>:")

g2GroupedRose(df, value, type, user)
readline("next <return>:")

# Heatmap
data_url = 'https://gw.alipayobjects.com/os/basement_prod/a719cd4e-bd40-4878-a4b4-df8a6b531dfe.json'
jsonlite::read_json(data_url, TRUE) %>% 
  mutate(AQHI = as.numeric(AQHI)) %>% 
  g2Heatmap('Month of Year', 'District', colorField = 'AQHI',color=c('#174c83', '#7eb6d4', '#efefeb', '#efa759', '#9b4d16'))
readline("next <return>:")

# Scatter
mtcars %>% 
  mutate(vs=as.character(vs)) %>% 
  g2Scatter(mpg, disp, vs)
readline("next <return>:")

# Line
url = 'https://antv-g2plot.gitee.io/zh/examples/data/fireworks-sales.json'
df = jsonlite::read_json(url, TRUE)
df %>% g2Line(Date, scales)
readline("next <return>:")

df %>% g2Line(Date, scales, smooth = TRUE)
readline("next <return>:")

df %>% g2Line(Date, scales, point = TRUE)
readline("next <return>:")

df %>% g2Line(Date, scales, smooth = TRUE, point = TRUE)
readline("next <return>:")

# Liquid
g2Liquid(75, 0, 100)
readline("next <return>:")

g2Liquid(75, 0, 100, color='red')
readline("next <return>:")

cfg = list(statistic=list(formatter=htmlwidgets::JS('(v) => (v).toFixed(2) + "%"')))
g2Liquid(85.56, 0, 100, cfg = cfg)
readline("next <return>:")

# Area
url = 'https://antv-g2plot.gitee.io/zh/examples/data/oil.json'
df = jsonlite::read_json(url, TRUE)
g2Area(df, date, value, country)
readline("next <return>:")

g2Area(df, date, value, country, color = c('#6897a7', '#8bc0d6', '#60d7a7', '#dedede', '#fedca9', '#fab36f', '#d96d6f'))
readline("next <return>:")

g2StackedArea(df, date, value, country)
readline("next <return>:")

g2StackedArea(df, date, value, country, smooth = TRUE)
readline("next <return>:")

g2StackedArea(df, date, value, country, label = 'area')
readline("next <return>:")

g2StackedArea(df, date, value, country, label = 'line')
readline("next <return>:")

g2StackedArea(df, date, value, country, 
              label = 'line',
              color = c('#6897a7', '#8bc0d6', '#60d7a7', '#dedede', '#fedca9', '#fab36f', '#d96d6f'))
readline("next <return>:")

g2PercentStackedArea(df, date, value, country)
readline("next <return>:")

g2PercentStackedArea(df, date, value, country, smooth = TRUE)
readline("next <return>:")

g2PercentStackedArea(df, date, value, country, label = 'area')
readline("next <return>:")

g2PercentStackedArea(df, date, value, country, label = 'line')
readline("next <return>:")

g2PercentStackedArea(df, date, value, country, 
                     label = 'line',
                     color = c('#6897a7', '#8bc0d6', '#60d7a7', '#dedede', '#fedca9', '#fab36f', '#d96d6f'))
readline("next <return>:")

# Radar
df = jsonlite::fromJSON('[
  { "action": "a", "pv": 50000, "quarter": "2020Q1" },
  { "action": "b", "pv": 35000, "quarter": "2020Q1" },
  { "action": "c", "pv": 25000, "quarter": "2020Q1" },
  { "action": "d", "pv": 15000, "quarter": "2020Q1" },
  { "action": "e", "pv": 11500, "quarter": "2020Q1" },
  { "action": "a", "pv": 80000, "quarter": "2020Q2" },
  { "action": "b", "pv": 63000, "quarter": "2020Q2" },
  { "action": "c", "pv": 47000, "quarter": "2020Q2" },
  { "action": "d", "pv": 24000, "quarter": "2020Q2" },
  { "action": "e", "pv": 17500, "quarter": "2020Q2" }
]')
df %>% 
  filter(quarter=='2020Q1') %>% 
  g2Radar(action, pv)
readline("next <return>:")

g2Radar(df, action, pv, quarter)
readline("next <return>:")

# WordCloud
url = 'https://antv-g2plot.gitee.io/zh/examples/data/word-cloud.json'
df = jsonlite::read_json(url, TRUE) %>%
  rename(word=name, weight=value) %>% 
  mutate(id=1:nrow(.))
g2WordCloud(df)
readline("next <return>:")

g2WordCloud(df, 'https://gw.alipayobjects.com/mdn/rms_2274c3/afts/img/A*07tdTIOmvlYAAAAAAAAAAABkARQnAQ')
readline("next <return>:")

# Waterfall
df = jsonlite::fromJSON('[
{"type": "日用品", "money": 120},
{"type": "伙食费", "money": 900},
{"type": "交通费", "money": 200},
{"type": "水电费", "money": 300},
{"type": "房租", "money": 1200},
{"type": "商场消费", "money": 1000},
{"type": "应酬红包", "money": -2000}]')

g2Waterfall(df, type, money)
readline("next <return>:")

g2Waterfall(df, type, money, color='#6897a7')
readline("next <return>:")

g2Waterfall(df, type, money, 
            color=list(rising='#60d7a7', falling='#dedede', total='#fedca9'))
readline("next <return>:")

# StepLine
url = 'https://antv-g2plot.gitee.io/zh/examples/data/fireworks-sales.json'
df = jsonlite::read_json(url, TRUE)
g2StepLine(df, Date, scales)
readline("next <return>:")

url = 'https://antv-g2plot.gitee.io/zh/examples/data/sales.json'
df = jsonlite::read_json(url, TRUE)
g2StepLine(df, 城市,销售额)
readline("next <return>:")

g2StepLine(df, 城市,销售额, interaction='slider')
readline("next <return>:")

g2StepLine(df, 城市,销售额, interaction='scrollbar')
readline("next <return>:")

# RangeBar / RangeColumn
df = data.frame(
  cate = paste0('cate-', 1:8),
  value = I(list(c(76, 100),c(56, 108),c(38, 129),c(58, 155),
            c(45, 120),c(23, 99),c(18, 56),c(18, 34)))
)
g2RangeBar(df, value, cate)
readline("next <return>:")

g2RangeBar(df, value, cate, barSize = 10)
readline("next <return>:")

g2RangeBar(df, value, cate, color = 'l(0) 0:#3e5bdb 1:#dd3121')
readline("next <return>:")

g2RangeColumn(df, cate, value)
readline("next <return>:")

g2RangeColumn(df, cate, value, columnSize = 10)
readline("next <return>:")

g2RangeColumn(df, cate, value, color = 'l(90) 0:#3e5bdb 1:#dd3121')
readline("next <return>:")

# StackedBar / PercentStackedBar
df = jsonlite::fromJSON('[
  {"region": "华东","cate": "公司","sales": 1454715.807999998},
  {"region": "华东","cate": "消费者","sales": 2287358.261999998},
  {"region": "中南","cate": "公司","sales": 1335665.3239999984},
  {"region": "中南","cate": "消费者","sales": 2057936.7620000008},
  {"region": "东北","cate": "公司","sales": 834842.827},
  {"region": "东北","cate": "消费者","sales": 1323985.6069999991},
  {"region": "华北","cate": "公司","sales": 804769.4689999995},
  {"region": "华北","cate": "消费者","sales": 1220430.5610000012},
  {"region": "西南","cate": "公司","sales": 469341.684},
  {"region": "西南","cate": "消费者","sales": 677302.8919999995},
  {"region": "西北","cate": "公司","sales": 253458.1840000001},
  {"region": "西北","cate": "消费者","sales": 458058.1039999998}
]')
g2StackedBar(df, sales, region, cate)
readline("next <return>:")

g2StackedBar(df, sales, region, cate, 
             cfg = list(label=list(visible=TRUE,
                                   formatter=htmlwidgets::JS("(v) => Math.round(v / 10000) + '万'"))))
readline("next <return>:")

g2PercentStackedBar (df, sales, region, cate)
readline("next <return>:")

g2PercentStackedBar (df, sales, region, cate, cfg = list(label=list(position='middle')))
readline("next <return>:")

# StackedColumn / PercentStackedColumn
df = jsonlite::fromJSON('[
  { "year": "2006", "type": "redDeliciou", "value": 10 },
  { "year": "2006", "type": "mcintosh", "value": 15 },
  { "year": "2006", "type": "oranges", "value": 9 },
  { "year": "2006", "type": "pears", "value": 6 },
  { "year": "2007", "type": "redDeliciou", "value": 12 },
  { "year": "2007", "type": "mcintosh", "value": 18 },
  { "year": "2007", "type": "oranges", "value": 9 },
  { "year": "2007", "type": "pears", "value": 4 },
  { "year": "2008", "type": "redDeliciou", "value": 5 },
  { "year": "2008", "type": "mcintosh", "value": 20 },
  { "year": "2008", "type": "oranges", "value": 8 },
  { "year": "2008", "type": "pears", "value": 2 },
  { "year": "2009", "type": "redDeliciou", "value": 1 },
  { "year": "2009", "type": "mcintosh", "value": 15 },
  { "year": "2009", "type": "oranges", "value": 5 },
  { "year": "2009", "type": "pears", "value": 4 },
  { "year": "2010", "type": "redDeliciou", "value": 2 },
  { "year": "2010", "type": "mcintosh", "value": 10 },
  { "year": "2010", "type": "oranges", "value": 4 },
  { "year": "2010", "type": "pears", "value": 2 },
  { "year": "2011", "type": "redDeliciou", "value": 3 },
  { "year": "2011", "type": "mcintosh", "value": 12 },
  { "year": "2011", "type": "oranges", "value": 6 },
  { "year": "2011", "type": "pears", "value": 3 },
  { "year": "2012", "type": "redDeliciou", "value": 4 },
  { "year": "2012", "type": "mcintosh", "value": 15 },
  { "year": "2012", "type": "oranges", "value": 8 },
  { "year": "2012", "type": "pears", "value": 1 },
  { "year": "2013", "type": "redDeliciou", "value": 6 },
  { "year": "2013", "type": "mcintosh", "value": 11 },
  { "year": "2013", "type": "oranges", "value": 9 },
  { "year": "2013", "type": "pears", "value": 4 },
  { "year": "2014", "type": "redDeliciou", "value": 10 },
  { "year": "2014", "type": "mcintosh", "value": 13 },
  { "year": "2014", "type": "oranges", "value": 9 },
  { "year": "2014", "type": "pears", "value": 5 }
]')
g2StackedColumn(df, year, value, type)
readline("next <return>:")

g2StackedColumn(df, year, value, 'type', color = c('#ae331b', '#f27957', '#dadada', '#609db7', '#1a6179'))
readline("next <return>:")

g2StackedColumn(df, year, value, type, connectedArea = TRUE)
readline("next <return>:")

g2PercentStackedColumn(df, year, value, type)
readline("next <return>:")

g2PercentStackedColumn(df, year, value, 'type', color = c('#ae331b', '#f27957', '#dadada', '#609db7', '#1a6179'))
readline("next <return>:")

g2PercentStackedColumn(df, year, value, type, connectedArea = TRUE)
readline("next <return>:")

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
g2Treemap(df)

cat("There's more coming next release.")

