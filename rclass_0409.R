Sys.setlocale(category = "LC_CTYPE", locale = "C")
df <- read.csv("yelp_business.csv", na.string=c("NA", ""), 
               stringsAsFactors=F)
dim(df)
colnames(df) 

head(df)
summary(df)

sapply(df, function(df) {
  sum(is.na(df)==TRUE)
} )


sapply(df, function(df) {
  sum(is.na(df)==TRUE)/length(df)
} )

library(Amelia)
require(Amelia)



missmap(df, main="Missmap")


# 누락된 값 채우기 city
df[is.na(df$city),]

# 누락된 값 채우기 state
df[is.na(df$state),]
     
#
df[is.na(df$city),'city']


# 52816, SLqpLeF3gq6nnx6_JoE7-A
df[is.na(df$state),]
table(df$state)
df[is.na(df$state),'state'] = 'NV'
df[is.na(df$state),]
df[52816,]

# 146525, Cr3LJ2sKGNKEYIAjmG7aCA
df[is.na(df$city),]
## 55.95334,-3.199333
head(table(df$city),300)
df[is.na(df$city),'city'] = 'Edinburgh'
df[is.na(df$city),]
df[146525,]


# categories 분류해서 총 분류 범주가 몇개가 되는 것을 확인.
head(df$categories)
df[1,]

# system.time(
#      expr # 평가할 표현식
# )

system.time (
  strsplit(df$categories, split=";")
)

# 01. ';'으로 문자를 나누기 
dfcategories <- strsplit(df$categories, split=";")

# 02. 데이터 행만큼 리스트가 분리된 내용으로 생성된다. 
length(dfcategories)
head(dfcategories)

length(unlist(dfcategories))  # 전체 항목 길
# 03. 벡터로 펼친다.
df_c_tbl =  table(unlist(dfcategories))
length(df_c_tbl)


# 04. 정렬시키기
dsort = sort(df_c_tbl, decreasing = TRUE)
tail(dsort,10)
head(dsort,100)

