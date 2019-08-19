context("test-readnoaa")



a <- tempfile()
write.csv(mtcars[[1]], a)


test_that("readNoaa() wrong columns check", {
  expect_error(readNoaa(a))
})


a <- readNoaa()


test_that("simple readNoaa() checks", {
  expect_identical(class(a), "data.frame")
  expect_identical(ncol(a), 9L)
})


a <- sapply(a, class)

nams <- names(a)
type <- unname(a)


test_that("readNoaa() column type checks", {
  expect_identical(nams,
                   c("ID",
                     "Year",
                     "DOY",
                     "UTC",
                     "C",
                     "m.s",
                     "m.s.1",
                     "deg",
                     "X.")
  )
  expect_identical(type,
                   c("integer",
                     "integer",
                     "integer",
                     "integer",
                     "numeric",
                     "numeric",
                     "numeric",
                     "integer",
                     "numeric")
  )
})


