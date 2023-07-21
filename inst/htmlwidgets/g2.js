HTMLWidgets.widget({
  name: "g2",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        $(el).empty();  // clear out the previous chart, fixed #3
        // https://g2plot.antv.antgroup.com/api/plot-api
        switch (x.type) {
          // Line 折线图
          // StepLine -> Line
          case 'Line':
            chart = new G2Plot.Line(el.id, x.cfg);
            break;
          // Area 面积图
          // StackedArea/PercentStackedArea -> Area, 去掉 stackField, 改用 seriesField以及增加isPercent: true
          case 'Area':
            chart = new G2Plot.Area(el.id, x.cfg);
            break;
          // Column 柱状图
          // StackedColumn/GroupedColumn/PercentStackedColumn/RangeColumn -> Column, add isStack/isGroup/isRange/seriesField
          case 'Column':
            chart = new G2Plot.Column(el.id, x.cfg);
            break;
          // Bar 条形图
          // StackedBar/PercentStackedBar/RangeBar -> Bar, add isGroup/isStack/isPercent/isRange
          case 'Bar':
            chart = new G2Plot.Bar(el.id, x.cfg);
            break;
          // Pie 饼图
          // Donut -> Pie
          case 'Pie':
            chart = new G2Plot.Pie(el.id, x.cfg);
            break;
          // Scatter 散点图
          // Bubble -> Scatter
          case 'Scatter':
            chart = new G2Plot.Scatter(el.id, x.cfg);
            break;
          // Gauge 仪表盘
          // MeterGauge/FanGauge
          case 'Gauge':
            chart = new G2Plot.Gauge(el.id, x.cfg);
            break;
          // DualAxes 双轴图
          // DualLine/ColumnLine/StackedColumnLine/GroupedColumnLine -> DualAxes
          case 'DualAxes':
            chart = new G2Plot.DualAxes(el.id, x.cfg);
            break;
          // Liquid 水波图
          case 'Liquid':
            chart = new G2Plot.Liquid(el.id, x.cfg);
            break;
          // Radar 雷达图
          case 'Radar':
            chart = new G2Plot.Radar(el.id, x.cfg);
            break;
          // WordCloud 词云图
          case 'WordCloud':
            chart = new G2Plot.WordCloud(el.id, x.cfg);
            break;
          // Funnel 漏斗图
          case 'Funnel':
            chart = new G2Plot.Funnel(el.id, x.cfg);
            break;
          // Bullet 子弹图
          case 'Bullet':
            chart = new G2Plot.Bullet(el.id, x.cfg);
            break;
          // Histogram 直方图
          case 'Histogram':
            chart = new G2Plot.Histogram(el.id, x.cfg);
            break;
          // Venn 韦恩图
          case 'Venn':
            chart = new G2Plot.Venn(el.id, x.cfg);
            break;
          // Rose 玫瑰图
          // StackedRose/isGroup -> Rose, add isStack/isGroup/seriesField cfg
          case 'Rose':
            chart = new G2Plot.Rose(el.id, x.cfg);
            break;
          // TinyLine 迷你折线图
          case 'TinyLine':
            chart = new G2Plot.TinyLine(el.id, x.cfg);
            break;
          // TinyArea 迷你面积图
          case 'TinyArea':
            chart = new G2Plot.TinyArea(el.id, x.cfg);
            break;
          // TinyColumn 迷你柱形图
          case 'TinyColumn':
            chart = new G2Plot.TinyColumn(el.id, x.cfg);
            break;
          // Sunburst 旭日图
          case 'Sunburst':
            chart = new G2Plot.Sunburst(el.id, x.cfg);
            break;
          // Stock 股票图
          case 'Stock':
            chart = new G2Plot.Stock(el.id, x.cfg)
            break;
          // RingProgress 进度环图
          case 'RingProgress':
            chart = new G2Plot.RingProgress(el.id, x.cfg);
            break;
          // Progress 进度条图
          case 'Progress':
            chart = new G2Plot.Progress(el.id, x.cfg);
            break;
          // Box 箱型图
          case 'Box':
            chart = new G2Plot.Box(el.id, x.cfg)
            break;
          // Heatmap 热力图
          // Calendar/DensityHeatmap -> Heatmap, type: 'density'
          case 'Heatmap':
            chart = new G2Plot.Heatmap(el.id, x.cfg);
            break;
          // Waterfall 瀑布图
          case 'Waterfall':
            chart = new G2Plot.Waterfall(el.id, x.cfg);
            break;
          // RadialBar 玉珏图
          case 'RadialBar':
            chart = new G2Plot.RadialBar(el.id, x.cfg)
            break;
          // BidirectionalBar 对称条形图
          case 'BidirectionalBar':
            chart = new G2Plot.BidirectionalBar(el.id, x.cfg)
            break;
          // Sankey 桑基图
          case 'Sankey':
            chart = new G2Plot.Sankey(el.id, x.cfg)
            break;
          // Treemap 矩阵树图
          case 'Treemap':
            chart = new G2Plot.Treemap(el.id, x.cfg);
            break;
          // violin 小提琴图
          case 'Violin':
            chart = new G2Plot.Violin(el.id, x.cfg);
            break;
          // Circle packing
          case 'CirclePacking':
            chart = new G2Plot.CirclePacking(el.id, x.cfg);
            break;
          // Mix 多图层图表
          // MultiView
          case 'Mix':
            chart = new G2Plot.Mix(el.id, x.cfg);
            break;
          // Facet 分面图
          case 'Facet':
            chart = new G2Plot.Facet(el.id, x.cfg);
            break;
          default:
            // code
            break;
        }
        // global cfg
        if (x.cfg.reflect) {
          chart.chart.coordinate().reflect(x.cfg.reflect);
        }
        chart.render();
      }
    };
  }
});
