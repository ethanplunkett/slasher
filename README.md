# slasher

The goal of slasher is to facilitate working with paths with R in Windows

There are FIVE trivial functions: fslash, bslash, fclip, bclip, and winopen.   

fslash converts all slashes in the clipboard to forward slashes while bslash converts them to backslashes.  Use fslash before pasting a path into R and bslash before pasting a path from your R code into most other Windows software.

For example you could copy from Explorer, run fslash() in R, and then paste into an R code window. 

fclip and bclip are similar but take an argument that is a path and insert that 
path into the clipboard either with forward slashs (fclip) or backslashes (bclip).


winopen opens the target path with Explorer (directories) or the associated application (files). If the path doesn't exist it opens the first parent directory it finds that does exist.


## Installation

Use the code below to install slasher from github.  Note slasher depends on Windows and isn't useful on other OS's.

``` r
devtools::install_github("ethanplunkett/slasher")
```

## Example

This is an example of how to use slasher to modify a path while copying from explorer:

``` r
## First manually copy a path from explorer.

# Now convert any slashes to forward slashes
fslash()

## Now manually paste into R. 

```

winopen opens its target with Windows explorer or, for files, the application associated with the file.

I often use it after plotting to a file to inspect the result.

``` r
# Plot to a file and then open the file
f <- tempfile(fileext = ".png")
png(f)
plot(1, 1)
dev.off()
winopen(f)

# alternatively you could use bclip here to capture the path in the clipboard
# while converting to backslashes
bclip(f)

```

