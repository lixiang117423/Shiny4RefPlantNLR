#' @import shiny
#' @import golem

app_ui <- function(){
  tagList(
    golem_add_external_resources(),
    tagList(
      tags$style(
        "h3 {
        color: #00b76d;
        }"
      ),
      nav_(
        h3("shiny4RefPlantNLR"),
        c(
          "home" = "Home",
          "download" = "Download",
          "blast" = "Blast",
          "hmmer" = "HMMER",
          "meme" = "MEME Suite",
          "alignment" = "Alignment",
          "tree" = "Phylogenetic Tree",
          "about" = "About"
        )
      )
      ,
      tags$div(
        class = "container",
        #style = "width: 100vw;height:100vh;",
        style = "margin-right: 0em",
        fluidRow(
          id = "home", mod_home_ui("home")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "download", mod_download_ui("download")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "blast", mod_blast_ui("blast")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "hmmer", mod_blast_ui("hmmer")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "meme", mod_blast_ui("meme")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "alignment",mod_alignment_ui("alignment")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "tree", mod_tree_ui("tree")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        ),
        fluidRow(
          id = "about", mod_about_ui("about")
        ) %>% tagAppendAttributes(
          style = "display::nline-block"
        )
      )
    )
  )
}


#' @import shiny
#' @import golem
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'shiny4RefPlantNLR')
  )
  
  tags$head(
    golem::activate_js(),
    golem::favicon(),
    tags$title("shiny4RefPlantNLR"),
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    tags$link(
      rel="stylesheet", 
      type="text/css", 
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css",
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T",
      crossorigin="anonymous"
    ), 
    tags$script(
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js",
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM",
      crossorigin="anonymous"
    ), 
    tags$link(
      rel="stylesheet", 
      type="text/css", 
      href="www/custom.css"
    ), 
    tags$script(src="www/script.js")
  )
}
