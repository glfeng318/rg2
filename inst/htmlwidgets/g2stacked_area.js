HTMLWidgets.widget({
  name: "g2stacked_area",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StackedArea(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
