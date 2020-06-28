HTMLWidgets.widget({
  name: "g2radar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Radar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
