test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("g2 mark", {
  expect_true(is.g2(g2_point()))
})

test_that("encode", {
  expect_equal(encode('mpg','disp'), list(x='mpg', y='disp'))
})

test_that('label', {
  g2(cars, encode('speed','dist')) + g2_point() + label(text='dist')
})
