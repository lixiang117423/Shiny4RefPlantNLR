#' @import shiny
#' 
app_server <- function(input, output,session) {
  callModule(mod_download_server,"download")
  #callModule(mod_blast_server, "blast")
  #callModule(mod_alignment_server, "alignment")
  #callModule(mod_tree_server, "tree")
}