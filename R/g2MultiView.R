#' MultiView chart
#' 
#' MultiView chart
#' 
#' @inheritParams g2
#' @family g2
#' 
#' @example 
#' \dontrun{
#' 
#' df = jsonlite::fromJSON('https://gw.alipayobjects.com/os/antfincdn/fKTgtjKdaN/association-pie.json')
#' cfg = list(
#'   tooltip=FALSE,
#'   legend=TRUE,
#'   plots=list(
#'     list(
#'       type='pie',
#'       region=list(start=list(x=0, y=0 ), end=list(x=0.45, y=1 ) ),
#'       options=list(
#'         data=jsonlite::toJSON(df$pie1),
#'         angleField='bill',
#'         colorField='area',
#'         radius=0.85,
#'         tooltip=list(showMarkers=FALSE),
#'         label=list(type='inner', offset='-15%'),
#'         interactions=list(
#'           type=list('element-active'),
#'           type=list('association-tooltip'),
#'           type=list('association-highlight')
#'         )
#'       )
#'     ),
#'     list(
#'       type='pie',
#'       region=list(start=list(x=0.55, y=0 ), end=list(x=1, y=1 ) ),
#'       options=list(
#'         data=jsonlite::toJSON(df$pie2),
#'         angleField='value',
#'         colorField='area',
#'         radius=0.85,
#'         tooltip=list(showMarkers=FALSE),
#'         label=list(type='inner', offset='-15%'),
#'         interactions=list(
#'           type=list('association-tooltip'),
#'           type=list('association-selected')
#'         )
#'       )
#'     )
#'   )
#' )
#' 
#' g2MultiView(cfg)
#' 
#' }
#' 
#' @export
g2MultiView <- function(cfg = list(), width = NULL, height = NULL) {
  # pass the data and settings using 'x'
  x <- list(
    type = 'MultiView',
    cfg = cfg
  )
  # create the widget
  htmlwidgets::createWidget('g2', x, width = width, height = height, package='rg2')
}

