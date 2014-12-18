library(shiny)

variables <- names(iris)
nonFactorVars <- variables[lapply(iris,class) != "factor"]

shinyUI(pageWithSidebar(
    headerPanel("Iris Explorer"),
    sidebarPanel(
        helpText("This revolutionary new app allows you to explore relationships between variables in Edgar",
                 "Anderson's legendary iris data set.  Select two input variables and a single response variable.",
                 "On the 'Plot' tab, view a scatter plot visualizing the relationship between the selected",
                 "variables.  On the 'Model' tab, peruse the corresponding linear regression model.  On the",
                 "'Data' tab, browse & search the full data set."),
        selectInput("var1", "Select first input variable:", variables),
        selectInput("var2", "Select second input variable:", variables),
        selectInput("outVar", "Select response variable:", nonFactorVars)
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("scatterPlot", width = 960, height = 600)),
            tabPanel("Model", verbatimTextOutput("linearModel")),
            tabPanel("Data", dataTableOutput("dataTable"))
        )
    )
))