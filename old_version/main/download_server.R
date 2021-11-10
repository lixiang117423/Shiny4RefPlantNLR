# 展示数据
output$doanload_preview <- renderDataTable(df.preview(),
  options = list(pageLength = 6)
)

df.preview <- eventReactive(input$submit, {
  if (input$submit > 0) {

    # 气清空结果文件夹
    file.remove("Your.results.zip")
    file.remove("./UserResults/selected.sequences.fasta")
    file.remove("./UserResults/selected.GFF.gff")
    file.remove("./UserResults/selected.other.info.txt")
    file.remove("./UserResults/Your.results.zip")

    # 开始数据筛选
    load("./DemoData/all.data.RData")
    load("./DemoData/all.gff.RData")

    df.seq <<- all.data %>%
      dplyr::mutate(dundant = case_when(
        group == "aa.415" ~ "yes",
        group == "non.redundant.aa" ~ "no",
        group == "cds.400" ~ "yes",
        group == "all.domain" ~ "yes",
        group == "unique.domain" ~ "no",
        group == "non.redundant.aa.domain" ~ "no"
      ))
    df.gff <<- all.gff

    # 选择序列
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

    # 是否去冗余
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
    fwrite(df.fasta, file = "./UserResults/selected.sequences.fasta", row.names = FALSE, col.names = FALSE, quote = FALSE)

    # 选择gff文件
    if (input$download_gff_or_not == "yes") {
      seq.id <- unique(df.seq$id)
      df.gff.selected <- df.gff %>%
        dplyr::filter(V1 %in% seq.id) %>%
        dplyr::select(-10)

      fwrite(df.gff.selected, file = "./UserResults/selected.GFF.gff", row.names = FALSE, col.names = FALSE, quote = FALSE)
    }

    # 保存其他信息
    df.seq <- df.seq %>% dplyr::select(-group)
    fwrite(df.seq, file = "./UserResults/selected.other.info.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)

    # 压缩文件
    zip(zipfile = "./UserResults/Your.results.zip", files = "./UserResults/")

    df <- df.seq %>% dplyr::select(id, Other_ID, Genpept, CDS, Locus, Length_AA, Host, Pathogen, Pathogen_spp, Avr)
  }
  df
})

# 下载数据
output$download_zip <- downloadHandler(
  filename = function() {
    "Your.results.zip"
  },
  content = function(file) {
    file.copy("./UserResults/Your.results.zip", file)
  }
)
