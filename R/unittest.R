##' Run unit tests
##'
##' If [testthat::testthat-package] is available, run the unit tests and display
##' the results.
##'
##' @rdname unittests
##'
##' @param ns namespace (package) to test
##' @param standalone if `TRUE`, appropriate [testthat::Reporter]s are used, if
##'   `FALSE` the exectution assumes reporters are started already.
##' @param reporter [testthat::Reporter] to be used.
##' @return Invisibly returns a data.frame with the test results
##'
##' @author Claudia Beleites
##'
##' @keywords programming utilities
##' @importFrom  testthat with_reporter
##' @include gettest.R
##' @export
##' @examples
##' unittest("hySpc.testthat")
unittest <- function(ns, standalone = TRUE, reporter = "progress") {
  if (!requireNamespace("testthat", quietly = TRUE)) {
    warning("Package testthat required to run the unit tests.")
    return(NA)
  }
  if (!"package:testthat" %in% search())
    attachNamespace("testthat")

  if (is.character(ns))
    ns <- getNamespace(ns)

  tests <- eapply(env = ns, FUN = get_test, all.names = TRUE)
  tests <- tests[!sapply(tests, is.null)]

  if (standalone) {
    with_reporter(reporter = reporter, start_end_reporter = TRUE,
                  for (t in tests) t())
  } else {
    for (t in tests) t()
  }

}

test(unittest) <- function() {
  context("unittest")

  test_that("standalone", {

    f <- function(x) x^2

    test(f) <- function() {
      context("f")
      test_that("correct result for complex number", {
        expect_equal(f(1i), -1 + 0i)
      })
    }

    test_env <- environment()
    test_env$f <- f

    res <- unittest(ns = test_env, reporter = "list")$get_results()

    expect_equal(res[[1]]$context, "f")
    expect_true("expectation_success" %in% class(res[[1]]$results[[1]]))
  })
}
