# hySpc.testthat

## Acknowledgements
The `hyperSpec` team gratefully acknowledges support from the Google Summer of Code program, which sponsored student Erick Oduniyi during summer 2020.
Erick and the team carried out a significant overhaul of `hyperSpec` which led to this release.

# version 0.2.1

## User-visible Changes

- function `test<-()` assigns unit test code to objects (functions) as attribute `"test"`
- function `get_test()` retrieves `"test"` attribute
- function `test_fun()` retrieves `"test"` attribute and executes unit test
- function `unittest()` retrieves all `"test"` attributes and executes these unit tests
- for example code to run `unittest()` by `devtools::test()` & Co., see the `tests/` and `tests/testthat/` directories.
 