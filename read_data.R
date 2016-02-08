## Script to pull example data from the web and prepare it for plotting

# Load libraries
library(httr) 

# set basic variables
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_dir <- "data"
plots_dir <- "plots"
zipfile <- "household_power_consumption.zip"
txtfile <- "household_power_consumption.txt"

# create dirctories if they don't exist yet
if(!file.exists(data_dir)){
  dir.create(data_dir)
} 

if(!file.exists(plots_dir)){
  dir.create(plots_dir)
}

# download file (if not done before)
download <- paste(data_dir, zipfile, sep = "/")
if(!file.exists(download)){
  download.file(url, download, method="curl")
}

# unpack file (if not done befor)
unzipped <- paste(data_dir, txtfile, sep = "/")
if(!file.exists(unzipped)){
  unzip(download, list = FALSE, overwrite = FALSE, exdir = data_dir)
}

data <- read.table(unzipped, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

data2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

