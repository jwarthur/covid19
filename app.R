library(shiny)
library(DT)

#library(rvest)
#library(httr)
#library(ggplot2)

data <- read.csv("https://data.nsw.gov.au/data/dataset/aefcde60-3b0c-4bc0-9af1-6fe652944ec2/resource/21304414-1ff1-4243-a5d2-f52778048b29/download/covid-19-cases-by-notification-date-and-postcode-local-health-district-and-local-government-area.csv")

# Define the UI

ui <- fluidPage(

  # *Input(inputId = myinput, label = mylabel, ...)
  # *Output(outputId = myoutput, ...)

  titlePanel(
    p("NSW COVID-19 Cases", style = "color:#3474A")
  ),

  sidebarLayout(

    sidebarPanel(

      img(
        src = "covid_image.jpeg",
        width = "250px"
      ),

      p(),

      p(
        a("Raw data from data.gov.au", href = "https://data.gov.au/dataset/ds-nsw-aefcde60-3b0c-4bc0-9af1-6fe652944ec2/details?q=coronavirus")
      )
    ),

    mainPanel(
      DTOutput(outputId = "table")

    )

  )

)

# Define the server function

server <- function(input, output) {

  # output$myoutput <- render*({ })

  output$table <- renderDT(data)


}

# Create a Shiny app object

shinyApp(ui = ui, server = server)
