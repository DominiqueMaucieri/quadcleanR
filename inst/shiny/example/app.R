library(shiny)
library(shinydashboard)
library(ggplot2)

data <- read.csv("simple_cleaned.csv")

ui <- dashboardPage( skin = "purple",
  dashboardHeader(title = "Data Visualization"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    box(shiny::selectInput("yaxis", h4("Choose a y-axis variable:"), "prop_cover"),
        shiny::selectInput("xaxis", h4("Choose an x-axis variable:"), colnames(data[,1:13])),
        shiny::selectInput("colour", h4("Choose a color variable:"), colnames(data[,1:13])),
        shiny::selectInput("facet", h4("Choose a facet variable:"), colnames(data[,1:13])),
        shiny::selectInput("function", h4("Choose a function to apply to the y-axis:"),
                           c("mean", "max", "min", "median")),
        width = 4,
        title = "Customization",
        solidHeader = FALSE),
    box(shiny::textOutput("data_warning"),
        shiny::plotOutput("prettyplot"),
        width = 8,
        title = "Plot",
        solidHeader = FALSE)
  )
)


server <- function(input, output) {

  plot_theme <- function () {
    theme_classic(base_size = 12, base_family = 'Times') +
      theme(
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.title = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 12, face = "plain"),
        legend.text = element_text(size = 12, face = "plain"),
        legend.title = element_text(size = 14, face = "bold"))
  }

  output_message <- c("")

  output$data_warning <-  shiny::renderText({ output_message })

  output$prettyplot <- shiny::renderPlot({
    ggplot2::ggplot(data, ggplot2::aes_string(x=input$xaxis, y=input$yaxis, color = input$colour)) +
      ggplot2::geom_point() +
      plot_theme()
  })
}

shinyApp(ui, server)
