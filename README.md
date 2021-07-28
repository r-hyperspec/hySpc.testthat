# R Package `hySpc.testthat`

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![CRAN status](https://www.r-pkg.org/badges/version/hySpc.testthat)](https://cran.r-project.org/package=hySpc.testthat)
[![R build status](https://github.com/r-hyperspec/hySpc.testthat/workflows/R-CMD-check/badge.svg)](https://github.com/r-hyperspec/hySpc.testthat/actions)
[![Codecov test coverage](https://codecov.io/gh/r-hyperspec/hySpc.testthat/branch/develop/graph/badge.svg)](https://codecov.io/gh/r-hyperspec/hySpc.testthat?branch=develop)
[![pkgdown](https://github.com/r-hyperspec/hySpc.testthat/workflows/pkgdown/badge.svg)](https://r-hyperspec.github.io/hySpc.testthat/)
<!-- badges: end -->

This package provides some addons for **testthat** used by **hyperSpec** and **hySpc.\***.

[Online documentation](https://r-hyperspec.github.io/hySpc.testthat/) is available via pkgdown.

**hySpc.testthat** allows to attach unit tests to  functions:

```r
f <- function(x) 2*x

test(f) <- function(){
  context("testing f")
  
  test_that("foo", expect (bar))
}
```

to keep test code and functional code close to each other.

Functions `test_fun()` and `unittest()` execute unit tests that are thus attached to functions.

See [tests/testthat/test_attached.R](https://github.com/r-hyperspec/hySpc.testthat/blob/master/tests/testthat/test_attached.R) for including these tests into the usual test suit executed by `devtools::test()`.


