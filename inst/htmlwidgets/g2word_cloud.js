HTMLWidgets.widget({
  name: "g2word_cloud",
  type: "output",
  factory: function(el, width, height) {
    var chart;
    return {
      renderValue: function(x) {
        chart = new G2Plot.WordCloud(el.id, x.cfg);
        chart.render();
      }
    };
  }
});
