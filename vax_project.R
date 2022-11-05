install.packages("dplyr")
install.packages("ggplot2")

library(dyplyr)
library(ggplot2)

netflix<-read.csv('E:/cu_immersion/R/Data_Visual_Project/titles.csv')
newnf<-data.frame(netflix$type,netflix$release_year,netflix$runtime,netflix$imdb_score,netflix$imdb_votes,netflix$tmdb_popularity,netflix$tmdb_score,stringsAsFactors = T)

newnf %>% filter(netflix.type=="SHOW") -> nfshow

ggplot(data=nfshow,aes(x=netflix.release_year,y=netflix.runtime))+geom_point()
ggplot(data=newnf,aes(x=netflix.imdb_score,y=netflix.tmdb_score))+geom_point()
ggplot(data=newnf,aes(x=netflix.release_year,y=netflix.tmdb_score))+geom_point()

ggplot(newnf,aes(x=netflix.release_year,y=netflix.runtime,fill=netflix.type))+geom_tile()
ggplot(newnf,aes(x=netflix.runtime,fill=netflix.type))+geom_histogram()
