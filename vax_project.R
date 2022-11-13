install.packages("dplyr")
install.packages("ggplot2")

library(dyplyr)
library(ggplot2)

netflix<-read.csv('E:/cu_immersion/R/Data_Visual_Project/titles.csv')
newnf<-data.frame(netflix$type,netflix$release_year,netflix$runtime,netflix$imdb_score,netflix$imdb_votes,netflix$tmdb_popularity,netflix$tmdb_score,stringsAsFactors = T)

newnf %>% filter(netflix.type=="SHOW") -> nfshow
newnf=na.omit(newnf)
#ggplot(data=nfshow,aes(x=netflix.release_year,y=netflix.runtime))+geom_point()
#ggplot(data=newnf,aes(x=netflix.imdb_score,y=netflix.tmdb_score))+geom_point()
#ggplot(data=newnf,aes(x=netflix.release_year,y=netflix.tmdb_score))+geom_point()

ggplot(newnf,aes(x=netflix.tmdb_popularity,y=netflix.runtime,fill=netflix.type))+geom_tile()
ggplot(newnf,aes(x=netflix.runtime,fill=netflix.type))+geom_histogram()

ggplot(newnf,aes(x=netflix.imdb_votes),fill=netflix.type,breaks=c(0,100,200,300))+geom_histogram()

index=sample(2,nrow(newnf),replace=T,prob=(c(0.1,0.9)))
train=newnf[index==1,]
test=newnf[index==2,]
MDL=randomForest(netflix.type~.,data=newnf)
type_pred=predict(MDL,test)
test$pred=type_pred
View(test)

for(x in 1:4621){
  if (test[x,]$netflix.type!=test[x,]$pred){
    print(x)
  }
}
             