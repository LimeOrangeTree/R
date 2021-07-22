#%>%

library(dplyr)
library(gapminder)
gapminder %>% group_by(continent,country) %>% summarise(pop_avg = mean(pop))

#以行提取
temp1 <- filter(gapminder,country == "Croatia" )

#以列提取
temp2 <- select(temp1, country,year, lifeExp)

#apply
temp3 <- apply(temp2[,c("lifeExp")], 2, mean)

#%>%
gapminder %>%filter (country == "Croatia") %>%
          select(country,year,lifeExp) %>%
          summarise(lifeExp_avg = mean(lifeExp))

gapminder %>%filter (country == "Croatia") %>%
             group_by(country,year) %>%
             summarise(lifeExp_avg = mean(lifeExp))

avocado <- read.csv("avocado.csv",header = TRUE,sep = ",")

library(dplyr)
x_avg <- avocado %>% group_by(region,year,type)%>%
         summarise(v_avg = mean(Total.Volume),a_avg = mean(AveragePrice))
  
  

y_avg <- avocado %>% group_by(region,year)%>%  
                 summarise(V_avg = mean(Total.Volume),P_avg = mean(AveragePrice))


y_avg1 <- avocado %>% group_by(region,year,type)%>%  
          summarise(V_avg = mean(Total.Volume),P_avg = mean(AveragePrice))

#下降趋势
arrange(y_avg1,desc(V_avg))

#去掉没必要的数值
y_avg2 <- y_avg1 %>% filter(region != "TotalUS")
arrange(y_avg2,desc(V_avg))

#取最大值


y_avg2[y_avg2$V_avg == max(y_avg2$V_avg),]

#取最小值
y_avg2[y_avg2$V_avg == min(y_avg2$V_avg),]


#date
library(lubridate)


data_avg <- avocado %>% group_by(region,year,month(Date),type)%>%
            summarise(V_avg = mean(Total.Volume),P_avg = mean(AveragePrice))

  
wine <- read.table("wine.data.txt",header = FALSE,sep = ",")
n <- readLines("wine.name.txt")  

#重新给每一个列一个新的列名-substr(从第四个字符加到字符最后一个)
names(wine)[2:14] <- substr(n,4,nchar(n))  

#变换列
#names(wine)[1:3] <- c("X1","X2","X3")  
  
#数据加工-train,test
train_set <-  sample_frac(wine,0.6)
str(train_set)

#取余
test_set <- setdiff(wine,train_set)


elec_gen <- read.csv("electricity_generation_per_person.csv",header = TRUE,sep = ",")
elec_use <- read.csv("electricity_use_per_person.csv",header = TRUE,sep = ",")

#取第二位到第五位
names(elec_gen)[2:33] <- substr(names(elec_gen)[2:33],2,nchar(names(elec_gen)[2:33]))
names(elec_use)[2:56] <- substr(names(elec_use)[2:56],2,nchar(names(elec_use)[2:56]))


#gather函数-行和列(-country表示不转置）
library(tidyr)
elec_gen_df <- gather(elec_gen,-country,key = "year",value = "ElectricityGeneration")
elec_use_df <- gather(elec_use,-country,key = "year",value = "ElectricityUse")


#data_frame 合并
ele_gen_use <- merge(elec_gen_df,elec_use_df)


stu<-data.frame(grade=c("A","B","C","D","E"), 
                female=c(5, 4, 1, 2, 3), 
                male=c(1, 2, 3, 4, 5),
                height = c(32,432,32423,23,123),
                name = c("dd","aa","ss","ff","ee"))
                

a <- gather(stu, gender, count,-grade,-height,-name)




