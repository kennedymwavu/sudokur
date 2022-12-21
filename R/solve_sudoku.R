#' Solve a sudoku
#'
#' This function solves any 9 by 9 sudoku board.
#'
#' @param board The 9 by 9 sudoku grid in form of a numeric matrix.
#' @seealso `sample_boards()`, `easy_solve()`
#' @return Invisibly returns a logical vector of length 1.
#' `FALSE` if the sudoku board is insolvable.
#' @export
#' @examples
#' b3 <- sample_boards()[[1]]
#' print_board(b3)
#' solve_sudoku(b3)

# main:
solve_sudoku <- function(board) {
	find <- find_empty(board)

	# if there's no empty box, print the filled board and return True
	if (is.null(find)) {
	  print_board(board)
	  return(invisible(TRUE))
	}

	row <- find[[1]]
	col <- find[[2]]

	for (i in 1:9) {
		if (valid(board, i, row, col)) {
			board[row, col] <- i

			# Recall that solve has a return value of either TRUE or FALSE.
			# If the return value is TRUE, then return TRUE to the previous caller, else
			# (re)set that cell to 0.
			if (solve_sudoku(board)) return(invisible(TRUE))
			board[row, col] <- 0
		}
	}
	return(invisible(FALSE))
}



