HTMLWidgets.widget({
  name: "g2funnel",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Funnel(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
