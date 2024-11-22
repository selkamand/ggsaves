test_that("ggsaves works", {

  # Make Plot and Interactive Plot
  gg <- ggplot2::ggplot(mtcars) + ggplot2::geom_vline(xintercept = 5)
  ggi <- ggiraph::girafe(ggobj = gg)

  # Test ggsaves
  directory = withr::local_tempdir()

  expect_no_error(
    ggsaves(plot = gg, prefix = "example_prefix", outfolder = directory)
  )
  filenames = dir(directory, full.names = FALSE)
  expect_equal(sort(tools::file_ext(filenames)), sort(c("png", "tiff", "pdf", "svg")))

  # Test ggisaves
  directory2 = withr::local_tempdir()

  expect_no_error(
    ggisaves(plot = ggi, prefix = "example_prefix", outfolder = directory2)
  )
  filenames_interactive = dir(directory2, full.names = FALSE, pattern = "\\.")
  expect_equal(sort(tools::file_ext(filenames_interactive)), sort(c("png", "tiff", "pdf", "svg", "html")))

})
