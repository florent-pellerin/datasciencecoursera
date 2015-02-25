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
  agricultureLogical <- acs$ACR == 3 & acs$AGS == 6
  print(c("Question1:", which(agricultureLogical)[1:3]))
}

question2 <- function() {
  pkg('jpeg')
  download('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg', 'getdata-jeff.jpg')
  jpegData <- readJPEG('getdata-jeff.jpg', native = TRUE)
  print(c("Question2:", quantile(jpegData, probs = c(0.3, 0.8))))
}

questions3and4 <- function() {
  gdp <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', 'getdata-data-GDP.csv', skip = 4, nrows = 190)
  edu <- csvToDf('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', 'getdata-data-EDSTATS_Country.csv')
  merged <- merge(gdp, edu, by.x = 'X', by.y = 'CountryCode')
  print(c("Question3:", nrow(merged)))
  print(merged[with(merged, order(-X.1)),][13,4])
  
  print(c("Question4:", aggregate(X.1 ~ Income.Group, merged, mean)))
}


print("GetData Quizz3")
question1()
question2()
questions3and4()
