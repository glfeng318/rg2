HTMLWidgets.widget({
  name: "g2range_bar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.RangeBar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
