#' Coordinate
#'
#' coordinate be configured in `g2()` or in `g2_` family functions.
#'
#' Each view can only have one coordinate system. In addition to its own attributes,
#' the coordinate system also contains a series of Coordinate Transform.
#'
#' The coordinate system of mark has bubbling properties and will be merged with
#' The coordinate system of view.
#' The coordinate system of the first mark has the highest priority.
#'
#' @param type 'polar' / 'theta' / 'radial' / 'parallel'
#' @param transform array of transform
#'
#' @export
coordinate <- function(type=NULL, ...) {
  opt = list(coordinate=discard_null(list_flatten(list(type=type, list(...)))))
  structure(
    opt,
    class = c('g2coordinate','g2')
  )
}

