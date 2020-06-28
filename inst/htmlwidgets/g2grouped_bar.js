HTMLWidgets.widget({
  name: "g2grouped_bar",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.GroupedBar(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
