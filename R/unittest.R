##' Run unit tests
##'
##' If [testthat::testthat()] is available, run the unit tests and
##' display the results.
##'
##' @rdname unittests
##' @param ns namespace (package) to test
##' @param standalone if `TRUE`, the appropriate [testthat::]
##' @return Invisibly returns a data.frame with the test results
##'
##' @author Claudia Beleites
##'
##' @keywords programming utilities
##' @importFrom  testthat SummaryReporter
##' @importFrom  testthat ListReporter
##' @importFrom  testthat MultiReporter
##' @importFrom  testthat with_reporter
##' @importFrom  testthat get_reporter
##' @export
unittest <- function(ns, standalone = TRUE){
  if (!requireNamespace("testthat", quietly = TRUE)) {
    warning("Package testthat required to run the unit tests.")
    return(NA)
  }
  if (!"package:testthat" %in% search())
    attachNamespace("testthat")

  tests <- eapply(env = getNamespace(ns), FUN = get.test, all.names = TRUE)
  tests <- tests[!sapply(tests, is.null)]

  if (standalone) {
    reporter <- ProgressReporter$new()
    lister <- ListReporter$new()
    reporter <- MultiReporter$new(reporters = list(reporter, lister))
  
    with_reporter(reporter = reporter, start_end_reporter = TRUE, {
      for (t in seq_along(tests)) {
        lister$start_file(names(tests[t]))
        tests[[t]]()
      }
      get_reporter()$.end_context()
    })
    
    invisible(lister$get_results())
  } else {
    for (t in seq_along(tests)) {
      tests[[t]]()
    }
  }
}

##' Attach unit tests to objects
##'
##' This function attaches unit tests in `value` to an object (typically a
##' function) as an attribute `"test"`. 
##'
##' @param f the function (object) to which the tests are to be attached
##' @param value the test code, a function with no parameters
##' @return `f` with the test attached as attribute `"test"`
##' @rdname unittests
##' @export
##' @examples 
##' f <- function(x) x^2
##' 
##' .test(f) <- function() {
##'    context("f")
##'    
##'    test_that("correct result for complex number", {
##'      expect_equal(f(1i), -1 + 0i)
##'    })
##' }
##' 
`.test<-` <- function(f, value) {
  attr(f, "test") <- value
  f
}

.test(`.test<-`) <- function(){
  context(".test<-")
  
  f <- function(x) x^2
  test <- function() {"test"}

  .test(f) <- test
  
  expect_equal(attr(f, "test"), test)
}

##' get test that is attached to object as "test" attribute
##'
##' @rdname unittests
##' @param object to which the test is attached
##' @return the test (function)
##' @export
##' @examples 
##' 
##' get.test(f)
##' 
##' ## execute the test
##' get.test(f)()
##'
get.test <- function(object){
  attr(object, "test")
}

.test(`get.test`) <- function(){
  context("get.test")
  
  f <- function(x) x^2
  test <- function() {"test"}
  .test(f) <- test
  
  expect_equal(get.test(f), test)
}

