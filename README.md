<!-- ---------------------------------------------------------------------- -->

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![CRAN status](https://www.r-pkg.org/badges/version-last-release/hySpc.testthat)](https://cran.r-project.org/package=hySpc.testthat)
[![R build status](https://github.com/r-hyperspec/hySpc.testthat/workflows/R-CMD-check/badge.svg)](https://github.com/r-hyperspec/hySpc.testthat/actions)
[![Codecov test coverage](https://codecov.io/gh/r-hyperspec/hySpc.testthat/branch/develop/graph/badge.svg)](https://codecov.io/gh/r-hyperspec/hySpc.testthat?branch=develop)
[![pkgdown](https://github.com/r-hyperspec/hySpc.testthat/workflows/pkgdown/badge.svg)](https://r-hyperspec.github.io/hySpc.testthat/)
<!-- badges: end -->



<!-- ---------------------------------------------------------------------- -->
# R Package `hySpc.testthat`
<!-- ---------------------------------------------------------------------- -->

This package is a member of the [**`r-hyperspec`**](https://r-hyperspec.github.io/) packages family and it provides some addons for **testthat** used by **hyperSpec** and **hySpc.\***.


<!-- ---------------------------------------------------------------------- -->

## Documentation

[Online documentation](https://r-hyperspec.github.io/hySpc.testthat/) is available via pkgdown.
In short:

**hySpc.testthat** allows attaching unit tests to functions to keep test and function code close to each other:

```r
library(testthat)

f <- function(x) 2*x

hySpc.testthat::test(f) <- function() {
  context("testing f")
  
  test_that("foo", expect (bar))
}

f
```
```
## function(x) 2*x
## attr(,"test")
## function() {
##   context("testing f")
##   
##   test_that("foo", expect (bar))
## }
```


Functions `test_fun()` and `unittest()` execute unit tests that are attached to functions.

See [tests/testthat/test_attached.R](https://github.com/r-hyperspec/hySpc.testthat/blob/master/tests/testthat/test_attached.R) for including these tests into the usual test suit executed by `devtools::test()`.


<!-- ---------------------------------------------------------------------- -->

## Issues, Bug Reports and Feature Requests

Issues, bug reports and feature requests should go to an appopriate package's repository:

- if related to this package, use [this link](https://github.com/r-hyperspec/hySpc.testthat/issues);
- if related to `hyperSpec` package, use [this link](https://github.com/r-hyperspec/hyperSpec/issues).
<!-- ---------------------------------------------------------------------- -->



## Installation

### Install from CRAN

You can install the released version of **hySpc.testthat** from [CRAN](https://cran.r-project.org/package=hySpc.testthat) with:

```r
install.packages("hySpc.testthat")
```


### Install from CRAN-like Repository

The **recommended** way to install the in-development version:

```r
repos <- c("https://r-hyperspec.github.io/pkg-repo/", getOption("repos"))
install.packages("hySpc.testthat", repos = repos)
```

