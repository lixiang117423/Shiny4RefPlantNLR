#' alignment UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_alignment_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' alignment Server Functions
#'
#' @noRd 
mod_alignment_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_alignment_ui("alignment_ui_1")
    
## To be copied in the server
# mod_alignment_server("alignment_ui_1")
