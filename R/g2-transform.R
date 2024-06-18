#' transform
#'
#'
#' @param type require, transform type
#' @param ... other optional param depends on type
#'
#' @details
#' ```
#' [{type: '', ...}, ...]
#'
#' transform is an array, you can config it in two ways:
#'  - use `transform=list(list(...), list(...))` in `g2()` or `g2_` family functions
#'  - use `+` to add multiple `transform(type, ...)`
#'
#' transform(type='bin',thresholdsX,thresholdsY,channel)
#' transform(type='binX',thresholds,channel)
#' transform(type='diffY',groupBy,series)
#' transform(type='dodgeX',groupBy,reverse,orderBy,padding)
#' transform(type='flexX',field,channel,reducer)
#' transform(type='group',channels,channel)
#' transform(type='groupColor',channel)
#' transform(type='groupX',channel)
#' transform(type='groupY',channel)
#' transform(type='jitter',padding=0,paddingX=0,paddingY=0,random=js('Math.random()'))
#' transform(type='jitterX',)
#' transform(type='jitterY',)
#' transform(type='normalizeY',)
#' transform(type='pack',)
#' transform(type='sample',)
#' transform(type='select',)
#' transform(type='selectX',)
#' transform(type='selectY',)
#' transform(type='sortColor',)
#' transform(type='sortX',)
#' transform(type='sortY',)
#' transform(type='stackEnter',)
#' transform(type='stackY',)
#' transform(type='symmetryY',groupBy='x')
#' ```
#'
#' @export
transform <- function(type, ...) {
  opt = list(
    list_flatten(
      list(
        type=type,
        compact(list(...))
      )
    )
  )
  structure(
    opt,
    class = c('g2transform','g2'))
}
