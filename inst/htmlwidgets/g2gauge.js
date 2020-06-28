HTMLWidgets.widget({
  name: "g2gauge",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Gauge(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
