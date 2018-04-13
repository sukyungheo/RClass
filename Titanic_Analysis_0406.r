
getwd()

tr <- read.csv("train.csv", na.strings=c("NA", ""))
str(tr)

names(tr)

#str(tr)
tr$Survived = factor(tr$Survived)
tr$Pclass = factor(tr$Pclass)
str(tr)
tr$Survived

summary(tr)

sum(is.na(tr$Age))/length(tr$Age)  # NA가 몇%가 될까? 19%

sum(is.na(tr$Age))/length(tr$Age)
sum(is.na(tr$Cabin))/length(tr$Cabin)
sum(is.na(tr$Embarked))/length(tr$Embarked)

sapply(tr, mean)

sapply(tr, function(tr_part)   { 
    sum(is.na(tr_part))/length(tr_part) 
}  )

library(Amelia)  
missmap(tr, main="Missing Map")

table(tr$Embarked, useNA="always")

which(is.na(tr$Embarked))

tr$Embarked [which(is.na(tr$Embarked))] = 'S'
table(tr$Embarked, useNA="always")

tr[which(is.na(tr$Embarked)),]

tr[62,]

tr$Embarked[62]
tr_a <- tr

class(tr_a$Name)
tr$Name = as.character(tr$Name)

tr[c('Name', 'PassengerId')]

# table_words=table(unlist(strsplit(tr$Name,"\\s+")))
strsplit(tr$Name,"\\s+")

tr_words=table(unlist(strsplit(tr$Name,"\\s+")))
tr_words

# sort(tr_words[grep('\\.',names(tr_words))], decreasing=TRUE)
grep('\\.',names(tr_words))

tr_words[grep('\\.',names(tr_words))]

sort(tr_words[grep('\\.',names(tr_words))] , decreasing=TRUE)



## stringr 패키지를 이용한다.
library(stringr)
td = tr
td_age = tr$Age
td_name1 <- str_match(td$Name, "[a-zA-Z]+\\.")
dat = cbind(tr$Name,td_name1)
dat

tb = cbind(td$Age, td_name1)  # 나이와 이름만 보겠다.
#tb
# tb 1:Age, 2: name
table(tb[is.na(tb[,1]),2])   # 나이가 없는 친구는 각각 몇명인가?

# mean.mr=mean(td_age[grepl(" Mr\\.",td$Name)] , na.rm=T)
# mean.mr=mean(td_age[grepl(" Mr\\.",td$Name) & !is.na(td$Age)])
mean.mr

# td = train.data
# td_age = train.data$Age
mean.mr=mean(td_age[grepl(" Mr\\.",td$Name) & !is.na(td$Age)])
mean.mrs=mean(td_age[grepl(" Mrs\\.", td$Name) & !is.na(td$Age)])
mean.dr=mean(td_age[grepl(" Dr\\.",td$Name) & !is.na(td$Age)])
mean.miss=mean(td_age[grepl(" Miss\\.",td$Name) & !is.na(td$Age)])
mean.master=mean(td_age[grepl(" Master\\.", td$Name) & !is.na(td$Age)])

mean.mr; mean.mrs; mean.dr; mean.miss; mean.master

td$Age[grepl(" Mr\\.", td$Name)&is.na(td$Age)] = as.integer(mean.mr)
td$Age[grepl(" Mrs\\.", td$Name)&is.na(td$Age)] = as.integer(mean.mrs)
td$Age[grepl(" Dr\\.", td$Name)&is.na(td$Age)] = as.integer(mean.dr)
td$Age[grepl(" Miss\\.", td$Name)&is.na(td$Age)] = as.integer(mean.miss)
td$Age[grepl(" Master\\.", td$Name)&is.na(td$Age)] = as.integer(mean.master)

head(td$Age)

names(td)

td[,c('Name', 'Age')]

saveRDS(td, "titanic_td.RDS")

td <- readRDS("titanic_td.RDS")
head(td)

names(td)

barplot(table(td$Survived), 
        xlab="Survived",
        names=c("Perished", 
               "Survived"),
        main="Survival"
)

names(td)

barplot(table(td$Pclass), 
        xlab="Pclass",
        names=c("First Class", "Second Class", "Third Class"),
        main="barplot of Pclass"
)

names(td)

barplot(table(td$Sex), 
        xlab="Sex",
       main="barplot of Sex"
)
barplot(table(td$Embarked), 
        xlab="Embarked",
        main="barplot of Embarked"
)

names(td)

hist(td$Age, main="age", xlab="Age")

barplot(table(td$SibSp), main="# of siblings/spouses aboard the Titanic/Passenger Siblings")

barplot(table(td$Parch), main="# of parents / children aboard the Titanic")

hist(td$Fare, main="Passenger Fare", xlab = "Fare")

counts = table(td$Survived, td$Sex)
barplot(counts, col=c("darkblue","red"), legend = c("Perished","Survived"),
main = "Passenger Survival by Sex")


counts = table(td$Survived, td$Pclass)
barplot(counts, col=c("darkblue","green"), legend = c("Perished","Survived"),
main = "Passenger Survival by Pclass")


par(mfrow=c(1,2))
counts = table(td$Sex, td$Pclass)
barplot(counts, col=c("darkblue","red"), legend = c("Female","Male"),
main = "Passenger Sex by Pclass")
counts = table(td$Survived, td$Pclass)
barplot(counts, col=c("darkblue","green"), legend = c("Perished","Survived"),
main = "Passenger Survived by Pclass")

split.data = function(data, p = 0.7, s = 555){
    set.seed(s)
    len1 = dim(data)[1] # 데이터 길이
    idx = sample(1:len1, size=len1 * p, replace=F)
    train = data[idx, ]
    test = data[-idx, ]
    return(list(train = train, test = test))
}

# 05. 의사결정트리 모델 적용(tree, ctree, rpart)
require(tree)

traintree = tree(Survived ~ Pclass + Sex + Age + SibSp + Fare
                 + Parch + Embarked, data=trset)
plot(traintree)
text(traintree)
nrow(trset[trset$Sex=='male',])
