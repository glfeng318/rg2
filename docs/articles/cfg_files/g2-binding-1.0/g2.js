HTMLWidgets.widget({
  name: "g2",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        $(el).empty();  // clear out the previous chart, fixed #3
        switch (x.type) {
          case 'Bar':
            chart = new G2Plot.Bar(el.id, x.cfg);
            break;
          case 'Line':
            chart = new G2Plot.Line(el.id, x.cfg);
            break;
          case 'Treemap':
            chart = new G2Plot.Treemap(el.id, x.cfg);
            break;
          case 'GroupedBar':
            chart = new G2Plot.GroupedBar(el.id, x.cfg);
            break;
          case 'Area':
            chart = new G2Plot.Area(el.id, x.cfg);
            break;
          case 'Column':
            chart = new G2Plot.Column(el.id, x.cfg);
            break;
          case 'StackedColumnLabel':
            chart = new G2Plot.StackedColumnLabel(el.id, x.cfg);
            break;
          case 'Pie':
            chart = new G2Plot.Pie(el.id, x.cfg);
            break;
          case 'DensityHeatmap':
            chart = new G2Plot.DensityHeatmap(el.id, x.cfg);
            break;
          case 'Heatmap':
            chart = new G2Plot.Heatmap(el.id, x.cfg);
            break;
          case 'WordCloud':
            chart = new G2Plot.WordCloud(el.id, x.cfg);
            break;
          case 'Rose':
            chart = new G2Plot.Rose(el.id, x.cfg);
            break;
          case 'Funnel':
            chart = new G2Plot.Funnel(el.id, x.cfg);
            break;
          case 'StackedRose':
            chart = new G2Plot.StackedRose(el.id, x.cfg);
            break;
          case 'GroupedRose':
            chart = new G2Plot.GroupedRose(el.id, x.cfg);
            break;
          case 'Radar':
            chart = new G2Plot.Radar(el.id, x.cfg);
            break;
          case 'Liquid':
            chart = new G2Plot.Liquid(el.id, x.cfg);
            break;
          case 'Histogram':
            chart = new G2Plot.Histogram(el.id, x.cfg);
            break;
          case 'Density':
            chart = new G2Plot.Density(el.id, x.cfg);
            break;
          case 'Waterfall':
            chart = new G2Plot.Waterfall(el.id, x.cfg);
            break;
          case 'Scatter':
            chart = new G2Plot.Scatter(el.id, x.cfg);
            break;
          case 'Bullet':
            chart = new G2Plot.Bullet(el.id, x.cfg);
            break;
          case 'Calendar':
            chart = new G2Plot.Calendar(el.id, x.cfg);
            break;
          case 'Gauge':
            chart = new G2Plot.Gauge(el.id, x.cfg);
            break;
          case 'FanGauge':
            chart = new G2Plot.FanGauge(el.id, x.cfg);
            break;
          case 'MeterGauge':
            chart = new G2Plot.MeterGauge(el.id, x.cfg);
            break;
          // mini chart (5)
          case 'TinyArea':
            chart = new G2Plot.TinyArea(el.id, x.cfg);
            break;
          case 'TinyColumn':
            chart = new G2Plot.TinyColumn(el.id, x.cfg);
            break;
          case 'TinyLine':
            chart = new G2Plot.TinyLine(el.id, x.cfg);
            break;
          case 'Progress':
            chart = new G2Plot.Progress(el.id, x.cfg);
            break;
          case 'RingProgress':
            chart = new G2Plot.RingProgress(el.id, x.cfg);
            break;
          case 'DualAxes':
            chart = new G2Plot.DualAxes(el.id, x.cfg);
            break;
          case 'Sunburst':
            chart = new G2Plot.Sunburst(el.id, x.cfg);
            break;
          case 'Stock':
            chart = new G2Plot.Stock(el.id, x.cfg)
            break;
          case 'Box':
            chart = new G2Plot.Box(el.id, x.cfg)
            break;
          case 'RadialBar':
            chart = new G2Plot.RadialBar(el.id, x.cfg)
            break;
          case 'BidirectionalBar':
            chart = new G2Plot.BidirectionalBar(el.id, x.cfg)
            break;
          case 'Sankey':
            chart = new G2Plot.Sankey(el.id, x.cfg)
            break;
          case 'MultiView':
            chart = new G2Plot.MultiView(el.id, x.cfg)
            break;
          default:
            // code
            break;
        }
        // global cfg
        if (x.cfg.reflect) {
          chart.chart.coordinate().reflect(x.cfg.reflect);
        }
        console.log(x.cfg);
        console.log(chart);
        window.cfg = x.cfg;
        window.chart = chart;
        chart.render();
      }
    };
  }
});
