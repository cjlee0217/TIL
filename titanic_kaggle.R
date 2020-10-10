# Load packages
library(ggplot2)
library(dplyr)

# Load train.csv
train<-read.csv('titanic_kaggle/train.csv')

# Check data structure
str(train)

# Survived column
table(train$Survived, useNA='ifany')
# Plot
ggplot(data=train, aes(x=Survived))+geom_bar()

# Sex column
table(train$Sex, useNA='ifany')
# Plot
ggplot(data=train, aes(x=Sex))+geom_bar()

       