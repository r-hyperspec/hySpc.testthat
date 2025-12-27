##' Run test attached to function
##'
##' Execute test attached to a function with [testthat::Reporter].
##'
##' @param reporter [testthat::Reporter] to use
##' @param object to which the test is attached
##'
##' @return the test (function)
##' @include gettest.R
##' @export
##' @examples
##'
##' f <- function(x) x^2
##'
##' test(f) <- function() {
##'    context("f")
##'
##'    test_that("correct result for complex number", {
##'      expect_equal(f(1i), -1 + 0i)
##'    })
##' }
##'
##' test_fun(f)
test_fun <- function(object, reporter = testthat::MinimalReporter) {
  test <- get_test(object)
  with_reporter(reporter = reporter, test())
}

# tested via unittest() in testthat folder
