HTMLWidgets.widget({
  name: "g2rose",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Rose(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
