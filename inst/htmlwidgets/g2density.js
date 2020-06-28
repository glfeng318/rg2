HTMLWidgets.widget({
  name: "g2density",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Density(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
