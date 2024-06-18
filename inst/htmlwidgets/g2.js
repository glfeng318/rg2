HTMLWidgets.widget({

  name: "g2",

  type: "output",

  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        el.innerHTML="";  // clear out the previous chart, fixed #3
        // create chart object and bind it to the element
        chart = new G2.Chart({container: el.id, autoFit: true});
        chart.options(x.opt);
        chart.render();
      },

      resize: function(width, height) {
        chart.render();
      },

      // Make the G2 object available as a property on the widget
      // instance we're returning from factory().
      s: chart
    };
  }
});
