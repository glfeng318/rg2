HTMLWidgets.widget({
  name: "g2",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        switch (x.type) {
          case 'bar':
            chart = new G2Plot.Bar(el.id, x.cfg);
            break;
          case 'line':
            chart = new G2Plot.Line(el.id, x.cfg);
            break;
          case 'step_line':
            chart = new G2Plot.StepLine(el.id, x.cfg);
            break;
          case 'treemap':
            chart = new G2Plot.Treemap(el.id, x.cfg);
            break;
          case 'bar':
            chart = new G2Plot.Bar(el.id, x.cfg);
            break;
          case 'stacked_bar':
            chart = new G2Plot.StackedBar(el.id, x.cfg);
            break;
          case 'grouped_bar':
            chart = new G2Plot.GroupedBar(el.id, x.cfg);
            break;
          case 'percent_stacked_bar':
            chart = new G2Plot.PercentStackedBar(el.id, x.cfg);
            break;
          case 'range_bar':
            chart = new G2Plot.RangeBar(el.id, x.cfg);
            break;
          case 'area':
            chart = new G2Plot.Area(el.id, x.cfg);
            break;
          case 'stacked_area':
            chart = new G2Plot.StackedArea(el.id, x.cfg);
            break;
          case 'percent_stacked_area':
            chart = new G2Plot.PercentStackedArea(el.id, x.cfg);
            break;
          case 'column':
            chart = new G2Plot.Column(el.id, x.cfg);
            break;
          case 'column_label':
            chart = new G2Plot.ColumnLabel(el.id, x.cfg);
            break;
          case 'grouped_column':
            chart = new G2Plot.GroupedColumn(el.id, x.cfg);
            break;
          case 'stacked_column':
            chart = new G2Plot.StackedColumn(el.id, x.cfg);
            break;
          case 'stacked_column_label':
            chart = new G2Plot.StackedColumnLabel(el.id, x.cfg);
            break;
          case 'range_column':
            chart = new G2Plot.RangeColumn(el.id, x.cfg);
            break;
          case 'percent_stacked_column':
            chart = new G2Plot.PercentStackedColumn(el.id, x.cfg);
            break;
          case 'pie':
            chart = new G2Plot.Pie(el.id, x.cfg);
            break;
          case 'density_heatmap':
            chart = new G2Plot.DensityHeatmap(el.id, x.cfg);
            break;
          case 'heatmap':
            chart = new G2Plot.Heatmap(el.id, x.cfg);
            break;
          case 'word_cloud':
            chart = new G2Plot.WordCloud(el.id, x.cfg);
            break;
          case 'rose':
            chart = new G2Plot.Rose(el.id, x.cfg);
            break;
          case 'funnel':
            chart = new G2Plot.Funnel(el.id, x.cfg);
            break;
          case 'stacked_rose':
            chart = new G2Plot.StackedRose(el.id, x.cfg);
            break;
          case 'grouped_rose':
            chart = new G2Plot.GroupedRose(el.id, x.cfg);
            break;
          case 'radar':
            chart = new G2Plot.Radar(el.id, x.cfg);
            break;
          case 'liquid':
            chart = new G2Plot.Liquid(el.id, x.cfg);
            break;
          case 'histogram':
            chart = new G2Plot.Histogram(el.id, x.cfg);
            break;
          case 'density':
            chart = new G2Plot.Density(el.id, x.cfg);
            break;
          case 'donut':
            chart = new G2Plot.Donut(el.id, x.cfg);
            break;
          case 'waterfall':
            chart = new G2Plot.Waterfall(el.id, x.cfg);
            break;
          case 'scatter':
            chart = new G2Plot.Scatter(el.id, x.cfg);
            break;
          case 'bubble':
            chart = new G2Plot.Bubble(el.id, x.cfg);
            break;
          case 'bullet':
            chart = new G2Plot.Bullet(el.id, x.cfg);
            break;
          case 'calendar':
            chart = new G2Plot.Calendar(el.id, x.cfg);
            break;
          case 'gauge':
            chart = new G2Plot.Gauge(el.id, x.cfg);
            break;
          case 'fan_gauge':
            chart = new G2Plot.FanGauge(el.id, x.cfg);
            break;
          case 'meter_gauge':
            chart = new G2Plot.MeterGauge(el.id, x.cfg);
            break;
          default:
            // code
        }
        chart.render();
      }
    };
  }
});
