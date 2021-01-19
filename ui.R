library(shiny)
library(shinydashboard)
library(plotly)
source("main.R")

# Define UI for application that draws a histogram
dashboardPage(
            
        skin = "red",
    
        dashboardHeader(title = "Welcome To The English Premier League Match Predictor",
                        titleWidth = 1000), 
              dashboardSidebar(
                  
                  tags$head(
                      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")),
                  
                  menuItem(strong("Pick Teams"),icon = icon("cog")),
                  selectInput("home_t",
                              "Home team:",
                              choices = c("Arsenal","Bournemouth", "Brighton","Burnley", "Cardiff","Chelsea","Crystal.Palace",
                                          "Everton", "Fulham", "Huddersfield", "Hull","Leicester","Liverpool","Man.City",      
                                          "Man.United","Middlesbrough", "Newcastle", "Norwich", "Southampton","Stoke",
                                          "Sunderland","Swansea","Tottenham","Watford","West.Brom",
                                          "West.Ham", "Wolves")),
                  selectInput("away_t",
                              "Away team:",
                              choices =c("Bournemouth","Burnley","Chelsea","Crystal.Palace",
                                         "Everton","Hull","Leicester","Liverpool","Man.City",      
                                         "Man.United","Middlesbrough","Southampton","Stoke",
                                         "Sunderland","Swansea","Tottenham","Watford","West.Brom",
                                         "West.Ham","Arsenal", "Brighton", "Newcastle", "Cardiff", "Wolves", "Fulham", "Norwich","Huddersfield")),
                  fluidRow(style="float:right;right:63%;position:relative;",
                  submitButton("Confirm",icon("spinner"))
                  )
              
              ),
              dashboardBody(
                  fluidRow(box(
                      title = "Probability Pie",solidHeader = TRUE,status="primary",
                      plotlyOutput("print",height=275)
                      
                  ),
                  
                  valueBoxOutput("exp_gl1"),
                  
                  #valueBox(expectd_agoal,"Expected Away Goal", icon("soccer-ball-o"),color="yellow"),
                  
                  valueBoxOutput("exp_gl2"),
                  
                  valueBox(1000,"Total No. of Simulation", icon("tachometer"),color="yellow"),
                  
                  box(
                      title = "Goals Distribution",solidHeader = TRUE,status = "info",
                      plotOutput("graph1")
                  ),
                  
                  box(
                      title = "Goals Distribution",solidHeader = TRUE,status = "info",
                      plotOutput("graph2")
                  )
                      
                  ),
                  
                fluidRow(
                    infoBox("Last Games Updated", "1-14-2021", icon = icon("warning"))
                )
              )
)
