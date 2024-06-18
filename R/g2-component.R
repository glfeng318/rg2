#' Axis
#'
#' Axis
#'
#' @family component
#' @export
axis <- function(x=NULL, y=NULL) {
  opt = list(
    x = x,
    y = y
  )
  structure(
    list(axis = discard_null(list_assign(opt, !!!list(...)))),
    class = c('g2axis', 'g2')
  )
}


#' Legend
#'
#' Legend
#'
#' @family component
#' @export
legend <- function(...) {
  dots = list(...)
  opt = NULL
  if (is.null(names(dots)) && pluck(dots, 1) == FALSE) {
    opt = list(legend=FALSE)
  } else {
    opt = list(legend=list(...))
  }
  structure(
    opt,
    class = c('g2legend', 'g2')
  )
}


#' Scrollbar
#'
#' @export
scrollbar <- function(x=NULL, y=NULL) {
  if(is.null(x)) {
    xx =TRUE
  } else {
    xx = x
  }
  if(is.null(y)) {
    yy =TRUE
  } else {
    yy = y
  }
  opt = list(
    x = xx,
    y = yy
  )
  structure(
    list(scrollbar = discard_null(opt)),
    class = c('g2scrollbar', 'g2')
  )
}

#' Slider
#'
#' @export
g2_slider <- function() {}

#' Title
#'
#' titles can be configured either in mark or in view
#'
#' @family component
#' @export
title <- function(title, subtitle=NULL, ...) {
  opt = list(
    title=title,
    subtitle = subtitle
  )
  structure(
    list(title = discard_null(list_assign(opt, !!!list(...)))),
    class = c('g2title', 'g2')
  )
}

#' Tooltip
#'
#' @export
tooltip <- function() {}

