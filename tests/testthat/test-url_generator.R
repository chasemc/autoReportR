context("test-url_generator")


date_portion <- paste0(format(Sys.Date() - 1, "%Y/%Y%m%d"))



a <- paste0("https://www.glerl.noaa.gov/metdata/chi/",
       date_portion,
       ".04t.txt")

b <- autoReportR::urlGenerator()


test_that("urlGenerator hasn't changed", {
  expect_identical(a, b)
  expect_type(b, "character")
  expect_length(b, 1)
})
