HTMLWidgets.widget({
  name: "g2density_heatmap",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.DensityHeatmap(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
