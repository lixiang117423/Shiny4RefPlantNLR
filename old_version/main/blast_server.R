# 读取用户输入的数据并保存
user_data_blast <- reactive({
  table.blast <- fread(input$data_blast$datapath,
    header = FALSE,
    stringsAsFactors = TRUE,
    encoding = "UTF-8"
  )

  table.blast <<- table.blast
})

# 保存数据
output$blast_preview <- renderDataTable(df_blast_res(),
  options = list(pageLength = 6)
)

df_blast_res <- eventReactive(input$blast_submit, {
  if (input$blast_submit > 0) {
    
    file.remove('blast.sh')
    file.remove("./UserBlastResults/blast.result.txt")
    file.remove("./UserData/blast.input.data.fa")

    # 保存用户数据
    fwrite(user_data_blast(),
      file = "./UserData/blast.input.data.fa",
      row.names = FALSE, col.names = FALSE, quote = FALSE
    )

    # 构建命令

    user_file <- " -query ./UserData/blast.input.data.fa"

    if (input$blast_seq_type == "cds") {
      par1 <- "blastn"
      par_db <- " -db ./BlastDB/V4/cds/cds"
    } else if (input$blast_seq_type == "aa") {
      par1 <- "blastp"
      par_db <- " -db ./BlastDB/V4/aa/aa"
    } else {
      par1 <- "blastp"
      par_db <- " -db ./BlastDB/V4/domain/domain"
    }

    par_out <- " -out ./UserBlastResults/blast.result.txt"

    par_evalue <- paste0(" -evalue ", input$blast_evalue)

    par_outfmt <- paste0(" -outfmt ", input$blast_format)

    bash.sh <- paste0(par1, user_file, par_db, par_out, par_evalue, par_outfmt)

    # 输出脚本
    fwrite(as.data.frame(bash.sh), file = "blast.sh", col.names = FALSE, row.names = FALSE, quote = FALSE)

    system2(command = "sh", args = " blast.sh")

    df <- fread("./UserBlastResults/blast.result.txt", header = FALSE)
  }
  df
})

# 下载数据
output$download_blast <- downloadHandler(
  filename = function() {
    "Blast.result.txt"
  },
  content = function(file) {
    file.copy("./UserBlastResults/blast.result.txt", file)
  }
)













