# iris 컬럼 2개, 3개, 4개 => 클러스터링 수행
library(ggplot2)
set.seed(123)
######## Q1. iris 컬럼 2개 클러스터링 수행#############
data(iris) # iris데이터 로드
head(iris)
iris[1:2] # 컬럼: Sepal.Length, Sepal.Width

kmeans.iris<-kmeans(iris[1:2],3)
kmeans.iris
table(iris[,5], kmeans.iris$cluster)

kmeans.iris<-kmeans(iris[1:2],3, nstart=50)
table(iris[,5], kmeans.iris$cluster)
# nstart=50 차이 없음

# 시각화
iris_plot1<-ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 2 columns")
iris_plot1

iris_plot2<-iris_plot1+
  annotate("text", x=4.7, y=4.0, label="Setosa", size=5)+
  annotate("text", x=5.5, y=2.0, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=3.7, label="Virginica", size=5)
iris_plot2
# x=Sepal.Length, y=Sepal.Width
# Virginica와 Verisicolor 클러스터링이 구분이 명확하지 않음

iris_plot3<-ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 2 columns")
iris_plot3

iris_plot4<-iris_plot3+
  annotate("text", x=1.5, y=0.9, label="Setosa", size=5)+
  annotate("text", x=3.0, y=1.5, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=1.7, label="Virginica", size=5)
iris_plot4
# x=Petal.Length, y=Petal.Width
# -> 클러스터링간 구분이 더 명확해짐


######## Q2. iris 컬럼 3개 클러스터링 수행#############
data(iris)
iris[1:3] # 컬럼: Sepal.Length, Sepal.Width, Petal.Length
kmeans.iris<-kmeans(iris[1:3],3)
kmeans.iris
table(iris[,5], kmeans.iris$cluster)

kmeans.iris<-kmeans(iris[1:3],3, nstart=50)
table(iris[,5], kmeans.iris$cluster)
# nstart=50 차이 없음

# 시각화
iris_plot5<-ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 3 columns")
iris_plot5

iris_plot6<-iris_plot5+
  annotate("text", x=4.7, y=4.0, label="Setosa", size=5)+
  annotate("text", x=5.5, y=2.0, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=3.7, label="Virginica", size=5)
iris_plot6
# x=Sepal.Length, y=Sepal.Width
# Virginica와 Verisicolor 클러스터링이 구분이 명확하지 않음

iris_plot7<-ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 3 columns")
iris_plot7

iris_plot8<-iris_plot7+
  annotate("text", x=1.5, y=0.9, label="Setosa", size=5)+
  annotate("text", x=3.0, y=1.5, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=1.7, label="Virginica", size=5)
iris_plot8
# x=Petal.Length, y=Petal.Width
# -> 클러스터링간 구분이 더 명확해짐


######## Q3. iris 컬럼 4개 클러스터링 수행#############
data(iris)
iris[,-5] # 컬럼: Sepal.Length, Sepal.Width, Petal.Length
kmeans.iris<-kmeans(iris[,-5],3)
kmeans.iris
table(iris[,5], kmeans.iris$cluster)

kmeans.iris<-kmeans(iris[,-5],3, nstart=50)
table(iris[,5], kmeans.iris$cluster)
# nstart=50 차이 없음

# 시각화
iris_plot9<-ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 4 columns")
iris_plot9

iris_plot10<-iris_plot9+
  annotate("text", x=4.7, y=4.0, label="Setosa", size=5)+
  annotate("text", x=5.5, y=2.0, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=3.7, label="Virginica", size=5)
iris_plot10
# x=Sepal.Length, y=Sepal.Width
# Virginica와 Verisicolor 클러스터링이 구분이 명확하지 않음

iris_plot11<-ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, colour=Species))+
  geom_point(shape=19, size=4)+
  ggtitle("iris data: 3 columns")
iris_plot11

iris_plot12<-iris_plot11+
  annotate("text", x=1.5, y=0.9, label="Setosa", size=5)+
  annotate("text", x=3.0, y=1.5, label="Verisicolor", size=5)+
  annotate("text", x=6.5, y=1.7, label="Virginica", size=5)
iris_plot12
# x=Petal.Length, y=Petal.Width
# -> 클러스터링간 구분이 더 명확해짐

