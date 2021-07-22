student <- data.frame(name = c("A","B",'C','D','E'),
                      korean = c(100,90,90,90,100),
                      english = c(90,30,40,23,34),
                      math = c(49,32,42,54,67))
student[,1] <- as.character(student$name)

#quote = f 去掉引号,存为一个csv文件
write.table(student,"student.txt",row.names=FALSE,col.names=TRUE,sep=",",quote = F)

#条件语句
characters <- data.frame(name = c("A","B","C"),
                         age = c(30,16,21),
                         gender = factor(c("M","F","M")))

characters[characters$gender == "F",]
characters[characters$age < 30 & characters$gender == "M",]
#test
test <- c(seq(10,40,10),NA)

test[test>30]
test[!is.na(test)]

#if
x <- 5
if(x %%2 == 0){
  print("偶数")
}  else {
  print("奇数")
}

x <- 0
if(x > 0){
  print('x大于0')
} else if(x < 0){
  print("x小于0")
} else{
  print("x等于0")
}

x <- c(-5:5)
#输出三个有效数字
options(digits = 3)
sqrt(x)
sqrt(ifelse(x >=0, x,NA))

#NA值处理
student2 <- read.csv("student.csv")

student2[,2] <- ifelse(student2[,2]>=0 & student2[,2]<=100, student2[,2],NA)
student2[,3] <- ifelse(student2[,3]>=0 & student2[,3]<=100, student2[,3],NA)
student2[,4] <- ifelse(student2[,4]>=0 & student2[,4]<=100, student2[,4],NA)
#if语句
i <- 1
repeat{
  if(i > 10){
    break
  } else{
    print(i)
    i = i+ 1
  }
}

for(i in 1:10){
    if(i > 10){
      break
  } else{
    print(i)
    i = i+ 1
}
}
#输出1到10
i =1
while (i<11) {
  print(i)
    i = i+1
 
}
 
i = 1
while (i<10) {
  s = 2*i
  print(paste(2,"x",i,"=",s))
  i = i+1
}


for(i in 1:10){
  print(i)
}

#九九乘法表
for(i in 1:9){
  for (j in 1:9) {
    s = i*j
    print(paste(i,"x",j,"=",s))
  }
}

for(i in 1:10){
  if(i %% 5==0){
    print(i)
  }
}

for (i in 1:10) {
  if(i %%2 == 0){
    print(i)
  }
}


for(i in 1:10){
  s = 0
  for(j in 1:i){
    
    if(i %% j ==0){
      s = s+1
    }
  }
  if(s == 2){
    print(i)
  }
}
#输出不是质数
for (i in 1:10) {
  check = 0
  for(j in 1:i){
    if(i%%j == 0){
      check = check+1
    }
  }
  if(check ==2){
    print(i)
  }
}

student3 <- read.csv("student.csv")

for (i in 2:4) {
  student3[,i] <- ifelse(student3[,i]>=0 & student3[,i]<= 100,student3[,i],NA)
}



fact = function(x){
  fa = 1
  while (x>1) {
    fa = fa * x
    x = x-1
  }
  return(fa)
}



fa1 <- function(x){
  y = 1
  while ( x> 1){
    y = y * x
    x = x - 1
  }
  return(y)
}
fa1(5)


fa = function(x,n){
  sum <- 0
  for (j in 1:n) {
    if(j %% x == 0){
      sum = sum+j
      
    }
  }
  print(sum)
}
fa(3,10)
fa(4,20)


