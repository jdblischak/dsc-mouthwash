# To use conda-forge devtools to install from GitHub
# https://github.com/conda-forge/r-devtools-feedstock/issues/4
options(unzip = Sys.which("unzip"))
Sys.setenv(TAR = Sys.which("tar"))
# Set CRAN mirror
local({
  r = getOption("repos")
  r["CRAN"] = "https://cloud.r-project.org"
  options(repos = r)
})
