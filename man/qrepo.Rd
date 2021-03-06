\name{qrepo}
\alias{qrepo}
\title{Quick Repository Template}
\usage{
qrepo(repo = "repo", github.user = getOption("github.user"),
  path = getwd(), open = is.global(2), github = FALSE)
}
\arguments{
  \item{repo}{A character vector naming the repo.}

  \item{github.user}{GitHub user name (character string).}

  \item{path}{The path to where the project should be
  created.  Default is the current working directory.}

  \item{open}{logical.  If \code{TRUE} the project will be
  opened in RStudio. The default is to test if \code{qrepo}
  is being used in the global environment, if it is then
  the project directory will be opened.}

  \item{github}{logical.  If \code{TRUE} the repo will be
  sent to public \href{https://github.com/}{GitHub}
  account.}
}
\value{
Creates a repository template.
}
\description{
Generate a basic repository template ready for GitHub.
}
\examples{
## qrepo("New")
}

