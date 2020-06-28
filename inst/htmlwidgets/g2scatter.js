HTMLWidgets.widget({
  name: "g2scatter",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Scatter(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
