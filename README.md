# hySpc.testthat

This package provides some addons for testthat used by **hyperSpec** and **hySpc.\***.

Most importantly, it allows to attach unit tests to  functions:

```
.test(f) <- function(){
  context("testing f")
  
  test_that("foo", expect (bar))
}
```

<!-- badges: start -->
<!--
[![CRAN
status](https://www.r-pkg.org/badges/version/hySpc.testthat)](https://cran.r-project.org/package=hySpc.testthat)
-->
[![Build Status on Travis](https://travis-ci.com/r-hyperspec/hySpc.testthat.svg?branch=master)](https://travis-ci.com/github/r-hyperspec/hySpc.testthat)
[![Build status](https://ci.appveyor.com/api/projects/status/v2wyml7wkj6wwdxn?svg=true)](https://ci.appveyor.com/project/r-hyperspec/hyperspec-skeleton)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Codecov test coverage](https://codecov.io/gh/r-hyperspec/hySpc.testthat/branch/master/graph/badge.svg)](https://codecov.io/gh/r-hyperspec/hySpc.testthat?branch=master)
<!-- badges: end -->


