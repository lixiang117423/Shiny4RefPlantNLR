# 读取用户输入的数据并保存
user_data_align <- reactive({
  table.align <- fread(input$data_align$datapath,
                       header = FALSE,
                       stringsAsFactors = TRUE,
                       encoding = "UTF-8"
  )
  
  table.align <<- table.align
})

# 保存数据
output$align_preview <- renderDataTable(df_align_res(),
                                        options = list(pageLength = 6)
)

df_align_res <- eventReactive(input$align_submit, {
  if (input$align_submit > 0) {
    
    file.remove('align.sh')
    file.remove("./UserAlignResults/align.result.txt")
    file.remove("./UserData/align.input.data.fa")
    
    # 保存用户数据
    fwrite(user_data_align(),
           file = "./UserData/align.input.data.fa",
           row.names = FALSE, col.names = FALSE, quote = FALSE
    )
    
    # 构建命令
    
    if (input$align_seq_type == "fa") {
      bash.sh <- "clustalo -i ./UserData/align.input.data.fa > ./UserAlignResults/align.result.fasta"
    }else{
      bash.sh <- "clustalo -i ./UserData/align.input.data.fa > ./UserAlignResults/align.result.txt"
    }
    
    # 输出脚本
    fwrite(as.data.frame(bash.sh), file = "./Bash/align.sh", col.names = FALSE, row.names = FALSE, quote = FALSE)
    
    system2(command = "sh", args = " ./Bash/align.sh")
    
    if (input$align_seq_type == "fa") {
      df <- fread("./UserAlignResults/align.result.fasta", header = FALSE)
    }else{
      df <- fread("./UserAlignResults/align.result.txt", header = FALSE)
    }
  }
  df
})


# 展示比对结果
output$align_figure <- renderPlot(plot_align(),
                                  height = 800,
                                  width = 2000)

plot_align <- eventReactive(input$align_submit,{
  if (input$align_submit > 0) {
    
    # 读入结果
    if (input$align_seq_type == "fa") {
      plot_align <- ggmsa::ggmsa("./UserAlignResults/align.result.fasta",
                           start = as.numeric(input$start_show), 
                           end = as.numeric(input$end_show), font = NULL)
    }else{
      plot_align <- ggmsa::ggmsa("./UserAlignResults/align.result.txt",
                           start = as.numeric(input$start_show), 
                           end = as.numeric(input$end_show), font = NULL)
    }
  }
  plot_align
})

# 下载数据
output$download_align <- downloadHandler(
  filename = function() {
    if (input$align_seq_type == "fa") {
      "align.result.fasta"
    }else{
      "align.result.txt"
    }
  },
  
  content = function(file) {
    if (input$align_seq_type == "fa") {
      file.copy("./UserAlignResults/align.result.fasta", file)
    }else{
      file.copy("./UserAlignResults/align.result.txt", file)
    }
  }
)













