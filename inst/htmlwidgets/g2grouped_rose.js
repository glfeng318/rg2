HTMLWidgets.widget({
  name: "g2grouped_rose",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.GroupedRose(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
