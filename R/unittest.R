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
##' @importFrom  testthat SummaryReporter
##' @importFrom  testthat MinimalReporter
##' @importFrom  testthat ListReporter
##' @importFrom  testthat MultiReporter
##' @importFrom  testthat with_reporter
##' @importFrom  testthat get_reporter
##' @export
unittest <- function(ns, standalone = TRUE, reporter = SummaryReporter){
  if (!requireNamespace("testthat", quietly = TRUE)) {
    warning("Package testthat required to run the unit tests.")
    return(NA)
  }
  if (!"package:testthat" %in% search())
    attachNamespace("testthat")
  
  if (is.character(ns))
    ns <- getNamespace(ns)
  
  tests <- eapply(env = ns, FUN = get.test, all.names = TRUE)
  tests <- tests[!sapply(tests, is.null)]
  
  if (standalone) {
    ## Fire up reporters to get the test results displayed
    
    reporter <- reporter$new()
    lister <- ListReporter$new()
    reporter <- MultiReporter$new(reporters = list(reporter, lister))
    
    with_reporter(reporter = reporter, start_end_reporter = TRUE, {
      for (t in seq_along(tests)) {
        reporter$start_file(names(tests[t]))
        lister$start_file(names(tests[t]))
        tests[[t]]()
        reporter$.end_context()
        reporter$end_file()
      }
    })
    invisible(lister$get_results())

  } else {
    ## tests are run within existing test framework/reporters
    ## this is what devtools::test() uses
    
    for (t in seq_along(tests)) {
      tests[[t]]()
    }
    
  }
}

.test(unittest) <- function(){
  context ("unittest")
  
  test_that("standalone", {
    
    test_env <- environment()
    test_env$f <- get.test
    
    result <- unittest(ns = test_env, reporter = MinimalReporter)
    expect_equal(result[[1]]$file, "f")
    expect_equal(result[[1]]$context, "get.test")
  })
}
