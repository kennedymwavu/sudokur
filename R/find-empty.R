#' Find the first empty cell in a sudoku grid
#'
#' This function finds the next empty/unfilled cell in a sudoku grid. It starts from the
#' left topmost cell through all cells in that row then onto the next row and so on.
#'
#' @inheritParams print_board
#' @return A numeric vector giving the row and column of the empty cell. Returns NULL
#' if all cells are filled.
#' @export
#' @examples
#' find_empty(sample_boards()[[1]])
#'
find_empty <- function(board) {
  for (i in 1:nrow(board)) {
    for (j in 1:ncol(board)) {
      if (board[i, j] == 0) {
        return(c(i, j)) # row, col
      }
    }
  }

  return(NULL)  # if all boxes are filled.
}





