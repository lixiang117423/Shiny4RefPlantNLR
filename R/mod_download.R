#' download UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList downloadButton selectInput actionButton dataTableOutput
#' @importFrom data.table fread
mod_download_ui <- function(id) {
  ns <- NS(id)

  tagList(
    col_3(
      h4("Parameter Setting"),
      # 序列下载格式
      selectInput(ns("select_downlaod_content"),
        label = h6("Sequences Type"),
        choices = list(
          "All" = "all",
          "Amino acid" = "aa",
          "CDS" = "cds",
          "Domain" = "domain"
        ),
        selected = "all"
      ),
      # 是否下载gff文件
      selectInput(ns("download_gff_or_not"),
        label = h6("GFF or NOT"),
        choices = list(
          "YES" = "yes",
          "NO" = "no"
        ),
        selected = "yes"
      ),
      # 是否下载非冗余数据
      selectInput(ns("redundant_or_not"),
        label = h6("Redundant ot NOT"),
        choices = list(
          "YES" = "yes",
          "NO" = "no"
        ),
        selected = "yes"
      ),
      # 选择需要的目
      selectInput(ns("select_order"),
        label = h6("Select Order"),
        choices = list(
          "ALL" = "all",
          "Asterales" = "Asterales",
          "Brassicales" = "Brassicales",
          "Caryophyllales" = "Caryophyllales",
          "Cucurbitales" = "Cucurbitales",
          "Fabales" = "Fabales",
          "Malpighiales" = "Malpighiales",
          "Malvales" = "Malvales",
          "Poales" = "Poales",
          "Rosales" = "Rosales",
          "Solanales" = "Solanales",
          "Vitales" = "Vitales"
        ),
        selected = "all"
      ),
      # 选择寄主
      selectInput(ns("select_host"),
        label = h6("Select Host"),
        choices = list(
          "ALL" = "all",
          "Aegilops tauschii" = "Aegilops tauschii",
          "Aegilops tauschii subsp. strangulata" = "Aegilops tauschii subsp. strangulata",
          "Arabidopsis thaliana" = "Arabidopsis thaliana",
          "Arachis hypogaea" = "Arachis hypogaea",
          "Beta vulgaris subsp. maritima" = "Beta vulgaris subsp. maritima",
          "Brassica napus" = "Brassica napus",
          "Cajanus cajan" = "Cajanus cajan",
          "Capsicum annuum" = "Capsicum annuum",
          "Capsicum baccatum" = "Capsicum baccatum",
          "Capsicum chacoense" = "Capsicum chacoense",
          "Capsicum chinense" = "Capsicum chinense",
          "Capsicum frutescens" = "Capsicum frutescens",
          "Cucumis melo" = "Cucumis melo",
          "Dasypyrum villosum" = "Dasypyrum villosum",
          "Glycine max" = "Glycine max",
          "Gossypium barbadense" = "Gossypium barbadense",
          "Gossypium hirsutum" = "Gossypium hirsutum",
          "Gossypium tomentosum" = "Gossypium tomentosum",
          "Helianthus annuus" = "Helianthus annuus",
          "Hordeum chilense" = "Hordeum chilense",
          "Hordeum vulgare subsp. spontaneum" = "Hordeum vulgare subsp. spontaneum",
          "Hordeum vulgare subsp. vulgare" = "Hordeum vulgare subsp. vulgare",
          "Lactuca sativa" = "Lactuca sativa",
          "Linum usitatissimum" = "Linum usitatissimum",
          "Malus x robusta" = "Malus x robusta",
          "Medicago truncatula" = "Medicago truncatula",
          "Musa acuminata subsp. malaccensis" = "Musa acuminata subsp. malaccensis",
          "Nicotiana attenuata" = "Nicotiana attenuata",
          "Nicotiana benthamiana" = "Nicotiana benthamiana",
          "Nicotiana glutinosa" = "Nicotiana glutinosa",
          "Nicotiana sylvestris" = "Nicotiana sylvestris",
          "Nicotiana tabacum" = "Nicotiana tabacum",
          "Nicotiana tomentosiformis" = "Nicotiana tomentosiformis",
          "Oryza rufipogon" = "Oryza rufipogon",
          "Oryza sativa Aromatic Group" = "Oryza sativa Aromatic Group",
          "Oryza sativa aus Group" = "Oryza sativa aus Group",
          "Oryza sativa Indica Group" = "Oryza sativa Indica Group",
          "Oryza sativa Japonica Group" = "Oryza sativa Japonica Group",
          "Phaseolus vulgaris" = "Phaseolus vulgaris",
          "Prunus cerasifera" = "Prunus cerasifera",
          "Rosa multiflora" = "Rosa multiflora",
          "Secale cereale" = "Secale cereale",
          "Solanum acaule " = "Solanum acaule ",
          "Solanum americanum" = "Solanum americanum",
          "Solanum bulbocastanum" = "Solanum bulbocastanum",
          "Solanum chacoense" = "Solanum chacoense",
          "Solanum demissum" = "Solanum demissum",
          "Solanum habrochaites" = "Solanum habrochaites",
          "Solanum hjertingii" = "Solanum hjertingii",
          "Solanum lycopersicoides" = "Solanum lycopersicoides",
          "Solanum lycopersicum" = "Solanum lycopersicum",
          "Solanum lycopersicum " = "Solanum lycopersicum ",
          "Solanum mochicense" = "Solanum mochicense",
          "Solanum nigrescens" = "Solanum nigrescens",
          "Solanum pimpinellifolium" = "Solanum pimpinellifolium",
          "Solanum schenckii" = "Solanum schenckii",
          "Solanum sp. ABPT" = "Solanum sp. ABPT",
          "Solanum sp. AM-3778-16" = "Solanum sp. AM-3778-16",
          "Solanum stoloniferum" = "Solanum stoloniferum",
          "Solanum tuberosum" = "Solanum tuberosum",
          "Solanum tuberosum subsp. andigenum" = "Solanum tuberosum subsp. andigenum",
          "Solanum venturii" = "Solanum venturii",
          "Solanum x edinense" = "Solanum x edinense",
          "Sorghum bicolor" = "Sorghum bicolor",
          "Spinacia oleracea" = "Spinacia oleracea",
          "Triticum aestivum" = "Triticum aestivum",
          "Triticum dicoccoides subsp. dicoccoides" = "Triticum dicoccoides subsp. dicoccoides",
          "Triticum monococcum subsp. monococcum" = "Triticum monococcum subsp. monococcum",
          "Triticum turgidum subsp. durum" = "Triticum turgidum subsp. durum",
          "Triticum urartu" = "Triticum urartu",
          "Vigna unguiculata" = "Vigna unguiculata",
          "Vitis rotundifolia" = "Vitis rotundifolia",
          "Vitis vinifera" = "Vitis vinifera",
          "Zea mays" = "Zea mays",
          "NA" = "NA"
        ),
        selected = "all"
      ),
      # 选择病原菌
      selectInput(ns("select_pathogen"),
        label = h6("Select Pathogen"),
        choices = list(
          "ALL" = "all",
          "Virus" = "Virus",
          "HELPER" = "HELPER",
          "Arthropods" = "Arthropods",
          "Bacteria" = "Bacteria",
          "Oomycete" = "Oomycete",
          "Nematode" = "Nematode",
          "Fungi" = "Fungi",
          "Virus|Fungi" = "Virus|Fungi",
          "Nematode|Arthropods|Arthropods|Arthropods" = "Nematode|Arthropods|Arthropods|Arthropods",
          "Bacteria|Bacteria|Bacteria|Other" = "Bacteria|Bacteria|Bacteria|Other",
          "Bacteria|Bacteria|Fungi" = "Bacteria|Bacteria|Fungi",
          "Parasitic plant" = "Parasitic plant",
          "Fungi|Oomycete|Bacteria" = "Fungi|Oomycete|Bacteria"
        ),
        selected = "all"
      ),
      col_12(
        actionButton(
          ns("submit"),
          label = "Submit",
          icon = icon("arrow-up")
        ) %>%
          tags$div(align = "center", style = "padding-right:0em;")
      ),
      HTML("&nbsp;"),
      col_12(
        downloadButton(ns("dl_seq"),
                       label = "Download sequences") %>%
          tags$div(align = "center")
      ),
      HTML("&nbsp;"),
      col_12(
        downloadButton(ns("dl_gff"),
                       label = "Download GFF file") %>%
          tags$div(align = "center")
      )
    ),
    column(
      width = 9,
      col_12(
        tags$p(
          "Preview"
        ) %>%
          tags$div(align = "center", style = "font-size:30px")
      ),
      #HTML("&nbsp;"),
      col_12(
        dataTableOutput(ns("preview")) %>%
          tags$div(style = "height:400px") %>%
          tagAppendAttributes(
            onclick = sprintf(
              "Shiny.setInputValue('%s', true, {priority : 'event'})",
              ns("show")
            )
          )
      )
    )
  )
}

#' download Server Functions
#'
#' @noRd
#' @export
#' @import ggplot2
#' @importFrom shiny eventReactive renderDataTable
#' @importFrom data.table fread
mod_download_server <- function(input, output, session) {
  ns <- session$ns

  # load("./data/all.data.rda")
  # load("./data/all.gff.rda")

  # 预设返回值
  r <- rv(
    df_fa = NULL,
    df_gff = NULL
  )

  ## 加载数据
  # load("data/all.data.rda")
  # load("./data/all.gff.rda")

  df.seq <- data.table::fread("./data/test.txt", header = TRUE, sep = "\t")
  df.gff <- data.table::fread("./data/gff.txt", header = TRUE, sep = "\t")

  observeEvent(input$submit, {
    if (input$select_downlaod_content == "all") {
      df.seq <- df.seq
    } else if (input$select_downlaod_content == "aa") {
      df.seq <- df.seq %>%
        dplyr::filter(group %in% c("aa.415", "non.redundant.aa"))
    } else if (input$select_downlaod_content == "cds") {
      df.seq <- df.seq %>%
        dplyr::filter(group %in% c("cds.400"))
    } else {
      df.seq <- df.seq %>%
        dplyr::filter(group %in% c("all.domain", "unique.domain", "non.redundant.aa.domain"))
    }

    # 去冗余
    if (input$redundant_or_not == "yes") {
      df.seq <- df.seq %>%
        dplyr::filter(dundant == "no")
    } else {
      df.seq <- df.seq %>%
        dplyr::filter(dundant == "yes")
    }

    # 选择目水平
    if (input$select_order == "all") {
      df.seq <- df.seq
    } else {
      df.seq <- df.seq %>%
        dplyr::filter(Order == input$select_order)
    }

    # 选择寄主
    if (input$select_host == "all") {
      df.seq <- df.seq
    } else {
      df.seq <- df.seq %>%
        dplyr::filter(Host == input$select_host)
    }

    # 选择病原菌
    if (input$select_pathogen == "all") {
      df.seq <- df.seq
    } else {
      df.seq <- df.seq %>%
        dplyr::filter(Pathogen == input$select_pathogen)
    }

    # 构建fasta格式序列文件
    df.fasta.temp <- df.seq %>% dplyr::select(1:2)
    df.fasta.temp <- df.fasta.temp[!duplicated(df.fasta.temp$seq), ]

    df.fasta <- NULL
    for (i in 1:nrow(df.fasta.temp)) {
      df.temp <- data.frame(temp = paste0(">", df.fasta.temp$id[i]))
      df.temp.2 <- data.frame(temp = df.fasta.temp$seq[i])
      df.fasta <- rbind(df.fasta, df.temp) %>%
        rbind(df.temp.2)
    }
    # 将序列结果输出到shiny对象上
    colnames(df.fasta) <- "Results"
    r$df_fa <- df.fasta

    # 选择gff文件
    seq.id <- unique(df.seq$id)
    df.gff.selected <- df.gff %>%
      dplyr::filter(V1 %in% seq.id) %>%
      dplyr::select(-10)

    r$df_gff <- df.gff.selected
  })

  # 输出结果
  output$preview <- shiny::renderDataTable({
    r$df_fa
  })

  # 下载序列
  output$dl_seq <- downloadHandler(
    filename = function() {
      paste0("RefPlantNLR-", Sys.Date(), "-download", ".fasta")
    },
    content = function(file) {
      write.table(r$df_fa,
        file,
        col.names = FALSE,
        row.names = FALSE,
        sep = "\t",
        quote = FALSE
      )
    }
  )
  
  # 下载gff
  output$dl_gff <- downloadHandler(
    filename = function() {
      paste0("RefPlantNLR-", Sys.Date(), "-download", ".gff3")
    },
    content = function(file) {
      write.table(r$df_gff,
                  file,
                  col.names = FALSE,
                  row.names = FALSE,
                  sep = "\t",
                  quote = FALSE
      )
    }
  )
}

## To be copied in the UI
# mod_download_ui("download_ui_1")

## To be copied in the server
# mod_download_server("download_ui_1")
