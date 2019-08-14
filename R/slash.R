#' @name slasher
#' @aliases bslash
#' @aliases fslash
#'
#' @title Edit the slash type of the path that is currently in the clipboard
#' @description
#' \code{fslash} converts slashes in the clipboard to forward slashes;
#' \code{bslash} converts slashses in the clipboard to back slashes.
#'
#' Both of these functions are designed to be used while copying and pasting
#' paths between R and other applications on a Windows system. For example you
#' could copy a path from Windows Explorer, run \code{fslash()} and then paste
#' the modfied path into R. Conversely you could copy a path from your R code
#' run \code{bslash()} and then paste into Explorer or other applications that
#' expect a backslash.
#' @importFrom utils writeClipboard readClipboard
#' @export
#' @rdname slasher
fslash <- function(){
  utils::writeClipboard(gsub("\\\\+", "/", utils::readClipboard()))
}

#' @export
#' @rdname slasher
bslash<- function(){
  utils::writeClipboard(gsub("/+", "\\\\", utils::readClipboard()))
}
