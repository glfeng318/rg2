#' Mark
#'
#' @name mark
#' @param encode x / y / z / color / shape / size ...
NULL


#' Area
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
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_box <- function(data, encode, ...) {

}

#' boxplot
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_boxplot <- function(data, encode, ...) {

}

#' cell
#'
#'
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
#'
#' @family mark
#' @inherit mark
#' @export
g2_chord <- function(data, encode, ...) {

}

#' density
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_density <- function(data, encode, ...) {

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
g2_heatmap <- function(data, encode, ...) {

}

#' image
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_image <- function(data, encode, ...) {

}

#' interval
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_interval <- function(data, encode, ...) {

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
g2_lineX <- function(data, encode, ...) {

}

#' lineY
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_lineY <- function(data, encode, ...) {

}

#' link
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_link <- function(data, encode, ...) {

}

#' liquid
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_liquid <- function(data, encode, ...) {

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
    discard_null(list_assign(opt, !!!list(...))),
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
g2_polygon <- function(data, encode, ...) {

}

#' range
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_range <- function(data, encode, ...) {

}

#' rangeX
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_rangeX <- function(data, encode, ...) {

}

#' rangeY
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_rangeY <- function(data, encode, ...) {

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
g2_shape <- function(data, encode, ...) {

}

#' text
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_text <- function(data, encode, ...) {

}

#' vector
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_vector <- function(data, encode, ...) {

}

#' wordCloud
#'
#'
#'
#' @family mark
#' @inherit mark
#' @export
g2_wordCloud <- function(data, encode, ...) {

}
