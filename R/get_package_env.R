#' Get environment belonging to a package
#' 
#' Check whether the package is currently attached via devtools. 
#' If so, get the environment of the attached version, otherwise retrieve the 
#' namespace of the installed package.
#'
#' @param pkgname name of the package
#'
#' @return environment with `pkgname`'s namespace
#' @include test.R
#' @importFrom utils maintainer
#' @export
#'
#' @examples
#' get_package_env("base")
get_package_env <- function(pkgname){
  
  ## be graceful if it's already the environment
  if (is.environment(pkgname))
    return(pkgname)

  ## find out whether we're testing a package that is loaded by devtools
  ## and get that environment rather than a potentially older installed version.
  ## see https://github.com/r-hyperspec/hySpc.testthat/issues/16
  ##
  ## If not, return the installed version
  if (!pkgname %in% dev_packages()) 
    return(getNamespace(pkgname))
  
  pkgname <- paste0("package:", pkgname)
  
  pos <- grep (pkgname, search())
  
  if (length (pos) == 0L)
    stop (pkgname, " is supposed to be loaded by devtools,", 
          " but is not available in search path.")
  
  env <- .GlobalEnv
  for (i in seq_len (pos[1] - 1L)) {
    env <- parent.env(env)
  }
  
  if (environmentName(env) != pkgname)
    stop("Incorrect location of ", pkgname, " in search path.",
         "\nPlease contact ", maintainer("hySpc.testthat"), 
         "with the output of search() and sessionInfo().")

  env  
}

test(get_package_env) <- function(){
  context("get_package_env")
  
  env <- getNamespace("base")
  
  test_that("environment is left unchanged", {
    expect_equal(get_package_env(env), env)
  })
  
  test_that("correct environment is retrieved", {
    expect_equal(get_package_env("base"), env)
  })
  
  test_that("version loaded by devtools is retrieved", {}) 
}
