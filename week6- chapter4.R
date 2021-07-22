table(is.na(airquality))

 #取出不是NA值
air_name <- airquality[!is.na(airquality$Ozone),]
mean(air_name$Ozone)

#na.omit-删除所有的na
air_name1 <- na.omit(airquality)
mean(air_name1$Ozone,na.rm = T)

#只删除ozone的NA值
mean(na.omit(airquality$Ozone))
mean(airquality$Ozone,na.rm = T)

patient <- data.frame(name = c("A1","A2","A3","A4","A5"),
                       age = c(22,23,34,65,65),
                       gender = factor(c("M","F","M","F","K")),
                       blood_type = factor(c("A","O","B","F","AB")))
patients <- patient[(patient$gender == "M" | patient$gender == "F")& 
                    (patient$blood_type == "O"|patient$blood_type ==  "A"|
                    patient$blood_type == "AB"|patient$blood_type == "B"),]

patient1 <- data.frame(name = c("A1","A2","A3","A4","A5"),
                      age = c(22,23,34,65,65),
                      gender = c(1,2,3,1,2),
                      blood_type =c(1,2,3,5,4))
patient1$gender <- ifelse(patient1$gender>=1 & patient1$gender<=2,patient1$gender,NA )
patient1$blood_type <- ifelse(patient1$blood_type>=1 & patient1$blood_type<=4,patient1$blood_type,NA )

patient1 <- patient1[!is.na(patient1$gender) &!is.na(patient1$blood_type),]


boxplot(airquality[,c(1:4)])

#查看最大值,最小值，四分位数
boxplot(airquality[,1])$stats

airs <- airquality

table(is.na(airs$Ozone))
airs$Ozone <- ifelse(airs$Ozone >=1 & airs$Ozone<=122,airs$Ozone,NA)
                  
table(is.na(airs$Ozone))
air_na <- airs[!is.na(airs$Ozone),]
mean(air_na$Ozone)

#mean
summarise(air_na,average_life = mean(Ozone))


library(dplyr)
library(gapminder)
select(gapminder,country,year,lifeExp)

#group_by-汇总

filter(gapminder,country == "Austria")
filter(gapminder,country == "Croatia")
summarise(group_by(gapminder,country),average_life = mean(lifeExp))






