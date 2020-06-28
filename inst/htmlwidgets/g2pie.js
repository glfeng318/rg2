HTMLWidgets.widget({
  name: "g2pie",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.Pie(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
