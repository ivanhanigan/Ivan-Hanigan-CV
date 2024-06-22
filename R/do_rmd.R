library(bookdown)
library(data.table)
worddoc <- F


## NB only one can be true
cv <- F
short <- F
portfolio <- T
#### CV ####
if(cv == TRUE){
txt <- list()
txt[['Education and employment']] <- read.table('education-and-employment.md', sep = '\n', comment.char = "")
txt[['Professional training and qualifications']] <- read.table('professional-training-and-qualifications.md', sep = '\n', comment.char = "")
txt[['Awards']] <- read.table('awards.md', sep = '\n', comment.char = "")
txt[['Papers']] <- read.table('papers.md', sep = '\n', comment.char = "")
txt[['Book chapters']] <- read.table('book-chapters.md', sep = '\n', comment.char = "")
txt[['Reports']] <- read.table('reports.md', sep = '\n', comment.char = "")
txt[['Research grants']] <- read.table('research-grants.md', sep = '\n', comment.char = "")
txt[['Teaching and learning']] <- read.table('teaching-and-supervision.md', sep = '\n', comment.char = "")
txt[['Conferences and workshops']] <- read.table('conferences-and-workshops.md', sep = '\n', comment.char = "")
txt[['Programming expertise']] <- read.table('programming-expertise.md', sep = '\n',comment.char = "")
}
#### short ####
if(short){
  txt <- list()
  txt[['Education and employment']] <- read.table('education-and-employment.md', sep = '\n', comment.char = "")
  txt[['Selected publications']] <- read.table('papers-selected.md', sep = '\n', comment.char = "")
  txt[['Grants summary']] <- read.table('research-grants-selected.md', sep = '\n', comment.char = "")
}
#### portfolio ####
if(portfolio){
  txt <- list()
txt[["Career Trajectory"]] <- read.table('career-trajectory.md', sep = '\n', comment.char = "")
txt[["index" ]] <- read.table("index.md", sep = '\n', comment.char = "")
txt[["Biography" ]] <- read.table("biography.md", sep = '\n', comment.char = "")
txt[["Research Interests" ]] <- read.table("research-interests.md", sep = '\n', comment.char = "")
txt[["Values and vision" ]] <- read.table("values.md", sep = '\n', comment.char = "")
txt[["Education and employment"  ]] <- read.table("education-and-employment.md", sep = '\n', comment.char = "")
txt[["field-weighted-citation-impact"  ]] <- read.table("field-weighted-citation-impact.md", sep = '\n', comment.char = "")
txt[["Professional training and qualifications"  ]] <- read.table("professional-training-and-qualifications.md", sep = '\n', comment.char = "")
txt[['Programming expertise '  ]] <- read.table('programming-expertise.md', sep = '\n', comment.char = "")
txt[['People management and project management '  ]] <- read.table('people-management-and-project-management.md', sep = '\n', comment.char = "")
txt[['Awards '  ]] <- read.table('awards.md', sep = '\n', comment.char = "")


txt[["Research"  ]] <- read.table('research.md', sep = '\n', comment.char = "")
txt[['Papers '  ]] <- read.table('papers.md', sep = '\n', comment.char = "")
txt[['Book Chapters '  ]] <- read.table('book-chapters.md', sep = '\n', comment.char = "")
txt[['Reports '  ]] <- read.table('reports.md', sep = '\n', comment.char = "")
txt[['Research grants '  ]] <- read.table('research-grants.md', sep = '\n', comment.char = "")
txt[['Conferences and workshops '  ]] <- read.table('conferences-and-workshops.md', sep = '\n', comment.char = "")
txt[['Data and code '  ]] <- read.table('data-and-code.md', sep = '\n', comment.char = "")
txt[['Invited presentations '  ]] <- read.table('invited-presentations.md', sep = '\n', comment.char = "")
txt[['Consulting '  ]] <- read.table('consulting.md', sep = '\n', comment.char = "")

txt[["Teaching"  ]] <- read.table('teaching.md', sep = '\n', comment.char = "")
txt[['Teaching and supervision '  ]] <- read.table('teaching-and-supervision.md', sep = '\n', comment.char = "")
txt[['Capacity building training '  ]] <- read.table('capacity-building-training.md', sep = '\n', comment.char = "")
    
 
txt[['Engagement '  ]] <- read.table('engagement.md', sep = '\n', comment.char = "")
txt[['Media '  ]] <- read.table('media.md', sep = '\n', comment.char = "")
txt[['Policy briefs '  ]] <- read.table('policy-briefs.md', sep = '\n', comment.char = "")
txt[['Briefing for government officials']] <- read.table('briefing-for-government-officials.md', sep = '\n', comment.char = "")
txt[['Peer reviewing '  ]] <- read.table('peer-reviewing.md', sep = '\n', comment.char = "")
txt[['Professional societies '  ]] <- read.table('professional-societies.md', sep = '\n', comment.char = "")
txt[['International collaborations '  ]] <- read.table('international-collaborations.md', sep = '\n', comment.char = "")
txt[['Committees '  ]] <- read.table('committees.md', sep = '\n', comment.char = "")
txt[['Community engagement and participation '  ]] <- read.table('community-engagement-and-participation.md', sep = '\n', comment.char = "")
}
#### compile ####
names(txt)

for(i in 1:length(txt)){
  #i=1
  test <- 0
  
  for(j in 1:nrow(txt[[i]])){
    #j=1
    # print(j)
    test <- ifelse(txt[[i]][j,] == "---", test + 1, test)
    if(test <= 2){
      txt[[i]][j,1] <- "" 
    } else {
      txt[[i]][j,1] <- paste0(txt[[i]][j,1],"\n") 
    }
    # if(test == 2){
    #   txt[[i]][j,1] <- paste0("# ", names(txt[i]), "\n")
    # }

    if(test == 2){ test <- 3 }
  }
#  txt[[1]][1:10,]
}


txt1 <- rbindlist(txt)

sink("R/Ivan-Hanigan-CV.Rmd")
cat("---
title: 'Academic portfolio'
output:
  word_document: default
  bookdown::html_document2: 
    toc: true
---
")
sink()

write.table(txt1, file = "R/Ivan-Hanigan-CV.Rmd", sep = "\n", row.names = F, 
            quote = F,
            col.names = F,
            append = T)

if(worddoc){
  setwd("R")
  render_book("Ivan-Hanigan-CV.Rmd", "word_document2")
  setwd("..")
} else {
  setwd("R")
  render_book("Ivan-Hanigan-CV.Rmd", bookdown::html_document2(toc=TRUE))
  setwd("..")
  browseURL("R/_main.html")
}
getwd()
