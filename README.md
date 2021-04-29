# {SudokuR}
Solve Sudoku.

The package is designed to solve any 9 by 9 sudoku grid.

## Installing
```R
#install.packages(devtools)
devtools::install_github("KennedyMwavu/SudokuR")
library(SudokuR)
```

## Usage
To show a few pre-made sudoku grids: 
```R
sample_boards()[[1]]
sample_boards()[c(1:5)] 
# many boards clutter your console, so you can just assign to an object:
b1 <- sample_boards()[c(1:6]
```

If you want to solve your own customized sudoku, create a matrix with empty spaces in your sudoku as zeroes. 
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

To pretty print a sudoku so that it doesn't appear as an ugly R matrix:
```R
print_board(board1)
```

Finally to solve a sudoku (whether custom made or pre-made by me):
```R
#solve_sudoku(board)
solve_sudoku(board1)
```
