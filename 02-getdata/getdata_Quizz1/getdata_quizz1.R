quizz <- function() {
  housing <- loadUrl("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
                     "getdata-data-ss06hid.csv")
  print(c("Question 1:", question1(housing)))
  
  gas <- loadXlsUrl("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
                    "getdata-data-gas.xlsx")
  print(c("Question 3:", question3(gas)))
  
  restaurants <- loadXmlUrl("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
                            "getdata-data-restaurants.xml")
  print(c("Question 4:", question4(restaurants)))
  
  housingPid <- loadUrl("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
                        "getdata-data-ss06pid.csv")
  print(c("Question 5:", question5(housingPid)))
  
}
# How many properties are worth $1,000,000 or more? 
# VAL Property value. 24 .$1000000+
question1 <- function(data) {
  nrow(data[data$VAL ==24])
}

# What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)
question3 <- function(dat) {
  sum(dat$Zip*dat$Ext,na.rm=T)
}

question4 <- function(data) {
  zipCodes <- xpathSApply(xmlRoot(data), "//zipcode", xmlValue)
  length(zipCodes[which(zipCodes == "21231")])
}

question5 <- function(DT) {
  print(c("DT[,mean(pwgtp15),by=SEX] :", DT[,mean(pwgtp15),by=SEX], system.time(replicate(100, DT[,mean(pwgtp15),by=SEX]))))
  print(c("{mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)} :", mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15), system.time(replicate(100, {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))))
  print(c("sapply(split(DT$pwgtp15,DT$SEX),mean) :", sapply(split(DT$pwgtp15,DT$SEX),mean), system.time(replicate(100, sapply(split(DT$pwgtp15,DT$SEX),mean)))))
  print(c("tapply(DT$pwgtp15,DT$SEX,mean) :", tapply(DT$pwgtp15,DT$SEX,mean), system.time(replicate(100, tapply(DT$pwgtp15,DT$SEX,mean)))))
  #system.time(replicate(1000, {rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))
  #system.time(replicate(1000, mean(DT$pwgtp15,by=DT$SEX)))
  ""
}

download <- function(url, filename) {
  if(!file.exists(filename)) {
    download.file(url, filename)
  }
}

loadUrl <- function(url, filename) {
  pkg('data.table')
  download(url, filename)
  fread(filename)
}

loadXlsUrl <- function(url, filename, sheetIndex=1, header=T, colIndex=7:15, rowIndex=18:23) {
  pkg('xlsx')
  download(url, filename)
  read.xlsx(filename, sheetIndex=sheetIndex, header=header, colIndex=colIndex, rowIndex=rowIndex)
}

loadXmlUrl <- function(url, filename) {
  pkg('XML')
  download(url, filename)
  xmlTreeParse(filename, useInternal = TRUE)
}

pkg <- function(pkgname) {
  if (!require(pkgname, character.only = TRUE)) {
    install.packages(pkgname, dependencies = TRUE)
    require(pkgname, character.only = TRUE)
  }
}
