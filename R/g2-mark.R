#' Mark
#'
#' @name mark
#' @param encode x / y / z / color / shape / size ...
NULL


#' Area
#'
#' @details
#' g2_area has the following shape:
#' - area
#' - smooth
#' - vh
#' - hv
#' - hvh
#'
#' Style:
#' - connect
#' - connect[Style]
#' - defined
#' - fill
#' - fillOpacity
#' - stroke
#' - strokeOpacity
#' - lineWidth
#' - lineDash
#' - opacity
#' - shadowColor
#' - shadowBlur
#' - shadowOffsetX
#' - shadowOffsetY
#' - cursor
#' @md
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_area <- function(encode=NULL, ...) {
  opt = list(
    type='area',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' box
#'
#' box is an Atomic mark, you need to calculate the quantile.
#'
#' @details
#' Quantile data for box mark:
#' [min, Q1, Median, Q3, max]
#' @md
#'
#' @param encode encode
#' @param ... ...
#'
#' @family mark
#' @inherit mark
#' @export
g2_box <- function(encode=NULL, ...) {
  opt = list(
    type='box',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' boxplot
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_boxplot <- function(encode=NULL, ...) {
  opt = list(
    type='boxplot',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' cell
#'
#' @details
#' Shape:
#' - cell
#' - hollow
#'
#' Style:
#' - radius
#' - radiusTopLeft
#' - radiusTopRight
#' - radiusBottomRight
#' - radiusBottomLeft
#' - inset
#' - insetLeft
#' - insetRight
#' - insetBottom
#' - insetTop
#' - fill
#' - fillOpacity
#' - stroke
#' - strokeOpacity
#' - lineWidth
#' - lineDash
#' - opacity
#' - shadowColor
#' - shadowBlur
#' - shadowOffsetX
#' - shadowOffsetY
#' - cursor
#' @md
#'
#' @family mark
#' @inherit mark
#' @export
g2_cell <- function(encode=NULL, ...) {
  opt = list(
    type='cell',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' chord
#'
#'
#' @details
#' data for chord:
#' ```
#' df = data.frame(source=..., target=..., value=...)
#' g2(data=list(value=list(links=df)))
#' ```
#' you need to pass the other property to g2_chord() to config the data field
#' mapping if your data don't have the `source` `target` and `value`
#' @md
#'
#' @param encode encode
#' @param ... property: y / id / source / target / sourceWeight / targetWeight / sortBy / nodeWidthRatio / nodePaddingRatio
#'
#' @family mark
#' @inherit mark
#' @export
g2_chord <- function(encode=NULL, ...) {
  opt = list(
    type='chord',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' density
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_density <- function(encode=NULL, ...) {
  opt = list(
    type='density',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' gauge
#'
#'
#'
#' @param ... ...
#'
#' @family mark
#' @inherit mark
#' @export
g2_gauge <- function(...) {
  opt = list(
    type='gauge'
  )
  dots = list(...)
  if (!pluck_exists(dots, 'legend')) {
    opt$legend = FALSE
  }
  opt = compact(list_assign(opt, !!!dots))

  structure(
    opt,
    class = c('g2mark', 'g2')
  )
}

#' heatmap
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_heatmap <- function(encode=NULL, ...) {

}

#' image
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_image <- function(encode=NULL, ...) {

}

#' interval
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_interval <- function(encode=NULL, ...) {

}
#' Column
#'
#' @family mark
#' @export
g2_col <- function(encode=NULL, ...) {
  opt = list(
    type='interval',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}
#' Bar
#'
#' @family mark
#' @export
g2_bar <- function(encode=NULL, ...) {
  opt = list(
    type='interval',
    coordinate=list(transform=list(list(type='transpose'))),
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}
#' Pie
#'
#' @family mark
#' @param encode just need a y encoding
#' @export
g2_pie <- function(encode=NULL, ...) {
  opt = list(
    type='interval',
    coordinate=list(type='theta'),
    transform=list(list(type='stackY')),
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' Line
#'
#' One of the most commonly used marks to draw a line based on a series of points, usually used to draw line graphs.
#'
#' @param encode encode.shape: line / smooth / vh / hv / hvh / tail.
#' @family mark
#' @inherit mark
#' @export
g2_line <- function(encode=NULL, ...) {
  opt = list(
    type='line',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' lineX
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_lineX <- function(encode=NULL, ...) {

}

#' lineY
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_lineY <- function(encode=NULL, ...) {

}

#' link
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_link <- function(encode=NULL, ...) {

}

#' liquid
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_liquid <- function(style=NULL) {
  opt = list(
    type='liquid',
    style=style
  )
  structure(
    compact(opt),
    class = c('g2mark', 'g2')
  )
}

#' point
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_point <- function(encode=NULL, ...) {
  opt = list(
    type='point',
    encode = encode
  )
  structure(
    compact(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}


#' polygon
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_polygon <- function(encode=NULL, ...) {

}

#' range
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_range <- function(data,encode, ...) {

}

#' rangeX
#'
#' @details
#' data for single range: `c(start_x1, end_x1)`
#'
#' data for multiple ranges: `list(c(start_x1, end_x1), c(start_X2, end_x2), ...)`
#' @md
#'
#' @examples
#' g2_range_x(c(67, 120))
#' g2_range_x(c(js('new Date("2010")'),js('new Date("2020")')))
#' g2_range_x(list(c(9, 18), c(24, 32), c(67,100)))
#'
#' g2_view(url, children = list(g2_point(encode('height', 'weight', color='gender')),g2_range_x(c(160,170))))
#'
#'
#' @param data to draw a single range, use a vector of length-2,to draw n ranges, use a vector of length-n, where each element of the vector is a vector of length-2
#' @param ...
#'
#' @family mark
#' @inherit mark
#' @export
g2_range_x <- function(data, ...) {
  opt = list(
    type='rangeX',
    data = data
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' rangeY
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_range_y <- function(data, ...) {
  opt = list(
    type='rangeY',
    data = data
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}


#' Rect
#'
#' @family mark
#' @inherit mark
#' @export
g2_rect <- function(encode=NULL, ...) {
  opt = list(
    type='rect',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}
#' Histogram
#'
#' @family mark
#' @export
g2_hist <- function(encode=NULL, ...) {
  opt = list(
    type='rect',
    encode = encode,
    transform=list(
      list(type='binX', y='count'),
      list(type='stackY', orderBy='series')
    )
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}


#' shape
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_shape <- function(encode=NULL, ...) {

}

#' text
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_text <- function(encode=NULL, ...) {
  opt = list(
    type='text',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' vector
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_vector <- function(encode=NULL, ...) {
  opt = list(
    type='vector',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}

#' wordCloud
#'
#'
#'
#' @param encode encode
#' @param layout layout
#' @param style style
#' @param labels labels
#' @param ... ...
#'
#' @family mark
#' @inherit mark
#' @export
g2_wordCloud <- function(encode=NULL, layout=NULL, style=NULL, labels=NULL, ...) {
  opt = list(
    type='wordCloud',
    encode = encode
  )
  structure(
    discard_null(list_assign(opt, !!!list(...))),
    class = c('g2mark', 'g2')
  )
}
