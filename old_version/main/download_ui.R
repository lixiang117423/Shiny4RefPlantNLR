navbarPage(
  "DownLoad",
  tabPanel(h4("Parameter Setting"),
           width = NULL,
           #height = 920,
           #title = "Download Module",
           status = "danger",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           # 序列下载格式
           selectInput("select_downlaod_content",
                       label = h4("Sequences Type"),
                       choices = list(
                         "All" = "all",
                         "Amino acid" = "aa",
                         "CDS" = "cds",
                         "Domain" = "domain"
                       ),
                       selected = "all"
           ),
           # 是否下载gff文件
           br(),
           selectInput("download_gff_or_not",
                       label = h4("GFF or NOT"),
                       choices = list(
                         "YES" = "yes",
                         "NO" = "no"
                       ),
                       selected = "yes"
           ),
           # 是否下载非冗余数据
           br(),
           selectInput("redundant_or_not",
                       label = h4("Redundant ot NOT"),
                       choices = list(
                         "YES" = "yes",
                         "NO" = "no"
                       ),
                       selected = "yes"
           ),
           # 选择需要的目
           br(),
           selectInput("select_order",
                       label = h4("Select Order"),
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
           br(),
           selectInput("select_host",
                       label = h4("Select Host"),
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
           br(),
           selectInput("select_pathogen",
                       label = h4("Select Pathogen"),
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
           # 提交按钮
           fluidRow(
             column(
               width = 1,
               actionButton("submit",
                            label = h4("Submit"),
                            width = 100,
                            icon = NULL
               )
             ),
             column(
               width = 1,
               #offset = 0.5,
               actionButton("cancel",
                            label = h4("Cancel"),
                            width = 100
               )
             )
           ),
           # 下载结果
           br(),
           fluidRow(
             column(width = 1,
                    downloadButton('download_zip',
                                   label = h4('Zip-Type'),
                                   width = 100)),
             
             column(width = 1,
                    #offset = 0.1,# 偏移量
                    downloadButton('download_each',
                                   label = h4('Non-Zip'),
                                   width = 100))
             
           )),
  tabPanel(h4("Doanload Preview"),
           width = NULL,
           #height = 920,
           #title = "Preview",
           status = "warning",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           br(),
           dataTableOutput("doanload_preview"))
)