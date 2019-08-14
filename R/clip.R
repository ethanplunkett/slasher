
#' @name clip
#' @aliases bclip
#' @aliases fclip
#'
#' @title Export an r object to the clipboard while converting the slashes
#' @description
#' \code{fclip} put x in the clipboard with forward slashes.
#' \code{bclip} put x in the clipboard with backward slashes.
#'
#' These are designed to allow you to export a path used in R to the clipboard.
#' I suspect \code{bclip()} to be more useful, and example  would be after
#' exporting a file you could then call bclip() on the same path to
#' subsequently paste that path in another windows application. In my case this
#' is often GIS data that I want to load into an interactive GIS application.
#'
#' @param x  A character string of a path to be exported
#' @importFrom utils writeClipboard readClipboard
#' @examples
#' f <- tempfile(fileext = ".png")
#' \dontrun{
#' png(f)
#' plot(1, 1)
#' dev.off()
#' }
#' bclip(f)  # back slash version of the file path is now in the clipboard
#'
#' @export
#' @rdname clip
bclip  <- function(x)
  writeClipboard(gsub("/", "\\\\", x))

#' @export
#' @rdname clip
fclip <-  function(x)
  writeClipboard(gsub("\\\\", "/",  x))
