HTMLWidgets.widget({
  name: "g2meter_gauge",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.MeterGauge(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
