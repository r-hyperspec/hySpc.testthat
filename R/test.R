##' Attach unit tests to objects
##'
##' This function attaches unit tests in `value` to an object (typically a
##' function) as an attribute `"test"`.
##'
##' @param f the function (object) to which the tests are to be attached
##' @param value the test code, a function with no parameters
##' @return `f` with the test attached as attribute `"test"`
##' @export
##' @examples
##' f <- function(x) x^2
##'
##' test(f) <- function() {
##'    context("f")
##'
##'    test_that("correct result for complex number", {
##'      expect_equal(f(1i), -1 + 0i)
##'    })
##' }
`test<-` <- function(f, value) {
  attr(f, "test") <- value
  f
}

test(`test<-`) <- function() {
  context("test<-")

  test_that("correct attribute is set", {
    f <- function(x) x^2
    test <- function() {
      "test"
    }

    test(f) <- test

    expect_equal(attr(f, "test"), test)
  })
}
