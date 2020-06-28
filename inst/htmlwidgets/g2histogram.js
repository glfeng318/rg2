HTMLWidgets.widget({
  name: "g2histogram",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Histogram(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
