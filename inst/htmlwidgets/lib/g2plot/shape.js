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

G2.registerShape('point', 'breath-point', {
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
