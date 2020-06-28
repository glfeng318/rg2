HTMLWidgets.widget({
  name: "g2liquid",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Liquid(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
