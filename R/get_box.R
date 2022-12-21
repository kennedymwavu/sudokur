#' Get the smaller 3 by 3 grid in a sudoku
#'
#' This function returns the 3 by 3 grid  on which specified row and column lie on a sudoku
#'
#' @param board A sudoku grid/board
#' @param row specified row
#' @param col specified column
#' @return A 3 by 3 numeric matrix
#' @export
#' @examples
#' b1 <- sample_boards()[[2]]
#' get_box(b1, 4, 6)

# return the current 3 by 3 box:
get_box <- function(board, row, col) {
  box_row <- ((row - 1) %/% 3) + 1
  box_col <- ((col - 1) %/% 3) + 1
  box <- board[(box_row * 3 - 2):(box_row * 3), (box_col * 3 - 2):(box_col * 3)]

  return(box)
}
