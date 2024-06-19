#' Composition
#'
#' @name composition
#' @param children children
NULL

#' facetCircle
#'
#' @param data data
#' @param encode facetCircle has its own unique encode channel:position
#' @param children children
#' @param title title
#' @param scale scale
#' @param padding padding
#' @param paddingLeft padding left
#' @param paddingRight padding right
#' @param paddingTop padding top
#' @param paddingBottom padding bottom
#' @param margin margin
#' @param marginLeft margin left
#' @param marginRight margin right
#' @param marginTop margin top
#' @param marginBottom margin bottom
#'
#' @family composition
#' @export
g2_facet_circle <- function(data, encode, children, title=NULL, scale=NULL,
                            padding=0,
                            paddingLeft=0,
                            paddingRight=0,
                            paddingTop=0,
                            paddingBottom=0,
                            margin=0,
                            marginLeft=0,
                            marginRight=0,
                            marginTop=0,
                            marginBottom=0,
                            width=640, height=480) {
  data = if(is.character(data) && stringr::str_starts(data, 'http')) {
    list(type='fetch', value=data)
  } else if (inherits(data,'list')) {
    data
  } else if (is.data.frame(data)) {
    jsonlite::toJSON(data, auto_unbox = TRUE, null = 'null')
  } else {
    stop('data should be a data.frame, URL of json/csv or a list of G2 Data options')
  }

  opt = structure(
    compact(
      list(
        type           = 'facetCircle',
        data           = data,
        encode         = encode,
        children       = children,
        title          = title,
        scale          = scale,
        padding        = padding,
        paddingLeft    = paddingLeft,
        paddingRight   = paddingRight,
        paddingTop     = paddingTop,
        paddingBottom  = paddingBottom,
        margin         = margin,
        marginLeft     = marginLeft,
        marginRight    = marginRight,
        marginTop      = marginTop,
        marginBottom   = marginBottom
      )
    ),
    class = c('g2facetrect','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')
}
#' facetRect
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
g2_facet_rect <- function(data, encode, children, title=NULL, scale=NULL,
                          padding=0,
                          paddingLeft=0,
                          paddingRight=0,
                          paddingTop=0,
                          paddingBottom=0,
                          margin=0,
                          marginLeft=0,
                          marginRight=0,
                          marginTop=0,
                          marginBottom=0,
                          width=640, height=480) {
  data = if(is.character(data) && stringr::str_starts(data, 'http')) {
    list(type='fetch', value=data)
  } else if (inherits(data,'list')) {
    data
  } else if (is.data.frame(data)) {
    jsonlite::toJSON(data, auto_unbox = TRUE, null = 'null')
  } else {
    stop('data should be a data.frame, URL of json/csv or a list of G2 Data options')
  }

  opt = structure(
    compact(
      list(
        type           = 'facetRect',
        data           = data,
        encode         = encode,
        children       = children,
        title          = title,
        scale          = scale,
        padding        = padding,
        paddingLeft    = paddingLeft,
        paddingRight   = paddingRight,
        paddingTop     = paddingTop,
        paddingBottom  = paddingBottom,
        margin         = margin,
        marginLeft     = marginLeft,
        marginRight    = marginRight,
        marginTop      = marginTop,
        marginBottom   = marginBottom
      )
    ),
    class = c('g2facetrect','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')

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
g2_repeat_matrix <- function(data, encode, children, title=NULL, scale=NULL,
                             padding=0,
                             paddingLeft=0,
                             paddingRight=0,
                             paddingTop=0,
                             paddingBottom=0,
                             margin=0,
                             marginLeft=0,
                             marginRight=0,
                             marginTop=0,
                             marginBottom=0,
                             width=640, height=480
                             ) {
  data = if(is.character(data) && stringr::str_starts(data, 'http')) {
    list(type='fetch', value=data)
  } else if (inherits(data,'list')) {
    data
  } else if (is.data.frame(data)) {
    jsonlite::toJSON(data, auto_unbox = TRUE, null = 'null')
  } else {
    stop('data should be a data.frame, URL of json/csv or a list of G2 Data options')
  }

  opt = structure(
    compact(
      list(
        type           = 'repeatMatrix',
        data           = data,
        encode         = encode,
        children       = children,
        title          = title,
        scale          = scale,
        padding        = padding,
        paddingLeft    = paddingLeft,
        paddingRight   = paddingRight,
        paddingTop     = paddingTop,
        paddingBottom  = paddingBottom,
        margin         = margin,
        marginLeft     = marginLeft,
        marginRight    = marginRight,
        marginTop      = marginTop,
        marginBottom   = marginBottom
      )
    ),
    class = c('g2repeatmatrix','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')

}
#' spaceFlex
#'
#' @param data data
#' @param children children marks
#' @param ratio ratio
#' @param direction direction
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
#' @param width width
#' @param height height
#'
#' @family composition
#' @export
g2_space_flex <- function(data=NULL,
                          children=NULL,
                          ratio=NULL,
                          direction='row',
                          padding=0,
                          paddingLeft=0,
                          paddingRight=0,
                          paddingTop=0,
                          paddingBottom=0,
                          margin=0,
                          marginLeft=0,
                          marginRight=0,
                          marginTop=0,
                          marginBottom=0,
                          width=640, height=480) {
  # data can be null
  data = if (is.null(data)) {
    data
  } else if(is.character(data) && stringr::str_starts(data, 'http')) {
    list(type='fetch', value=data)
  } else if (inherits(data,'list')) {
    data
  } else if (is.data.frame(data)) {
    jsonlite::toJSON(data, auto_unbox = TRUE, null = 'null')
  } else {
    stop('data should be a data.frame, URL of json/csv or a list of G2 Data options')
  }
  # remove child$x$opt if child is spaceFlex
  children = children |>
    map(\(child) {
      if(is.widget(child)) {
        child$x$opt
      } else {
        child
      }
    })

  opt = structure(
    compact(
      list(
        type           = 'spaceFlex',
        data           = data,
        ratio          = ratio,
        direction      = direction,
        children       = children,
        padding        = padding,
        paddingLeft    = paddingLeft,
        paddingRight   = paddingRight,
        paddingTop     = paddingTop,
        paddingBottom  = paddingBottom,
        margin         = margin,
        marginLeft     = marginLeft,
        marginRight    = marginRight,
        marginTop      = marginTop,
        marginBottom   = marginBottom
      )
    ),
    class = c('g2spaceflex','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')
}
#' spaceLayer
#'
#' @param data data
#' @param children children marks
#'
#' @family composition
#' @export
g2_space_layer <- function(data, children=NULL, ..., width=640, height=480) {
  data = if(is.character(data) && stringr::str_starts(data, 'http')) {
    list(type='fetch', value=data)
  } else if (inherits(data,'list')) {
    data
  } else if (is.data.frame(data)) {
    jsonlite::toJSON(data, auto_unbox = TRUE, null = 'null')
  } else {
    stop('data should be a data.frame, URL of json/csv or a list of G2 Data options')
  }
  opt = structure(
    compact(
      list(
        type           = 'spaceLayer',
        data           = data,
        children       = children
      )
    ),
    class = c('g2view','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')
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
