library('move2')

test_data <- test_data("input2.rds") #file must be move2!

test_that("happy path", {
  actual <- rFunction(data = test_data, nlocs = 3)
  expect_equal(nrow(actual), 9)
})

test_that("wrong nlocs", {
  actual <- rFunction(data = test_data, nlocs = 0)
  expect_null(actual)
})
