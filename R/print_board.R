#' Pretty print a sudoku board
#'
#' This function prints a 9 by 9 sudoku board in a way that is appealing to the eye,
#' rather than an R matrix.
#'
#' @param board A sudoku board/grid.
#' @export
#' @return `board` (invisibly)
#' @examples
#' # sample board:
#' board <- matrix(data =
#'                  c(5, 6, 0, 8, 4, 7, 0, 0, 0,
#'                    3, 0, 9, 0, 0, 0, 6, 0, 0,
#'                    0, 0, 8, 0, 0, 0, 0, 0, 0,
#'                    0, 1, 0, 0, 8, 0, 0, 4, 0,
#'                    7, 9, 0, 6, 0, 2, 0, 1, 8,
#'                    0, 5, 0, 0, 3, 0, 0, 9, 0,
#'                    0, 0, 0, 0, 0, 0, 2, 0, 0,
#'                    0, 0, 6, 0, 0, 0, 8, 0, 7,
#'                    0, 0, 0, 3, 1, 6, 0, 5, 9
#'                  ),
#'                ncol = 9)
#' print_board(board)

# create a function to pretty print the board.

# Let's visualize the board as indices from 1 to 81 row-wise:
# 1  2   3  ||  4  5  6  ||  7  8   9
# .
# .
# .
# 19 20 21  ||  22 23 24  || 25 26 27
# _____________________________________
# .
# .
# .
# 73 74 75  ||  76 77 78  ||  79 80 81

# Now all we have to do is manipulate those indices to print the board as we want:
print_board <- function(board) {
  a <- 1:9    # left rows
  b <- 73:81  # right rows
  c <- integer(length = 81) # needed indices vector
  d <- 1:81                 # indices to extract elements from c
  for (i in seq_along(a)) {
    # take the first 9 elements of d as indices and extract them from c. since c has
    # only zeroes, we replace the zeroes with the required sequence of numbers.
    c[d[1:9]] <- seq(from = a[i], to = b[i], by = 9)

    # then remove the first 9 elements of d so that the next 9 elements take the first
    # place
    d <- d[-c(1:9)]
  }


  # let's store the vector board in 'boardv':
  boardv <- board[c]

  # col sep vector:
  colsep <- c(seq(from = 3, to = 75, by = 9), seq(from = 6, to = 78, by = 9))

  # line breaks sep:
  linebreaks <- seq(from = 9, to = 81, by = 9)

  # dotted line:
  dotted <- c(27, 54)
  for (i in seq_along(boardv)) {
    cat(boardv[i], " ")

    # column separator:
    if (i %in% colsep) {
      cat(" ||  ")
      next
    }

    # dotted line:
    if (i %in% dotted) {
      cat("\n___________________________________\n\n")
      next
    }

    # line breaks:
    if (i %in% linebreaks) {
      cat("\n")
    }
  }

  return(invisible(board))
}
