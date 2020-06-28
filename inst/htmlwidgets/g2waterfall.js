HTMLWidgets.widget({
  name: "g2waterfall",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Waterfall(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
