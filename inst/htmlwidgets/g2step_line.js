HTMLWidgets.widget({
  name: "g2step_line",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.StepLine(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
