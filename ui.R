library(shiny)
library(datasets)
library(stats)
data<-cmdscale(eurodist)

fluidPage(
    
    titlePanel("Distance between European Cities"),
    
    sidebarPanel(
        
        selectInput('c1', 'City 1', rownames(data), rownames(data)[1]),
        selectInput('c2', 'City 2', rownames(data), rownames(data)[2]),
        helpText("Note: The cartesian distance is calculated from the coordinates displayed in the plot."),
        
        submitButton(text='Calculate Distance'),
        h5(" "),
        verbatimTextOutput('txt1'),
        helpText("Calculated distance in km.")
        
    ),
    
    mainPanel(
        plotOutput('plot')
    )
)