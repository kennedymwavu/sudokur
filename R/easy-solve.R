#' Solve easy sudokus
#'
#' This function is designed strictly to solve easy sudokus ie. ones with more than
#' 36 clues, but it can sometimes solve medium hard sudokus (27 to 36 clues).
#'
#' It solves the sudoku deterministically and might be faster than `solve_sudoku()`, but
#' it has two major drawbacks:
#' can't determine if a sudoku  is solvable and can't also determine if it can solve
#' a given sudoku. If it takes more than 2 seconds please use `solve_sudoku()`.
#'
#' Use carefully.
#' @import magrittr
#' @inheritParams solve_sudoku
#' @return if sudoku is solvable it returns TRUE
#' @export
#' @seealso `solve_sudoku()`
#' @examples
#' b2 <- sample_boards()[[2]]
#' easy_solve(b2)


# Step 1: Understanding the problem.
# ------------------------------------

# Rules:
#	1. Each column, row, and 3*3 box must've the numbers 1 through 9.
#	2. No repetitions allowed in a single row, column or box.


# Step 2: Algorithm.
# --------------------

# - Represent empty boxes with zeroes.
# - Iterate row-wise. ie. downwards.

# Algorithm:
# while there is a zero in your sudoku:
#	For any zero:
#		1. Assign all possibilities (1-9) to an object p, ie. p <- 1:9
#		2. Check for non-zeroes on the same row, column and box as the zero, find their unique values and assign them an object q.
#		   Elements in q will be their own indices in p.
#		3. Remove elements in q from p, and assign the result an object r, ie. r <- p[-q].
#		4. If length of r is 1, replace the zero with the element in r.
# else:
# If the zero is the only zero in that box's row/column then:
# check for presence of each element in r in the other two rows/columns of the box and board.
# If the element is present in the other two rows/columns then:
#  replace the zero with the element.
#		5. Repeat steps 1-4 iteratively until there's no zero in your sudoku.


# Note: The algorithm can only solve easy (and probably medium hard) sudokus.

easy_solve <- function(board) {
  while (0 %in% board) {

    for (column in 1:9) {
      for (row in 1:9) {

        if (board[row, column] == 0) {
          p <- 1:9                    # possibilities
          row_i <- board[row, ]       # row of the zero
          col_j <- board[ , column]   # column of the zero

          # box:
          if (column < 4) {
            if (row < 4) {
              box <- board[1:3, 1:3]
            }else{
              if (row < 7) {
                box <- board[4:6, 1:3]
              }else{
                box <- board[7:9, 1:3]
              }
            }
          }else{
            if (column < 7) {
              if (row < 4) {
                box <- board[1:3, 4:6]
              }else{
                if (row < 7) {
                  box <- board[4:6, 4:6]
                }else{
                  box <- board[7:9, 4:6]
                }
              }
            }else{
              if (row < 4) {
                box <- board[1:3, 7:9]
              }else{
                if (row < 7) {
                  box <- board[4:6, 7:9]
                }else{
                  box <- board[7:9, 7:9]
                }
              }
            }
          }

          # q:
          box %<>% as.vector()
          q <- c(row_i, col_j, box) %>% unique()
          q <- q[!(q == 0)]

          # r:
          r <- p[-q]

          if (length(r) == 1) {
            board[row, column] <- r
          }else{
            box %<>% matrix(data = ., ncol = 3)

            # get box row. Can only be 1, 2, or 3:
            if (row %in% c(1, 4, 7)) {
              box_row <- 1
            }else{
              if (row %in% c(2, 5, 8)) {
                box_row <- 2
              }else{
                box_row <- 3
              }
            }

            # check if it's the only zero in the row:
            if ({(box[box_row, ] == 0) %>% sum()} == 1) {     # returns 1 iff there's one TRUE.

              # the other 2 rows of box/board:
              if (box_row == 1) {
                other_2_rows <- board[(row + 1):(row + 2), ] %>% as.vector()
              }else{
                if (box_row == 2) {
                  other_2_rows <- board[c(row - 1, row + 1), ] %>% as.vector()
                }else{
                  other_2_rows <- board[c(row - 1, row - 2), ] %>% as.vector()
                }
              }


              for (element in r) {
                # check if element appears twice in other_2_rows ie. in both rows.
                if ({(element == other_2_rows) %>% sum()} == 2) {
                  board[row, column] <- element
                  break
                }
              }
            }else{

              # get box column. Can only be 1, 2, or 3.
              if (column %in% c(1, 4, 7)) {
                box_column <- 1
              }else{
                if (column %in% c(2, 5, 8)) {
                  box_column <- 2
                }else{
                  box_column <- 3
                }
              }

              # check if it's the only zero in the column:
              if ({(box[ , box_column] == 0) %>% sum()} == 1) {

                # the other 2 columns:
                if (box_column == 1) {
                  other_2_columns <- board[ , (column + 1):(column + 2)] %>% as.vector()
                }else{
                  if (box_column == 2) {
                    other_2_columns <- board[ , c(column - 1, column + 1)] %>% as.vector()
                  }else{
                    other_2_columns <- board[ , c(column - 1, column - 2)] %>% as.vector()
                  }
                }

                for (element in r) {
                  # check if element appears twice in other_2_columns ie. in both columns.
                  if ({(element == other_2_columns) %>% sum()} == 2) {
                    board[row, column] <- element
                    break
                  }
                }
              }

            }

          }

        }
      }

    }

  }
  print_board(board)
  return(TRUE)
}



