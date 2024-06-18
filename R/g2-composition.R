#' Composition
#'
#' @name composition
#' @param children children
NULL

#' facetCircle
#'
#' @param data
#' @param encode
#' @param children
#' @param title
#' @param scale
#'
#' @family composition
#' @export
g2_facet_circle <- function(data, encode, children, title, scale) {

}
#' facetRect
#'
#' @param data
#' @param encode
#' @param children
#' @param title
#' @param scale
#'
#' @family composition
#' @export
g2_facet_rect <- function(data, encode, children, title, scale) {

}
#' repeatMatrix
#'
#' @param data data
#' @param encode encode
#' @param children children
#' @param title title
#' @param scale scale
#' @param padding padding
#' @param paddingLeft paddingLeft
#' @param paddingRight paddingRight
#' @param paddingTop paddingTop
#' @param paddingBottom paddingBottom
#' @param margin margin
#' @param marginLeft marginLeft
#' @param marginRight marginRight
#' @param marginTop marginTop
#' @param marginBottom marginBottom
#'
#' @family composition
#' @export
g2_repeat_matrix <- function(data, encode, children, title, scale,
                             padding=0,
                             paddingLeft=0,
                             paddingRight=0,
                             paddingTop=0,
                             paddingBottom=0,
                             margin=0,
                             marginLeft=0,
                             marginRight=0,
                             marginTop=0,
                             marginBottom=0
                             ) {

}
#' spaceFlex
#'
#' @param data data
#' @param children children marks
#' @param ratio ratio
#' @param direction direction
#'
#' @family composition
#' @export
g2_space_flex <- function(data,children=NULL,ratio,direction='row') {

}
#' spaceLayer
#'
#' @param data data
#' @param children children marks
#'
#' @family composition
#' @export
g2_space_layer <- function(data, children=NULL) {

}
#' Timing Keyframe
#'
#' @family composition
#' @param duration 1000
#' @param iterationCount 1
#' @param direction normal, 'normal' | 'reverse' | 'alternate' | 'reverse-alternate'
#' @param children marks children
#' @export
g2_timing_keyframe <- function(duration=1000, iterationCount=1,
                               direction='normal', children=NULL) {

}
