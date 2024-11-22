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

  # TIFF
  ggplot2::ggsave(plot = plot, filename =  paste0(prefix, '.', dpi, 'dpi', '.tiff'), path = outfolder, device = "tiff", width = width, height = height, dpi = dpi, compression = "lzw", ...)

  # PDF
  ggplot2::ggsave(plot = plot, filename = paste0(prefix, '.pdf'), path = outfolder, device = "pdf",width = width, height = height, ...)

  # SVG
  ggplot2::ggsave(plot = plot, filename = paste0(prefix, '.svg'), path = outfolder, device = "svg",width = width, height = height, ...)

  invisible(NULL)

}


#' Save interactive plot to common filetypes
#'
#' @inheritParams htmlwidgets::saveWidget
#' @param width,height Plot size in inches. If not supplied, uses the size of current graphics device.
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
ggisaves <- function(plot, prefix, outfolder, title = prefix, knitrOptions, background = "white", dpi = 300, width = 8, height = 5){

  # Assert Plot is a htmlwidget
  if(!inherits(plot, "htmlwidget")) stop("plot must be a htmlwidget object to save with ggisaves")

  # Check Interactive plot actually contains some html code
  html <- plot$x$html
  if(nchar(html) == 0) stop("No HTML code found in htmlwidget plot. Are you sure this plot is a valid htmlwidget?")

  if(!dir.exists(outfolder)){
    permission = utils::askYesNo(paste0("Cannot find directory: ", outfolder, ". Would you like to create a new directory?"), default = TRUE)
    if(permission)
      dir.create(outfolder)
    else stop("Output directory [", outfolder, "] does not exist. Please create then try again")
  }



  # Configure Width and Height of htmlwidget plot
  plot$width <- width
  plot$height <- height

  # Outfiles
  extensionless_filepath <- paste0(outfolder, "/", prefix)
  outfile_html <- paste0(extensionless_filepath, '.html')
  outfile_svg <- paste0(extensionless_filepath, '.svg')
  outfile_pdf <- paste0(extensionless_filepath, '.pdf')
  outfile_png <- paste0(extensionless_filepath, '.', dpi,'dpi', '.png')
  outfile_tiff <- paste0(extensionless_filepath, '.', dpi,'dpi', '.tiff')
  # [Export HTLM, SVG, and Vector PDF]

  # HTML
  htmlwidgets::saveWidget(widget = plot, file = outfile_html, selfcontained = TRUE, title = title, knitrOptions = knitrOptions, background = background)

  # SVG
  writeLines(plot$x$html, outfile_svg)

  # Vector PDF
  rsvg::rsvg_pdf(svg = outfile_svg, file = outfile_pdf, width = width * dpi, height = height * dpi)

  # PNG
  rsvg::rsvg_png(svg = outfile_svg, file = outfile_png, width = width * dpi, height = height * dpi)

  # TIFF
  image <- magick::image_read_svg(outfile_svg, width = width*dpi, height = height*dpi)
  magick::image_write(image, path = outfile_tiff, format = "tiff", compression="lzw", density=dpi)


  # Return NULL invisibly
  invisible(NULL)
}
