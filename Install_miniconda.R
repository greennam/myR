# install.packages("multilinguer")
library(multilinguer)
has_conda() # error

install.packages("reticulate")
library(reticulate)

install_miniconda() # miniconda 3 incl conda-4.9.2, pip-20.2.4, python=3.6

install_conda() #Please install reticulate(>= 1.14) 
# package and use install_miniconda() function.

# test whether conda installed well
remotes::install_github("haven-jeon/KoSpacing")
# test result : OK
library(KoSpacing)
