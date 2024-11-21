test_that("ggsaves works", {

  gg <- ggplot2::ggplot(mtcars) + ggplot2::geom_vline(xintercept = 5)

  directory = withr::local_tempdir()
  expect_no_error(
    ggsaves(plot = gg, prefix = "example_prefix", outfolder = directory)
  )

  filenames = dir(directory, full.names = FALSE)
  expect_equal(sort(tools::file_ext(filenames)), sort(c("png", "tiff", "pdf", "svg")))
})
