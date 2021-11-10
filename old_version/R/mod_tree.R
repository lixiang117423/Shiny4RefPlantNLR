#' tree UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tree_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' tree Server Functions
#'
#' @noRd 
mod_tree_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tree_ui("tree_ui_1")
    
## To be copied in the server
# mod_tree_server("tree_ui_1")
