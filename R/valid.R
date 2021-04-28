#' check if a number can be placed in a certain position.
#'
#' This function checks if the provided number can be placed in the specified row and
#' column in adherence to the rules of the sudoku game.
#'
#' @param board A 9 by 9 sudoku grid
#' @param num A number in 1:9
#' @param row specified row
#' @param col specified column
#' @return TRUE or FALSE indicating if placement is valid or not.
#' @export
#' @examples
#' b2 <- sample_boards()[[5]]
#' valid(b2, 7, 4, 8)


valid <- function(board, num, row, col) {
  # check row:
  if ( num %in% board[row, ]) return(FALSE)

  # check col:
  if (num %in% board[ , col]) return(FALSE)

  # check box:
  if (num %in% get_box(board, row, col)) return(FALSE)

  # if num passes all the above checks then it is valid:
  return(TRUE)
}
