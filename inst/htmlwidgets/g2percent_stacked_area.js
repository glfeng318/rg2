HTMLWidgets.widget({
  name: "g2percent_stacked_area",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.PercentStackedArea(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
