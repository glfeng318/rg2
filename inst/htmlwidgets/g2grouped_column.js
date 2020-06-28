HTMLWidgets.widget({
  name: "g2grouped_column",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.GroupedColumn(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
