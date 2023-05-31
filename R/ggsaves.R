#' Save plot to common filetypes
#'
#' @inheritParams ggplot2::ggsave
#' @inheritDotParams ggplot2::ggsave
#' @param width,height Plot size in units ("in", "cm", "mm", or "px"). If not supplied, uses the size of current graphics device.
#' @param prefix filename without extension
#' @param outfolder folder to save files in

#' @param ...
#'
#' @return Run for its side effects. Returns invisible(NULL)
#' @export
#'
ggsaves <- function(plot, prefix, outfolder, dpi = 300, width = 8, height = 5, ...){

  # PNG
  ggplot2::ggsave(plot = plot, filename = paste0(prefix, '.', dpi, 'dpi', '.png'), path = outfolder, device = "png", dpi = dpi, width = width, height = height, ...)

  # PDF
  ggplot2::ggsave(plot = plot, filename = paste0(prefix, '.pdf'), path = outfolder, device = "pdf",width = width, height = height, ...)

  # SVG
  ggplot2::ggsave(plot = plot, filename = paste0(prefix, '.svg'), path = outfolder, device = "svg",width = width, height = height, ...)

  invisible(NULL)

}
