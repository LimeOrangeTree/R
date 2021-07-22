#2020.04.06
x <- 1
y <- 2
temp <- x
x <- y
y <- temp
print(x)
print(y)

#默认数字1是数字,不是整数
x1 <- 1
is.integer(x1)

x2 <- 1L
is.integer(x2)

c(1:5)
x2 <- c(1,2,3,c(1:3))
class(x2)

y <- c()
y1 <- c(y,c(1:3))
y1

x2 <- seq(1,10,2)
x2

x3 <- seq(1,10,length.out = 8)
x3

#倍数
x4 <- rep(c(1:3),times = 5)
x4

#每个元素重复
x5 <- rep(c(1:3),each = 2)
x5

x6 <- seq(1,10,2)
x6
length(x6)
x6[1]

x6[c(3:4)]
x6[c(1:4)]

x7 <- 1:10
x7>5

all(x7>5)
any(x7>5)


x8 <- 1:10
head(x8)
tail(x8)
head(x8,3)
tail(x8,3)


x9 <- 1:9
y9 <- 3:11
z9 <- 6:15

union(x9,y9)#合集
intersect(x9,y9)#交集

setdiff(x9,y9)#x9을 기준으로 동일한 요소를 제외한 나머지 
setdiff(y9,x9)#y9를 기준으로 동일한 요소를 제외한 나머지

#전체요소가 동일한지  판단
setequal(x9,y9)
setequal(x9,z9)

x10 <- array(seq(1,10,2),c(2,3))#2행3열에 배분
x10

x10[2,]
x10[2,2]

x11 <- 1:12
matrix(x11,nrow = 3)

matrix(x11,nrow = 3, byrow = T)#행순

v1 <- 1:4
v2 <- 5:8
v3 <- 4:7
v_1 <- cbind(v1,v2,v3)
rbind(v1,v2,v3)
d_1 <- data.frame(x1 = 1:12,x2=1:12,x3 = 1:12)

x10 <- array(1:4,c(2,2))
y10 <- array(5:8,c(2,2))
x10 + y10
x10 - y10


x10 %*% y10#两个矩阵相乘
t(x10)#行和列进行转换

x11 <- array(1:12,c(3,4))
apply(x11, 1, mean)#以行为准进行平均
apply(x11, 2, mean)#以列为准进行平均

dim(x11)#排列的形状


x12 <- array(1:12,c(3,4))
sample(x12)
sample(x12,5)#随机取数

sample(x12,10,prob = c(1:12)/24)#随机取数，相对的概率

#data_frame
name <- c("你","我","他")
age <- c(22,25,22)
gender <- factor(c("M","F","M"))
type <- factor(c("A","B","C"))

#创造一个数据框
data <- data.frame(name,age,gender,type)
data$name
data[1,]
data[data$name == "你",]
data[data$age >= 25,]
data[data$name == "你",c("gender","age")]

#attach函数,把数据框里面变量直接转换成变量
head(cars)
attach(cars)
speed
detach(cars)#解除attach

#求平均和最大值
mean(cars$speed)
max(cars$speed)

with(cars,mean(speed))
with(cars,max(speed))

#取自己想要的列
library(dplyr)

subset(cars,speed>20)
cars%>%filter(speed>20)%>%select(speed)

subset(cars,speed>20,select = speed)
subset(cars,speed>20,select = -c(dist))


#去除掉NA值
head(airquality)
na.omit(airquality)

#数据框合并
data1 <- data.frame(name,age,gender)
data2 <- data.frame(name,type)
merge(data1,data2,by = "name")

#转换格式
is.data.frame(x12)
x13 <- as.data.frame(x12)
names(x13) <- c("1st","2st","3st","4st")


#list里面把两个数据框装在一起
no.data <- data.frame(day =c(1:6),
                      no = c(50,60,70,80,60,50))
list_data <- list(data = data,no.data = no.data)
list_data

x_2 <- merge(no.data,data)
list_data[[1]]
list_data$no.data$day
list_data[[2]][2]
list_data[["data"]]["name"]

#lapply,sapply
lapply(list_data$no.data,mean)
lapply(list_data$data,mean)

sapply(list_data$no.data,mean)

