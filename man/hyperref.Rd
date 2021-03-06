\name{HR}
\alias{BT}
\alias{HR}
\alias{HR2}
\title{Convert path/url to HTML href Tag}
\usage{
HR(path = "clipboard", text = NULL, new_win = FALSE,
  copy2clip = interactive(), print = FALSE)

HR2(path = "clipboard", text = NULL, new_win = TRUE,
  copy2clip = interactive(), print = FALSE)

BT(path = "clipboard", text = NULL, new_win = FALSE,
  copy2clip = interactive(), print = FALSE)
}
\arguments{
  \item{path}{A character vector url/path copied to the
  clipboard. Default is to read from the clipboard.  Note
  that Windows users do not have to reorient slashes in
  local paths if reading from the clipboard.}

  \item{text}{A character vector of text to hyperref from.
  Defualt uses the \code{\link[base]{basename}} of the
  path.}

  \item{new_win}{logical.  If \code{TRUE} the link will
  open in a new window.}

  \item{copy2clip}{logical.  If \code{TRUE} attempts to
  copy the output to the clipboard.}

  \item{print}{logical.  If \code{TRUE}
  \code{\link[base]{cat}} prints the output to the console.
  If \code{FALSE} returns to the console.}
}
\value{
Returns a character vector of an HTML href tag.
}
\description{
\code{HR} - Wrap a path/url to generate an HTML href tag.

\code{HR2} - Convenience version of \code{HR} with
\code{new_win} set to \code{TRUE}.

\code{BT} - Wrap a path/url to generate an HTML hyperlinked
text button tag.
}
\examples{
## HR("assets/img/fry_admin_1.mp4","new")

HR(path="http://dl.dropbox.com/u/61803503/Likert.pdf", print = TRUE)
HR("http://cran.r-project.org/", print = TRUE)
HR("http://www.rstudio.com/ide/download/desktop", "click me", print = TRUE)
HR2("https://github.com/trinker/reports", "reports", print = TRUE)
BT("http://trinker.github.io/reports/dependencies", "Click Here!", print = TRUE)
}
\references{
\url{http://www.w3schools.com/tags/att_a_href.asp}

\url{http://www.w3schools.com/tags/tag_button.asp}
}

