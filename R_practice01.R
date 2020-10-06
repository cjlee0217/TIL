library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg

# Q1. 
# displ<=4인 자동차의 hwy 평균과
# displ>=5인 자동차의 hwy 평균 비교
displ_4 <- mpg %>% filter(displ<=4)
displ_5 <- mpg %>% filter(displ>=5)
mean(displ_4$hwy)
mean(displ_5$hwy)
  
# Q2.
# manufacturer "audi"와 "toyota"의 cty(도시 연비) 평균 비교
mpg %>% 
  filter(manufacturer == "audi" | manufacturer == "toyota") %>% 
  group_by(manufacturer) %>% 
  summarise(mean(cty))

# Q3.
# "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균
mpg %>% 
  filter(manufacturer %in% c("chevrolet","ford","honda")) %>% 
  summarise(mean(hwy))

# Q4.
# class, cty 변수를 추출해 새로운 데이터를 만드세요. 
# 새로 만든 데이터의 일부를 출력하세요.
mpga <- mpg %>% select(class, cty)
head(mpga)

# Q5.
# class가 "suv"인 자동차와 "compact"인 자동차의 cty 비교
mpga %>% 
  filter(class %in% c("suv","compact")) %>%
  group_by(class) %>% 
  summarise(mean(cty))

# Q6.
# "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차 출력
head(mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)),5)

# Q7.
# mpg 데이터 복사본을 만들고 
# cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
mpg_new <- mpg 
mpg_new <- mpg_new %>% 
  mutate(cty_hwy=cty+hwy)

# Q8.
# 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하세요.
mpg_new <- mpg_new %>% 
  mutate(avg_fuelEff=cty_hwy/2)

# Q9-1.
# '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
head(mpg_new %>% 
  arrange(desc(avg_fuelEff)), 3) 

# Q9-2.
# 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하세요.
head(mpg_new %>% 
  mutate(Q9_2=(cty+hwy)/2) %>% 
  arrange(desc(Q9_2)),3)

# Q10.
# 회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 
# 내림차순으로 정렬하고, 1~5위까지 출력하기
head(mpg %>% 
  group_by(manufacturer) %>% 
  summarise(avg=mean(cty+hwy)) %>% 
  arrange(desc(avg)),5)

# Q11.
# class별 cty 평균을 구해보세요.
mpg %>% 
  group_by(class) %>% 
  summarise(mean(cty))

# Q12.
# Q11의 결과를 cty 평균이 높은 순으로 정렬해 출력하세요. 
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

# Q13.
# hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
head(mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>% 
  arrange(desc(mean_hwy)),3)

# Q14.
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))
          