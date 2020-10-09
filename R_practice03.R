library(dplyr)
library(proxy)
teens<-read.csv("Data/snsdata.csv")
str(teens)

## age 결측값 대체: 졸업 연도에 해당되는 age열 평균값으로 대체
summary(teens$age)
str(teens)

teens$age<-ifelse(teens$age>=13 & teens$age<=20, teens$age, NA)
summary(teens$age)

ave_age<-ave(teens$age, teens$gradyear, FUN=function(x) mean(x, na.rm=TRUE))
teens$age<-ifelse(is.na(teens$age), ave_age, teens$age)

summary(teens$age)


# Q1. gender를 다른 값으로 대체 -------------------------------------------#####
# na 값을 갖는 학생과 가장 유사한(거리) 학생 10명 검색 -> 성별 판단 = 클러스터링
table(teens$gender, useNA="ifany") # gender 컬럼 NA개수: 2724

colnames(teens[4:40])
View(teens)

# female 컬럼: F이면서 NA가 아니면 , 그렇지 않으면 남성(0)
teens$female<-ifelse(teens$gender=="F" & !is.na(teens$gender), 1, 0)
table(teens$female, useNA="ifany")

# male 컬럼: M이면서 NA가 아니면 , 그렇지 않으면 여성(0)
teens$male<-ifelse(teens$gender=="M" & !is.na(teens$gender), 1, 0)
table(teens$male, useNA="ifany")

# no_gender 컬럼: gender가 NA이면 1 아니면 0
teens$no_gender<-ifelse(is.na(teens$gender), 1 , 0)
table(teens$no_gender, useNA="ifany")

# gender==NA인 데이터 & 거리 측정하기
no_gender_df<-teens %>% filter(is.na(gender))
sample<-no_gender_df[1,3:40]

yes_gender_df<-teens %>% filter(!is.na(gender))
temp<-rbind(sample, yes_gender_df[3:40])
dist(temp, method="euclidean") # => 오류: 연산이 너무 오래 걸림




# Q2. 모델 파라미터 조정(n-start 등)



# Q3. 각 클러스터 해석(using aggregate())
#???  ~ cluster  => 해석 결과를 문장으로 작성
#4. wine 데이터 클러스터링