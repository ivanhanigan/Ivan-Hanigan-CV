library(bookdown)
txt <- list()
txt[['About me']] <- read.table('about-me.md', sep = '\n')
txt[['Professional training and qualifications']] <- read.table('professional-training-and-qualifications.md', sep = '\n')
txt[['Programming expertise']] <- read.table('programming-expertise.md', sep = '\n')
names(txt)

for(i in 1:length(txt)){
  #i=1
  test <- 0
  
  for(j in 1:nrow(txt[[i]])){
    #j=6
    # print(j)
    test <- ifelse(txt[[i]][j,] == "---", test + 1, test)
    if(test <= 2){
      txt[[i]][j,1] <- "" 
    } else {
      txt[[i]][j,1] <- paste0(txt[[i]][j,1],"\n") 
    }
    if(test == 2){
      txt[[i]][j,1] <- paste0("# ", names(txt[i]), "\n")
    }

    if(test == 2){ test <- 3 }
  }
#  txt[[1]][1:10,]
}

library(data.table)
txt1 <- rbindlist(txt)

sink("R/Ivan-Hanigan-CV.Rmd")
cat("---
output:
  word_document: default
  html_document: default
---
")
sink()
write.table(txt1, file = "R/Ivan-Hanigan-CV.Rmd", sep = "\n", row.names = F, 
            quote = F,
            col.names = F,
            append = T)

setwd("R")
dir()
worddoc <- T
if(worddoc) render_book("Ivan-Hanigan-CV.Rmd", "word_document2")
setwd("..")
getwd()
