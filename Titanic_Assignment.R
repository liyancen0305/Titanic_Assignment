
#1. load the csv file in RStudio into a data frame
myDataFile <- "C:/Users/Lishuang Cen/My Documents/Sandbox/Capstone Project/Titanic/Titanic_Assignment/titanic_original.csv"
titanic_Original <- read.table(myDataFile, header = TRUE, sep = ",")

#2. for embarked column, replacing the missing value with "S".( using "ifelse")
#titanic_Original$embarked <- ifelse(titanic_Original$embarked==' ', 'S', titanic_Original$embarked)
titanic_Original$embarked[titanic_Original$embarked == '']<- "S"

#3. populate the age for the age column,(na.rm = TRUE, to calculate the nonmissing values only)
average_age <- mean(titanic_Original$age, trim = 0, na.rm = TRUE)
titanic_Original$age <- ifelse(is.na(titanic_Original$age), average_age, titanic_Original$age)

#4.for the boat column,
titanic_Original$boat[titanic_Original$boat == ""]<- "None"

#5. create a new column - has_cabin_number (binary)
titanic_Original$has_cabin_number <- ifelse(titanic_Original$cabin == "", "0", "1")

#6. titanic_clean.csv
titanic_Clean <- titanic_Original
write.table(titanic_Clean, "C:/Users/Lishuang Cen/My Documents/Sandbox/Capstone Project/Titanic/Titanic_Assignment/titanic_clean.csv")
