HTMLWidgets.widget({
  name: "g2stacked_rose",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StackedRose(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
