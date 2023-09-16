library(bookdown)
library(data.table)
worddoc <- T

txt <- list()
cv <- T
short <- F
if(cv == TRUE){
txt[['Education and employment']] <- read.table('education-and-employment.md', sep = '\n', comment.char = "")
txt[['Professional training and qualifications']] <- read.table('professional-training-and-qualifications.md', sep = '\n', comment.char = "")
txt[['Awards']] <- read.table('awards.md', sep = '\n', comment.char = "")
txt[['Papers']] <- read.table('papers.md', sep = '\n', comment.char = "")
txt[['Reports']] <- read.table('reports.md', sep = '\n', comment.char = "")
txt[['Research grants']] <- read.table('research-grants.md', sep = '\n', comment.char = "")
txt[['Teaching and learning']] <- read.table('teaching-and-supervision.md', sep = '\n', comment.char = "")
txt[['Conference presentations']] <- read.table('conference-presentations.md', sep = '\n', comment.char = "")
txt[['Programming expertise']] <- read.table('programming-expertise.md', sep = '\n',comment.char = "")
}
if(short){
  txt[['Education and employment']] <- read.table('education-and-employment.md', sep = '\n', comment.char = "")
  txt[['Selected publications']] <- read.table('papers-selected.md', sep = '\n', comment.char = "")
  txt[['Grants summary']] <- read.table('research-grants-selected.md', sep = '\n', comment.char = "")
}

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
if(worddoc) render_book("Ivan-Hanigan-CV.Rmd", "word_document2")
setwd("..")
getwd()
