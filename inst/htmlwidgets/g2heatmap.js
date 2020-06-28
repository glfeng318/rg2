HTMLWidgets.widget({
  name: "g2heatmap",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Heatmap(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
