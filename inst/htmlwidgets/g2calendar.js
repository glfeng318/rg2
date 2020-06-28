HTMLWidgets.widget({
  name: "g2calendar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Calendar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
