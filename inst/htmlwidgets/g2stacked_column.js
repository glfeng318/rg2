HTMLWidgets.widget({
  name: "g2stacked_column",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StackedColumn(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
