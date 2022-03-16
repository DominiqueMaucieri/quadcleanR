library(shiny)

independent <- c(colnames(B_LQuad_softcoral[1:13]))
dependent <- "prop_cover"

ui <- fluidPage(

  selectInput("xaxis", "Choose an x-axis:", independent),
  selectInput("yaxis", "Choose a y-axis:", dependent),
  plotOutput("prettyplot")

)





server <- function(input, output) {}







shinyApp(ui = ui, server = server)
