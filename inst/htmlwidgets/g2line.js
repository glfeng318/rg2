HTMLWidgets.widget({
  name: "g2line",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Line(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
