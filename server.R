library(shiny)
library(datasets)
library(stats)
data<-cmdscale(eurodist)
cities<-rownames(data)
rx <- range(x <- data[,1])
ry <- range(y <- -data[,2])
x<-unname(x)
y<-unname(y)

shinyServer(function(input, output) {
    
    # sqrt((x[2]-x[1])^2 + (y[2]-y[1])^2)
    output$txt1 <- renderPrint((sqrt((x[match(input$c2,cities)]-x[match(input$c1,cities)])^2 +
                                              (y[match(input$c2,cities)]-y[match(input$c1,cities)])^2))) 
    
    output$plot <- renderPlot({
        
        plot(x, y, type="n", asp=1, xlab="", ylab="")
        abline(h = pretty(rx, 10), v = pretty(ry, 10), col = "light gray")
        text(x, y, labels(eurodist), cex=1, col='gray')
        text(x[match(input$c1,cities)],y[match(input$c1,cities)],rownames(data)[match(input$c1,cities)], col='red', cex=1, font=4)
        text(x[match(input$c2,cities)],y[match(input$c2,cities)],rownames(data)[match(input$c2,cities)], col='blue', cex=1, font=4)
        lines(c(x[match(input$c1,cities)],x[match(input$c2,cities)]), 
              c(y[match(input$c1,cities)],y[match(input$c2,cities)]))
        text(mean(c(x[match(input$c1,cities)],x[match(input$c2,cities)])),
             mean(c(y[match(input$c1,cities)],y[match(input$c2,cities)])), 
             paste('~',as.character(round(sqrt((x[match(input$c2,cities)]-x[match(input$c1,cities)])^2 + (y[match(input$c2,cities)]-y[match(input$c1,cities)])^2))),'km'), 
             cex=1, font=4)  
    }, height=600)
    
})