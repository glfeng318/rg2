HTMLWidgets.widget({
  name: "g2percent_stacked_bar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.PercentStackedBar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
