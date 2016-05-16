library(shiny)
library(datasets)
library(stats)
data<-cmdscale(eurodist)

fluidPage(
    
    titlePanel("Distance between European Cities"),
    
    sidebarPanel(
        
        selectInput('c1', 'City 1', rownames(data), rownames(data)[1]),
        selectInput('c2', 'City 2', rownames(data), rownames(data)[2])
    ),
    
    mainPanel(
        plotOutput('plot')
    )
)