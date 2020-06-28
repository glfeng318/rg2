HTMLWidgets.widget({
  name: "g2stacked_bar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StackedBar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
