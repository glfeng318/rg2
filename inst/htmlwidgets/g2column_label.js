HTMLWidgets.widget({
  name: "g2column_label",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.ColumnLabel(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
