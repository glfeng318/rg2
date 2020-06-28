HTMLWidgets.widget({
  name: "g2column",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Column(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
