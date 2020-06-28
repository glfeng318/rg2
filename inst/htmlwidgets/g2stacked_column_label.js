HTMLWidgets.widget({
  name: "g2stacked_column_label",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StackedColumnLabel(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
