library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2)
library(viridis)
library(dplyr)

data <- read.csv("simple_cleaned.csv")

data$TimeBlock <- factor(data$TimeBlock, levels = c("Before", "During", "After"))
data$Site <- factor(data$Site, levels = paste("site", seq(1:40), sep = ""))
data$HD_Cat <- factor(data$HD_Cat, levels = c("Very Low", "Low", "Medium", "High", "Very High"))
independent <- colnames(data[,1:13])
dependent <- "prop_cover"

ui <- dashboardPage( skin = "purple",
                     dashboardHeader(title = "Data Visualization"),
                     dashboardSidebar(disable = TRUE),
                     dashboardBody(
                       fluidRow(
                         box(shiny::selectInput("yaxis", "Choose a y-axis variable:", dependent),
                             shiny::selectInput("xaxis", "Choose an x-axis variable:", independent),
                             shiny::selectInput("colour", "Choose a color variable:", independent, selected = independent[2]),
                             shiny::checkboxInput("continuous", "Treat as discrete", value = TRUE),
                             shiny::selectInput("facet", "Choose a facet variable:", c("no facet", independent), selected = "null"),
                             shiny::checkboxGroupInput("group_by", "Choose variable(s) to group by and average:", independent, selected = independent),
                             width = 4,
                             title = "Customization",
                             solidHeader = FALSE,
                             height = "100vh"),
                         box(radioGroupButtons(
                           inputId = "change_plot",
                           choices = c(c("box", "violin", "scatter", "stacked bar")),
                           justified = TRUE,
                           selected = "box"
                         ),
                         shiny::plotOutput("prettyplot",
                                           height = "80vh"),
                         width = 8,
                         title = "Plot",
                         solidHeader = FALSE,
                         height = "100vh")),
                       box(htmlOutput("subsetting"),
                           textOutput("code"),
                           width=12,
                           justified = TRUE,
                           title = "R Code")
                     )
)


server <- function(input, output) {

  output$prettyplot <- renderPlot({

    data_plot <- data %>%
      dplyr::group_by_at(input$group_by) %>%
      dplyr::summarise_at(vars(one_of(input$yaxis)), list(yaxis_grouped = mean))


    if(length(input$group_by) != length(independent)){
      y_axis_name <- paste("mean_", input$yaxis)
    } else {
      y_axis_name <- input$yaxis
    }

    if (input$facet %in% "no facet") {
      if (input$change_plot %in% "box") {
        ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
          ggplot2::geom_boxplot() +
          theme_classic() +
          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
          viridis::scale_fill_viridis(discrete = input$continuous) +
          labs(y = y_axis_name)
      } else{

        if (input$change_plot %in% "violin") {
          ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
            ggplot2::geom_violin() +
            theme_classic() +
            ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
            viridis::scale_fill_viridis(discrete = input$continuous)+
            labs(y = y_axis_name)
        } else {

          if (input$change_plot %in% "scatter") {
            ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, color = input$colour)) +
              ggplot2::geom_point() +
              theme_classic() +
              ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
              viridis::scale_colour_viridis(discrete = input$continuous)+
              labs(y = y_axis_name)
          } else {

            if (input$change_plot %in% "stacked bar") {
              ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                ggplot2::geom_bar(position="stack", stat="identity") +
                theme_classic() +
                ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                viridis::scale_fill_viridis(discrete = input$continuous)+
                labs(y = y_axis_name)
            }}}}} else {

              if (input$change_plot %in% "box") {
                ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                  ggplot2::geom_boxplot() +
                  theme_classic() +
                  ggplot2::facet_wrap(~get(input$facet)) +
                  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                  viridis::scale_fill_viridis(discrete = input$continuous)+
                  labs(y = y_axis_name)
              } else{

                if (input$change_plot %in% "violin") {
                  ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                    ggplot2::geom_violin() +
                    theme_classic() +
                    ggplot2::facet_wrap(~get(input$facet)) +
                    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                    viridis::scale_fill_viridis(discrete = input$continuous)+
                    labs(y = y_axis_name)
                } else {

                  if (input$change_plot %in% "scatter") {
                    ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, color = input$colour)) +
                      ggplot2::geom_point() +
                      theme_classic() +
                      ggplot2::facet_wrap(~get(input$facet)) +
                      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                      viridis::scale_colour_viridis(discrete = input$continuous)+
                      labs(y = y_axis_name)
                  } else {

                    if (input$change_plot %in% "stacked bar") {
                      ggplot2::ggplot(data_plot, ggplot2::aes_string(x=input$xaxis, y=data_plot$yaxis_grouped, fill = input$colour)) +
                        ggplot2::geom_bar(position="stack", stat="identity") +
                        theme_classic() +
                        ggplot2::facet_wrap(~get(input$facet)) +
                        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1)) +
                        viridis::scale_fill_viridis(discrete = input$continuous)+
                        labs(y = y_axis_name)
                    }}}}}
  })

  output$subsetting <- renderUI({

    if(length(input$group_by) != length(independent)){
      y_axis_name <- paste("mean_", input$yaxis, sep="")

      group_by_vector <- paste(input$group_by,collapse=", ")

      data_name <- sprintf(paste(
        "data <- data_raw"))

      grouped_raw <- sprintf(paste(
        "group_by(", group_by_vector, ")"))

      paste(
        "group_by(", independent, ")")

      summarized_raw <- sprintf(paste(
        "summarize(%s = mean(%s))"),
        y_axis_name, input$yaxis)

      HTML(paste(data_name, grouped_raw, summarized_raw, sep = ' %>% '))


    } else {}

  })

  output$code <- renderText({


    if(length(input$group_by) != length(independent)){
      y_axis_name <- paste("mean_", input$yaxis, sep = "")
    } else {
      y_axis_name <- input$yaxis
    }

    code_code <- sprintf(paste(
      "plot <- ggplot(data, aes(x = %s, y = %s"),
      input$xaxis, y_axis_name
    )


    if(input$change_plot %in% "box"){
      code_code <- sprintf(paste(
        code_code, ", fill = %s)) +\n
        geom_boxplot() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "violin"){
            code_code <- sprintf(paste(
              code_code, ", fill = %s)) +\n
        geom_violin() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "scatter"){
            code_code <- sprintf(paste(
              code_code, ", color = %s)) +\n
        geom_boxplot() + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_colour_viridis(discrete = %s)"),
        input$colour, input$continuous)} else {

          if(input$change_plot %in% "stacked bar"){
            code_code <- sprintf(paste(
              code_code, ", fill = %s)) +\n
        geom_bar(position = 'stacked', stat = 'identity') + \n
        theme_classic() + \n
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +\n
        scale_fill_viridis(discrete = %s)"),
        input$colour, input$continuous)}}}}

    if(!input$facet %in% "no facet"){
      code_code <- sprintf(paste(
        code_code, " +\n",
        "facet_wrap(~ vars(%s))"),
        input$facet)} else {

          code_code <- code_code
        }

  })


}

shinyApp(ui, server)
