#========================
# Delete manuals Rd files
#========================
mans <- file.path(getwd(), "man")
delete(file.path(mans, dir(mans)))
#==========================
#move project directions
#==========================
outpdf <- paste0(getwd(), "/inst/extdata/docs/")
inpdf <- paste0(getwd(), "/inst/pdf_gen/REPORT_WORKFLOW_GUIDE.pdf")
file.copy(inpdf, outpdf,, TRUE)
file.copy(inpdf, "C:/Users/trinker/Dropbox/Public/packages",, TRUE)

#================================
#download slidify examples
#================================
loc <- "C:/Users/trinker/GitHub/slidifyExamples/examples"
nms <- dir(loc)
lapply(nms, function(x) {
    fl <- file.path(loc, x, "index.Rmd")
    dest <- "C:/Users/trinker/GitHub/reports/inst/extdata/slidify_library/full"
    suppressWarnings(invisible(file.copy(fl, dest, TRUE, TRUE)))
    file.rename(file.path(dest, "index.Rmd"), file.path(dest, paste0(x, ".Rmd")))
})

lapply(nms, function(x) {
    fl <- file.path(loc, x, "index.Rmd")
    dest <- "C:/Users/trinker/GitHub/reports/inst/extdata/slidify_library/min"
    suppressWarnings(invisible(file.copy(fl, dest, TRUE, TRUE)))
    file.rename(file.path(dest, "index.Rmd"), file.path(dest, paste0(x, ".Rmd")))
})

#=========================
#access to internal tools 
#=========================
wheresPandoc <- reports:::wheresPandoc
mgsub <- reports:::mgsub
genX <- reports:::genX
genXtract <- reports:::genXtract
Trim <- reports:::Trim

#==========================
#Check spelling
#==========================
path <- file.path(getwd(), "R")
txt <- suppressWarnings(lapply(file.path(path, dir(path)), readLines))
txt <- lapply(txt, function(x) x[substring(x, 1, 2) == "#'"])
new <- lapply(1:length(txt), function(i){
    c("\n", dir(path)[i], "=========", txt[[i]])
})
out <- paste(unlist(new), collapse="\n")
cat(out, file=file.path(path.expand("C:/Users/trinker/Desktop"), "spelling.doc"))

#==========================
#Get Examples to run
#==========================
library(acc.roxygen2)
examples(path = "C:/Users/trinker/GitHub/reports/R/")

#==========================
#Install Needed Packages
#==========================
library(pacman)
p_load(pander, qdap, installr, ProjectTemplate, slidify)

#=========================
# update dependencies page
#=========================
depends <- readLines(file.path(getwd(), "inst/dependencies/dependencies.html"))
top <- readLines(file.path(getwd(), "inst/dependencies/top_part.html"))
new <- depends[which(grepl("</head>" , depends)):length(depends)]
cat(paste(c(top, new), collapse="\n"), file=file.path(getwd(), "inst/dependencies/dependencies.html"))

#========================
#staticdocs dev version
#========================
#packages
# install.packages("highlight"); library(devtools); install_github("staticdocs", "hadley")

library(highlight); 
library(staticdocs)

#STEP 1: create static doc  
build_package(package="C:/Users/trinker/GitHub/reports", 
    base_path="C:/Users/trinker/Desktop/reports_dev/", examples = TRUE)

library(reports); library(qdap); library(acc.roxygen2)
#STEP 2a: reshape index
path <- "C:/Users/trinker/Desktop/reports_dev"
path2 <- paste0(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/reports/inst/extra_statdoc/readme.R"
expand_statdoc(path2, readme = rdme, 
    to.icon = c("sync_img", "sync_rnp", "sync_all", "VS", "VM", "VD", "IM2", "IW", 
    "HR2", "BT", "PF", "slidify_templates", "css_styles", "css_style_change",
    "run_lh", "append_vignette", "TB2", "css_style_add", "read.web", "write.web",
    "IMF", "IM_MO"))

## Step 2b: Fix is.global FALSE
ISG <- file.path(path, "is.global.html")
ISGin <- suppressWarnings(readLines(ISG))
FIX <- grep("<div class='input'>is.global()", ISGin) + 2
ISGin[FIX] <- "<div class='output'>[1] TRUE"
cat(paste(ISGin, collapse="\n"), file=ISG)

#STEP 2c: copy js/css dependencies
file.copy("C:/Users/trinker/GitHub/reports/inst/extdata/core_REPORT/js/reports.js", 
	file.path(path, "js"))
js1 <- "\n<script type=\"text/javascript\" src=\"./js/reports.js\"></script>"
t1 <- suppressWarnings(readLines(file.path(path, "image.html")))
val1 <- max(which(grepl("<link href=", t1)))
t1[val1] <- paste0(t1[val1], js1)
cat(paste(t1, collapse = "\n"), file = file.path(path, "image.html"))

#STEP 3: move to trinker.github
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
delete(paste0(file, "reports_dev"))
file.copy(path, file, TRUE, TRUE)
delete(path)

#STEP 4: copy dependencies page to trinker.guthub
file2 <- "C:/Users/trinker/GitHub/trinker.github.com/reports_dev"
path2 <- "C:/Users/trinker/GitHub/reports/inst/dependencies/dependencies.html"
file.copy(path2, file2, TRUE, TRUE)


#==========================
#staticdocs current version
#==========================
#packages
library(highlight); library(staticdocs)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
#NOTE:  If this occurrs:
## Loading reports
## Error in importIntoEnv(pkgenv, exports, nsenv, exports) : 
##   cannot change value of locked binding for 'CA'
#
# RESTART AND DON"T LOAD QDAP
build_package(package="C:/Users/trinker/GitHub/reports", 
    base_path="C:/Users/trinker/Desktop/reports/", examples = TRUE)

library(reports); library(qdap); library(acc.roxygen2)
#STEP 2a: reshape index
path <- "C:/Users/trinker/Desktop/reports"
path2 <- paste0(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/reports/inst/extra_statdoc/readme.R"
#extras <- qcv(folder, QQ)
expand_statdoc(path2, readme = rdme, 
    to.icon = c("sync_img", "sync_rnp", "sync_all", "VS", "VM", "VD", "IM2", "IW", 
    "HR2", "BT", "PF", "slidify_templates", "css_styles", "css_style_change",
    "run_lh", "append_vignette", "TB2", "css_style_add", "read.web", "write.web",
    "IMF", "IM_MO"))

## Step 2b: Fix is.global FALSE
ISG <- file.path(path, "is.global.html")
ISGin <- suppressWarnings(readLines(ISG))
FIX <- grep("<div class='input'>is.global()", ISGin) + 2
ISGin[FIX] <- "<div class='output'>[1] TRUE"
cat(paste(ISGin, collapse="\n"), file=ISG)

#STEP 3: move to trinker.github
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
delete(paste0(file, "reports"))
file.copy(path, file, TRUE, TRUE)
delete(path)

#STEP 4: copy dependencies page to trinker.guthub
file2 <- "C:/Users/trinker/GitHub/trinker.github.com/reports"
path2 <- "C:/Users/trinker/GitHub/reports/inst/dependencies/dependencies.html"
file.copy(path2, file2, TRUE, TRUE)
#==========================
# 
#==========================
# Vignette copy
#==========================
#path <- file.path("C:/Users/trinker/GitHub", "reports_0.1.3.tar.gz")
#install.packages(path,  repos = NULL, type="source")

##  browseVignettes(package = 'reports')

#root <- system.file("doc/reports_vignette.html", package = "reports")
# root <- "C:/Users/trinker/GitHub/reports/vignettes/reports_vignette.html"
# new <- "C:/Users/trinker/Dropbox/Public/packages"
# file.copy(root, new, TRUE, TRUE)

#copy_vign()
#==========================
#
#==========================
#move project directions
#==========================
outpdf <- paste0(getwd(), "/inst/extdata/docs/")
inpdf <- paste0(getwd(), "/inst/pdf_gen/PROJECT_WORKFLOW_GUIDE.pdf")
file.copy(inpdf, outpdf,, TRUE)
file.copy(inpdf, "C:/Users/trinker/Dropbox/Public/packages",, TRUE)

#==========================
#copy slides
#==========================
inhtml <- file.path(getwd(), "qslide/PRESENTATION/index.html")
outhtml <- "C:/Users/trinker/Dropbox/Public/Slides/reports"
file.copy(inhtml, outhtml,, TRUE)

inhtml2 <- file.path(getwd(), "qslide/PRESENTATION/index.Rmd")
file.copy(inhtml2, outhtml,, TRUE)
fls <- file.path(outhtml, c("index.Rmd", "reports_quick_slides.txt"))
file.rename(fls[1], fls[2])


#==========================
# NEWS.md
#==========================
update_news()

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")

#==============================
# Copy from Current R to R_dev
#==============================
r2dev("reports")

#==============================
#QDAP UPDATE
#==============================
r2dev("qdap")


#==============================
#INSTALL DEPENDENCIES
#==============================
library(pacman);library(qdap)
x <- p_info(reports)
imps <- unlist(strsplit(bracketX(x["Imports"]), ", "))
suggs <- unlist(strsplit(bracketX(x["Suggests"]), ", "))
out <- lapply(c(imps, suggs), require, character.only=TRUE)



