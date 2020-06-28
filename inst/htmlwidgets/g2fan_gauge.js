HTMLWidgets.widget({
  name: "g2fan_gauge",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.FanGauge(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
