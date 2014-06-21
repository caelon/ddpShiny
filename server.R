
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)

leftthrowingleft <- subset(footballplays,Hash == 'Left' & Pass.Direction == 'Left (of hash)')
leftthrowingmiddle <- subset(footballplays,Hash == 'Left' & Pass.Direction == 'Middle')
leftthrowingright <- subset(footballplays,Hash == 'Left' & Pass.Direction == 'Right (of hash)')
middlethrowingleft <- subset(footballplays,Hash == 'Middle' & Pass.Direction == 'Left (of hash)')
middlethrowingmiddle <- subset(footballplays,Hash == 'Middle' & Pass.Direction == 'Middle')
middlethrowingright <- subset(footballplays,Hash == 'Middle' & Pass.Direction == 'Right (of hash)')
rightthrowingleft <- subset(footballplays,Hash == 'Right' & Pass.Direction == 'Left (of hash)')
rightthrowingmiddle <- subset(footballplays,Hash == 'Right' & Pass.Direction == 'Middle')
rightthrowingright <- subset(footballplays,Hash == 'Right' & Pass.Direction == 'Right (of hash)')

ltlYds <- mean(leftthrowingleft$Yds,na.rm=T)
ltmYds <- mean(leftthrowingmiddle$Yds,na.rm=T)
ltrYds <- mean(leftthrowingright$Yds,na.rm=T)
mtlYds <- mean(middlethrowingleft$Yds,na.rm=T)
mtmYds <- mean(middlethrowingmiddle$Yds,na.rm=T)
mtrYds <- mean(middlethrowingright$Yds,na.rm=T)
rtlYds <- mean(rightthrowingleft$Yds,na.rm=T)
rtmYds <- mean(rightthrowingmiddle$Yds,na.rm=T)
rtrYds <- mean(rightthrowingright$Yds,na.rm=T)

labels <- c("Left","Middle","Right")
lefthashvec <- c(nrow(leftthrowingleft),nrow(leftthrowingmiddle),nrow(leftthrowingright))
middlehashvec <- c(nrow(middlethrowingleft),nrow(middlethrowingmiddle),nrow(middlethrowingright))
righthashvec <- c(nrow(rightthrowingleft),nrow(rightthrowingmiddle),nrow(rightthrowingright))
lefthash <- data.frame(labels,lefthashvec)
lefthash<-xtabs(lefthashvec~labels,lefthash)
middlehash <- data.frame(labels,middlehashvec)
middlehash<-xtabs(middlehashvec~labels,middlehash)
righthash <- data.frame(labels,righthashvec)
righthash<-xtabs(righthashvec~labels,righthash)

shinyServer(function(input, output) {

  output$barPlot <- renderPlot({

    if (input$hash == 1) {
      barplot(lefthash,xlab="Direction Pass Thrown",ylab="Number of throws",ylim=c(0,2000),col="green")
    }
    else if (input$hash == 2) {
      barplot(middlehash,xlab="Direction Pass Thrown",ylab="Number of throws",ylim=c(0,2000),col="green")
    }
    else {
      barplot(righthash,xlab="Direction Pass Thrown",ylab="Number of throws",ylim=c(0,2000),col="green")
    }
    # generate bins based on input$bins from ui.R
#    x    <- faithful[, 2]
#    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
#    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
