txt <- list()
txt[['about-me']] <- read.table('about-me.md', sep = '\n')
txt[['professional-training-and-qualifications']] <- read.table('professional-training-and-qualifications.md', sep = '\n')
txt[['programming-expertise']] <- read.table('programming-expertise.md', sep = '\n')


for(i in 1:length(txt)){
  #i=1
  test <- 0
  
  for(j in 1:nrow(txt[[i]])){
    #j=6
    # print(j)
    test <- ifelse(txt[[i]][j,] == "---", test + 1, test)
    if(test <= 2){
      txt[[i]][j,1] <- "" 
    }
    if(test == 2){ test <- 3 }
  }
#  txt[[1]][1:10,]
}

library(data.table)
txt1 <- rbindlist(txt)
