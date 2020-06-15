##' Get test that is attached to object as "test" attribute
##'
##' The returned function can be executed. If that is done within a
##' [testthat::Reporter], the results will be reported accordingly. Without
##' reporter, the test runs silently if successful and stops if it fails.
##'
##' @param object to which the test is attached
##' @return the test (function)
##' @include test.R
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
##' get_test(f)
##'
##' library(testthat)
##' ## execute the test
##' get_test(f)()
##'
##' with_reporter("summary", get_test(f)())
get_test <- function(object) {
  attr(object, "test")
}

test(`get_test`) <- function() {
  context("get_test")

  test_that("correct attribute is returned", {
    f <- function(x) x^2
    test <- function() {
      "test"
    }
    test(f) <- test

    expect_equal(get_test(f), test)
  })
}
