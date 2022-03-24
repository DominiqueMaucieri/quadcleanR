library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage( skin = "purple",
  dashboardHeader(title = "Data Visualization"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    box(shiny::selectInput("yaxis", h4("Choose a y-axis variable:"), c("loading")),
        shiny::selectInput("xaxis", h4("Choose an x-axis variable:"), c("loading")),
        shiny::selectInput("colour", h4("Choose a color variable:"), c("loading")),
        shiny::selectInput("facet", h4("Choose a facet variable:"), c("loading")),
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

  if(!exists('data', envir = parent.env(environment()), inherits = FALSE)) {
    data(simple_cleaned, envir = environment())
    data <- simple_cleaned
    independent <- colnames(data[,1:13])
    dependent <- "prop_cover"
    output_message <- "WARNING: You have not specified data, example soft coral data will be used!"
  }

  output$data_warning <-  shiny::renderText({ output_message })

  shiny::observe({ shiny::updateSelectInput(inputId = "xaxis", choices = independent) })
  shiny::observe({ shiny::updateSelectInput(inputId = "yaxis", choices = dependent) })
  shiny::observe({ shiny::updateSelectInput(inputId = "facet", choices = independent) })
  shiny::observe({ shiny::updateSelectInput(inputId = "colour", choices = independent) })

  output$prettyplot <- shiny::renderPlot({
    ggplot2::ggplot(data, ggplot2::aes_string(x=input$xaxis, y=input$yaxis, color = input$colour)) +
      ggplot2::geom_point() +
      plot_theme()
  })
}

shinyApp(ui, server)
