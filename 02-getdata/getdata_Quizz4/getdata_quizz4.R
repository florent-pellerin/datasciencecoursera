pkg <- function(pkgname) {
  if (!require(pkgname, character.only = TRUE)) {
    install.packages(pkgname, dependencies = TRUE)
    require(pkgname, character.only = TRUE)
  }
}

download <- function(url, filename) {
  if(!file.exists(filename)) {
    download.file(url, filename)
  }
}

csvToDf <- function(url, filename, ...) {
  download(url, filename)
  read.csv(filename, ...)
}

question1 <- function() {
  acs <- csvToDf("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "getdata-data-ss06hid.csv")
  namesSplit <- lapply(names(acs), strsplit, 'wgtp')
  print(c("Question1:", namesSplit[123]))
}

question2 <- function() {
  gdp <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', 'getdata-data-GDP.csv', skip = 4, nrows = 190)
  removeCommas <- function(x) {
    gsub(',', '', x)
  }
  print(c("Question2:", mean(sapply(sapply(gdp$X.4, removeCommas), as.numeric))))
}

question3 <-function() {
  gdp <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', 'getdata-data-GDP.csv', skip = 4, nrows = 190)
  countryNames <- levels(gdp$X.3)
  print(c("Question3:", 'grep("^United",countryNames)', length(grep("^United",countryNames))))
}

question4 <-function() {
  gdp <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', 'getdata-data-GDP.csv', skip = 4, nrows = 190)
  edu <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', 'getdata-data-EDSTATS_Country.csv')
  merged <- merge(gdp, edu, by.x = 'X', by.y = 'CountryCode')
  print(c("Question4:",length(grep('Fiscal year end: June', merged$Special.Notes))))
}

question5 <-function() {
  pkg('quantmod')
  amzn <- getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes <- index(amzn)
  sampleTimes2012<- grep("^2012-", sampleTimes, value = TRUE)
  sampleTimes2012AsDate <- as.Date(sampleTimes2012, "%Y-%m-%d")
  print(c("Question5:", length(sampleTimes2012), sum(weekdays(sampleTimes2012AsDate) == "Monday")))
}

print("GetData Quizz4")
question1()
question2()
question3()
question4()
question5()
