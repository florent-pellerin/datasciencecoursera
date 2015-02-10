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

csvToDf <- function(url, filename) {
  download(url, filename)
  read.csv(filename)
}

fwToDf <- function(url, filename) {
  download(url, filename)
  read.fwf(filename, widths = c(10,9,4,9,4,9,4,9,4), skip=4)
}

question1 <- function() {
  pkg("jsonlite")
  q1data <- fromJSON("https://api.github.com/users/jtleek/repos")
  print(c("Question1:", q1data[which(q1data$name == "datasharing"),]$created_at))
}

question2 <- function() {
  pkg("sqldf")
  acs <- csvToDf("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "getdata-data-ss06pid.csv")
  sqldf("select pwgtp1 from acs where AGEP < 50")
  print(c("Question2:", 'sqldf("select pwgtp1 from acs where AGEP < 50")'))
}

question3 <- function() {
  pkg("sqldf")
  acs <- csvToDf("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "getdata-data-ss06pid.csv")
  sqldf("select distinct AGEP from acs")
  print(c("Question3:", 'sqldf("select distinct AGEP from acs")'))
}

question4 <- function() {
  con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
  lines <- readLines(con)
  close(con)
  print(c("Question4:", nchar(lines[10]), nchar(lines[20]), nchar(lines[30]), nchar(lines[100])))
}

question5 <- function() {
  q5data <- fwToDf("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "getdata-Fwksst8110.for")
  print(c("Question5:", sum(q5data[,4])))
}

print("GetData Quizz2")
question1()
question2()
question3()
question4()
question5()
