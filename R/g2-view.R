#' View
#'
#' @param data data
#' @param encode encode
#' @param children children
#' @param scale scale
#' @param transform transform
#' @param coordinate coordinate
#' @param style style
#' @param labelTransform labelTransform
#' @param title title
#' @param axis axis
#' @param legend legend
#' @param tooltip tooltip
#' @param scrollbar scrollbar
#' @param slider slider
#' @param interaction interaction
#' @param theme theme
#'
#' @export
g2_view <- function(data, encode=NULL, children=NULL,
                    scale = NULL,
                    transform = NULL,
                    coordinate = NULL,
                    style = NULL,
                    labelTransform = NULL,
                    title = NULL,
                    axis = NULL,
                    legend = NULL,
                    tooltip = NULL,
                    scrollbar = NULL,
                    slider = NULL,
                    interaction = NULL,
                    theme = NULL,
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
        type           = 'view',
        data           = data,
        encode         = encode,
        children       = children,
        scale          = scale,
        transform      = transform,
        coordinate     = coordinate,
        style          = style,
        labelTransform = labelTransform,
        title          = title,
        axis           = axis,
        legend         = legend,
        tooltip        = tooltip,
        scrollbar      = scrollbar,
        slider         = slider,
        interaction    = interaction,
        theme          = theme
      )
    ),
    class = c('g2view','g2')
  )
  x = list(opt=opt)
  htmlwidgets::createWidget(name='g2', x=x, width=width, height=height, package='rg2')
}
