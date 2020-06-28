HTMLWidgets.widget({
  name: "g2range_column",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.RangeColumn(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
