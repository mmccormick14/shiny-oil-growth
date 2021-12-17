library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("Number of oil wells operating in each US state, 1919-2009"),
    plotOutput("plot", click = "click"),
    selectInput("state", label = "state", choices = wells_per_state$state),
    tableOutput("data")
)

# Define server logic required to draw line graphs
server <- function(input, output, session) {
    output$plot <- renderPlot({
        ggplot(wells_per_state %>% filter(state == input$state),
            aes(x = prod_year, y = total_wells_operating)) + geom_point()
    }, res = 96)
    
    output$data <- renderTable({
        nearPoints(wells_per_state %>% filter(state == input$state), 
                   input$click, xvar = "prod_year", yvar = "total_wells_operating")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
