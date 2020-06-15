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
test_fun <- function(object, reporter = "minimal") {
  test <- get_test(object)
  with_reporter(reporter = reporter, test())
}

test(`test_fun`) <- function() {
  context("test_fun")

  test_that("correct execution", {
    f <- function(x) x^2

    test(f) <- function() {
      context("f")
      test_that("correct result for complex number", {
        expect_equal(f(1i), -1 + 0i)
      })
    }

    res <- test_fun(f, reporter = "list")$get_results()

    expect_equal(res[[1]]$context, "f")
    expect_true("expectation_success" %in% class(res[[1]]$results[[1]]))
  })
}
