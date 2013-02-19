reports
=======
![qdapicon](https://dl.dropbox.com/u/61803503/reports.png)   
reports is package to assist in writing apa6 style reports and presentations.  The package is designed to be used with [RStudio](http://www.rstudio.com/), [knitr](http://yihui.name/knitr/) and [Pandoc](http://johnmacfarlane.net/pandoc/).  The user will want to download these free programs to maximize the effectiveness of the reports package.

## Installation

Currently there isn't a release on [CRAN](http://cran.r-project.org/).


You can, however, download the [zip ball](https://github.com/trinker/reports/zipball/master) or [tar ball](https://github.com/trinker/reports/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
# install.packages("devtools")

library(devtools)
install_github("reports", "trinker")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.

## Help

For the package pdf help manual [click here](https://dl.dropbox.com/u/61803503/reports.pdf).

## Note

Users will need to install [Pandoc ](http://johnmacfarlane.net/pandoc/) in order to use the html5 function.

