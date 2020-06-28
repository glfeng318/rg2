HTMLWidgets.widget({
  name: "g2treemap",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Treemap(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
