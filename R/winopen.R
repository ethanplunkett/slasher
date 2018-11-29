#' Function to open a file or directory
#'
#' This function will open the target path, \code{x},  with it's associated
#' application, or with Windows Explorer if \code{x} is a directory
#'
#' If the file or directory does not exist it will open the first parent
#' directory that does exists.
#'
#' @param x A folder or file to be opened.
#'
#' @return This function is primarily called for the side effect of opening a
#' file or directory It invisibly returns a normalized path to the item it
#' opened, which is either \code{x} or a parent directory that exists on disk.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Open the R directory
#' winopen("C:/Program Files/R/")
#'
#' # Plot to a file and then open the file
#' f <- tempfile(fileext = ".png")
#' png(f)
#' plot(1, 1)
#' dev.off()
#' winopen(f)
#' }
winopen <- function(x){
  if(missing(x)|| is.na(x) || is.null(x)) x <- getwd()
  stopifnot(is.character(x), length(x) == 1)
  x <- normalizePath(x, winslash = "\\", mustWork = FALSE)
  x <- gsub("\\\\$", "", x) # trim trailing slash
  # Check to see if the file (or dir) exists if not
  while(!file.exists(x) & grepl("\\\\", x)){
      x <- gsub("\\\\[^\\\\]*$", "", x) # step up a folder
  }
  shell(paste("explorer", x), intern = FALSE, wait = FALSE)

  return(invisible(normalizePath(x, winslash = "/", mustWork = FALSE)))
}
