HTMLWidgets.widget({
  name: "g2bubble",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Bubble(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
