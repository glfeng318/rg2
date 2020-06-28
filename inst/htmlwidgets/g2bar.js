HTMLWidgets.widget({
  name: "g2bar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Bar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
