
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {sudokur}

<!-- badges: start -->
<!-- badges: end -->

This package is designed to solve any 9 by 9 sudoku grid using the
backtracking algorithm.

## Installation

You can install the development version of sudokur from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kennedymwavu/sudokur")
```

## Usage

### Include your own sudoku grids

To make your own customized sudoku puzzle which you can view and solve
with the functions available in this package, create a 9 by 9 matrix
with zeros representing the empty spaces in your sudoku.

Example:

``` r
board1 <- matrix(
  data = c(
    5, 6, 0, 8, 4, 7, 0, 0, 0,
    3, 0, 9, 0, 0, 0, 6, 0, 0,
    0, 0, 8, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 8, 0, 0, 4, 0,
    7, 9, 0, 6, 0, 2, 0, 1, 8,
    0, 5, 0, 0, 3, 0, 0, 9, 0,
    0, 0, 0, 0, 0, 0, 2, 0, 0,
    0, 0, 6, 0, 0, 0, 8, 0, 7,
    0, 0, 0, 3, 1, 6, 0, 5, 9
    ),
  ncol = 9
)
```

### Pretty print a sudoku grid

To pretty print a sudoku grid use `print_board(given_board)`.

Example:

``` r
print_board(board1)
#> 5  3  0   ||  0  7  0   ||  0  0  0  
#> 6  0  0   ||  1  9  5   ||  0  0  0  
#> 0  9  8   ||  0  0  0   ||  0  6  0  
#> ___________________________________
#> 
#> 8  0  0   ||  0  6  0   ||  0  0  3  
#> 4  0  0   ||  8  0  3   ||  0  0  1  
#> 7  0  0   ||  0  2  0   ||  0  0  6  
#> ___________________________________
#> 
#> 0  6  0   ||  0  0  0   ||  2  8  0  
#> 0  0  0   ||  4  1  9   ||  0  0  5  
#> 0  0  0   ||  0  8  0   ||  0  7  9
```

### Solve sudoku puzzles

To solve a sudoku puzzle `solve_sudoku(given_board)`.

Example:

``` r
solve_sudoku(samples$board6)
#> 2  3  1   ||  6  7  5   ||  4  8  9  
#> 5  8  7   ||  4  9  3   ||  2  6  1  
#> 6  4  9   ||  2  8  1   ||  7  5  3  
#> ___________________________________
#> 
#> 9  7  2   ||  1  6  4   ||  8  3  5  
#> 4  6  8   ||  5  3  9   ||  1  2  7  
#> 3  1  5   ||  8  2  7   ||  9  4  6  
#> ___________________________________
#> 
#> 7  5  4   ||  3  1  2   ||  6  9  8  
#> 8  9  3   ||  7  4  6   ||  5  1  2  
#> 1  2  6   ||  9  5  8   ||  3  7  4
```
