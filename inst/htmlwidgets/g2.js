HTMLWidgets.widget({
  name: "g2",
  type: "output",
  factory: function(el, width, height) {
    /**/
    G2Plot.G2.registerInteraction('element-link', {
      start: [{trigger: 'interval:mouseenter', action: 'element-link-by-color:link'}],
      end: [{trigger: 'interval:mouseleave', action: 'element-link-by-color:unlink'}]
    });
    G2Plot.G2.registerShape('polygon', 'boundary-polygon', {
      draw(cfg, container) {
        const group = container.addGroup();
        const attrs = {
          stroke: '#fff',
          lineWidth: 1,
          fill: cfg.color,
          paht: [],
        };
        const points = cfg.points;
        const path = [
          ['M', points[0].x, points[0].y],
          ['L', points[1].x, points[1].y],
          ['L', points[2].x, points[2].y],
          ['L', points[3].x, points[3].y],
          ['Z'],
        ];
        // @ts-ignore
        attrs.path = this.parsePath(path);
        group.addShape('path', {
          attrs,
        });

        if (cfg.data.lastWeek) {
          const linePath = [
            ['M', points[2].x, points[2].y],
            ['L', points[3].x, points[3].y],
          ];
          // add right border to the last week
          group.addShape('path', {
            attrs: {
              path: this.parsePath(linePath),
              lineWidth: 4,
              stroke: '#404040',
            },
          });
          if (cfg.data.lastDay) {
            group.addShape('path', {
              attrs: {
                path: this.parsePath([
                  ['M', points[1].x, points[1].y],
                  ['L', points[2].x, points[2].y],
                ]),
                lineWidth: 4,
                stroke: '#404040',
              },
            });
          }
        }
        return group;
      },
    });

    G2Plot.G2.registerShape('point', 'breath-point', {
      draw(cfg, container) {
        const data = cfg.data;
        const point = { x: cfg.x, y: cfg.y };
        const group = container.addGroup();
        if (data.time === '14.20' && data.date === 'today') {
          const decorator1 = group.addShape('circle', {
            attrs: {
              x: point.x,
              y: point.y,
              r: 10,
              fill: cfg.color,
              opacity: 0.5,
            },
          });
          const decorator2 = group.addShape('circle', {
            attrs: {
              x: point.x,
              y: point.y,
              r: 10,
              fill: cfg.color,
              opacity: 0.5,
            },
          });
          const decorator3 = group.addShape('circle', {
            attrs: {
              x: point.x,
              y: point.y,
              r: 10,
              fill: cfg.color,
              opacity: 0.5,
            },
          });
          decorator1.animate(
            {
              r: 20,
              opacity: 0,
            },
            {
              duration: 1800,
              easing: 'easeLinear',
              repeat: true,
            }
          );
          decorator2.animate(
            {
              r: 20,
              opacity: 0,
            },
            {
              duration: 1800,
              easing: 'easeLinear',
              repeat: true,
              delay: 600,
            }
          );
          decorator3.animate(
            {
              r: 20,
              opacity: 0,
            },
            {
              duration: 1800,
              easing: 'easeLinear',
              repeat: true,
              delay: 1200,
            }
          );
          group.addShape('circle', {
            attrs: {
              x: point.x,
              y: point.y,
              r: 6,
              fill: cfg.color,
              opacity: 0.7,
            },
          });
          group.addShape('circle', {
            attrs: {
              x: point.x,
              y: point.y,
              r: 1.5,
              fill: cfg.color,
            },
          });
        }

        return group;
      },
    });
    /**/
    var chart;
    return {
      renderValue: function(x) {
        $(el).empty();  // clear out the previous chart, fixed #3
        // https://g2plot.antv.antgroup.com/api/plot-api
        switch (x.chart.toLowerCase()) {
          case 'line':
            chart = new G2Plot.Line(el.id, x.cfg);
            break;
          case 'area':
            chart = new G2Plot.Area(el.id, x.cfg);
            break;
          case 'column':
            chart = new G2Plot.Column(el.id, x.cfg);
            break;
          case 'bar':
            chart = new G2Plot.Bar(el.id, x.cfg);
            break;
          case 'pie':
            chart = new G2Plot.Pie(el.id, x.cfg);
            break;
          case 'scatter':
            chart = new G2Plot.Scatter(el.id, x.cfg);
            break;
          case 'gauge':
            chart = new G2Plot.Gauge(el.id, x.cfg);
            break;
          case 'dual-axes':
            chart = new G2Plot.DualAxes(el.id, x.cfg);
            break;
          case 'liquid':
            chart = new G2Plot.Liquid(el.id, x.cfg);
            break;
          case 'radar':
            chart = new G2Plot.Radar(el.id, x.cfg);
            break;
          case 'word-cloud':
            chart = new G2Plot.WordCloud(el.id, x.cfg);
            break;
          case 'funnel':
            chart = new G2Plot.Funnel(el.id, x.cfg);
            break;
          case 'bullet':
            chart = new G2Plot.Bullet(el.id, x.cfg);
            break;
          case 'histogram':
            chart = new G2Plot.Histogram(el.id, x.cfg);
            break;
          case 'venn':
            chart = new G2Plot.Venn(el.id, x.cfg);
            break;
          case 'rose':
            chart = new G2Plot.Rose(el.id, x.cfg);
            break;
          case 'tiny-line':
            chart = new G2Plot.TinyLine(el.id, x.cfg);
            break;
          case 'tiny-area':
            chart = new G2Plot.TinyArea(el.id, x.cfg);
            break;
          case 'tiny-column':
            chart = new G2Plot.TinyColumn(el.id, x.cfg);
            break;
          case 'sunburst':
            chart = new G2Plot.Sunburst(el.id, x.cfg);
            break;
          case 'stock':
            chart = new G2Plot.Stock(el.id, x.cfg)
            break;
          case 'ring-progress':
            chart = new G2Plot.RingProgress(el.id, x.cfg);
            break;
          case 'progress':
            chart = new G2Plot.Progress(el.id, x.cfg);
            break;
          case 'box':
            chart = new G2Plot.Box(el.id, x.cfg)
            break;
          case 'heatmap':
            chart = new G2Plot.Heatmap(el.id, x.cfg);
            break;
          case 'waterfall':
            chart = new G2Plot.Waterfall(el.id, x.cfg);
            break;
          case 'radial-bar':
            chart = new G2Plot.RadialBar(el.id, x.cfg)
            break;
          case 'bidirectional-bar':
            chart = new G2Plot.BidirectionalBar(el.id, x.cfg)
            break;
          case 'sankey':
            chart = new G2Plot.Sankey(el.id, x.cfg)
            break;
          case 'chord':
            chart = new G2Plot.Chord(el.id, x.cfg)
            break;
          case 'treemap':
            chart = new G2Plot.Treemap(el.id, x.cfg);
            break;
          case 'violin':
            chart = new G2Plot.Violin(el.id, x.cfg);
            break;
          case 'circle-packing':
            chart = new G2Plot.CirclePacking(el.id, x.cfg);
            break;
          case 'mix':
            chart = new G2Plot.Mix(el.id, x.cfg);
            break;
          case 'facet':
            chart = new G2Plot.Facet(el.id, x.cfg);
            break;
          default:
            // code
            break;
        }
        // global cfg
        if (x.cfg.reflect) {
          chart.chart.coordinate().reflect(x.cfg.reflect);
        }
        chart.render();
      }
    };
  }
});
