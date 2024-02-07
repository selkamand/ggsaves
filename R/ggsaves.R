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


#' Save interactive plot to common filetypes
#'
#' @inheritParams htmlwidgets::saveWidget
#' @param width,height Plot size in units ("in", "cm", "mm", or "px"). If not supplied, uses the size of current graphics device.
#' @param prefix filename without extension
#' @param outfolder folder to save files in
#'
#' @return Run for its side effects. Returns invisible(NULL)
#' @export
#'
#' @examples
#'
#' \dontrun{
#'  library(ggiraph)
#'  library(ggplot2)
#'
#'  gg_plot <- iris |>
#'      ggplot(aes(Sepal.Length, Sepal.Width)) +
#'      geom_point_interactive(aes(data_id  = Species, tooltip = Species))
#'
#'    interactive_gg_plot <- girafe(ggobj = gg_plot)
#'
#'    ggisaves(interactive_gg_plot, prefix = "my_interactive_plot", outfolder = ".")
#' }
ggisaves <- function(plot, prefix, outfolder, dpi = 300, title = prefix, knitrOptions, background = "white", width = 8, height = 5, ...){

  # Outfiles
  extensionless_filepath <- paste0(outfolder, "/", prefix)
  outfile_html <- paste0(extensionless_filepath, '.html')
  outfile_svg <- paste0(extensionless_filepath, '.svg')
  outfile_pdf <- paste0(extensionless_filepath, '.pdf')


  # [Export HTLM, SVG, and Vector PDF]

  # HTML
  htmlwidgets::saveWidget(widget = plot, file = outfile_html, selfcontained = TRUE, title = title, knitrOptions = knitrOptions, background = background)

  # SVG
  writeLines(plot$x$html, outfile_svg)

  # Vector PDF
  rsvg::rsvg_pdf(svg = outfile_svg, file = outfile_pdf)

  invisible(NULL)

}
