HTMLWidgets.widget({
  name: "g2donut",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Donut(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
