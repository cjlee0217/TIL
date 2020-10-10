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

# Sex vs Survived
sex_survived<-train %>% group_by(Sex, Survived) %>%  
  summarise(Count=n()) %>% 
  mutate(Ratio=Count/sum(Count))
sex_survived

ggplot(sex_survived, aes(x=Sex, y=Count, fill=factor(Survived)))+
  geom_col(position='dodge')+
  scale_fill_discrete('Survived')+
  ggtitle("Sex vs Survived")

ggplot(sex_survived, aes(x=Sex, y=Ratio, fill=factor(Survived)))+
  geom_col(position='dodge')+
  scale_fill_discrete('Survived')+
  ggtitle("Sex vs Survived: Ratio")


# Compare the average age of survived and not survived groups
summary(train$Age)

ggplot(train, aes(Age, fill=factor(Survived)))+
  geom_histogram(bins=30)+
  xlab('Age')+
  scale_fill_discrete(name="Survived")+
  ggtitle("Age vs Survived")

train %>% filter(!is.na(Age)) %>% 
  group_by(Survived) %>% 
  summarise(mean(Age))
# -> The survived group is younger (28.3) than the other group (30.6).


