# {SudokuR}
Solve Sudoku.

The package is designed to solve any 9 by 9 sudoku grid.

<<<<<<< HEAD
# Installing
=======
## Installing
>>>>>>> 814a606fa1636726c6da91bcdbb6850ee388e7e4
```R
#install.packages(devtools)
devtools::install_github("KennedyMwavu/SudokuR")
library(SudokuR)
```

<<<<<<< HEAD
# Usage
To show a few pre-compiled sudoku grids: 
=======
## Usage
To show a few pre-made sudoku grids: 
>>>>>>> 814a606fa1636726c6da91bcdbb6850ee388e7e4
```R
# The clean way:

# data(samples)
samples$board8
samples$board0

# You can also use `sample_boards()` but it might be a lot of work:
sample_boards()[[1]]
sample_boards()[c(1:5)] 

# many boards clutter your console, so you can just assign to an object:
b1 <- sample_boards()[c(1:6]
```

To make your own customized "sudoku" which you can view and solve with the functions available in this package, create a 9 by 9 matrix with zeros representing the empty spaces in your sudoku.
Example:
```R
board1 = matrix(data =
                       c(5, 6, 0, 8, 4, 7, 0, 0, 0,
                         3, 0, 9, 0, 0, 0, 6, 0, 0,
                         0, 0, 8, 0, 0, 0, 0, 0, 0,
                         0, 1, 0, 0, 8, 0, 0, 4, 0,
                         7, 9, 0, 6, 0, 2, 0, 1, 8,
                         0, 5, 0, 0, 3, 0, 0, 9, 0,
                         0, 0, 0, 0, 0, 0, 2, 0, 0,
                         0, 0, 6, 0, 0, 0, 8, 0, 7,
                         0, 0, 0, 3, 1, 6, 0, 5, 9
                       ),
                     ncol = 9)
```

<<<<<<< HEAD
To view a bunch of pre-made boards run `samples`. It's a list of grids.
Example:
```R
# data(samples)
samples$7
samples$2
```

To pretty print a sudoku so that it doesn't appear as an ugly R matrix use `print_board(given_board)`.
Example:
```R
print_board(samples$board8)
```

To solve ANY sudoku (whether custom made or pre-made by me) use `solve_sudoku(given_board)`.
Example:
```R
solve_sudoku(samples$board6)
```

`easy_solve()` can solve easy and some medium hard sudokus faster than `solve_sudoku()` but it is unstable. This is brought about by differences in the way numbers can be placed in sudoku grids. See `?easy_solve`.
Example:
```R
easy_solve(board = samples$board0)
=======
To pretty print a sudoku so that it doesn't appear as an ugly R matrix:
```R
print_board(board1)
```

Finally to solve a sudoku (whether custom made or pre-made by me):
```R
#solve_sudoku(board)
solve_sudoku(board1)
>>>>>>> 814a606fa1636726c6da91bcdbb6850ee388e7e4
```
