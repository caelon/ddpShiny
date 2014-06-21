# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Distribution of passes dependent on placement of ball"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("hash",
                  label = h5("Placement of ball on the field"),
                  choices = list("Left hash" = 1,
                                 "Between the hashes" = 2,
                                 "Right hash" = 3),
                  selected = 1),
      "In American football, the field is divided into three sections by two hash marks, splitting the field into 3/8ths, 2/8ths, and 3/8ths. By analyzing if pass plays can be predicted based on the placement of the ball, teams may be able to defend better."
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("barPlot")
    )
  )
))
