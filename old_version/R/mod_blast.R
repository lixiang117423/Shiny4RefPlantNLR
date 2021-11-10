#' blast UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_blast_ui <- function(id){
  ns <- NS(id)
  tagList(
    col_12(
      tabPanel(
        h2("test"),
        dataTableOutput(ns("preview"))
      )
    )
  )
}
    
#' blast Server Functions
#'
#' @noRd 
mod_blast_server <- function(id,input, output, session){
    ns <- session$ns
    
    output$preview <- renderPrint({
      cat("test")
    })
}
    
## To be copied in the UI
# mod_blast_ui("blast_ui_1")
    
## To be copied in the server
# mod_blast_server("blast_ui_1")
