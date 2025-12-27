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

