# 读取用户输入的数据并保存
user_data_tree <- reactive({
  table.tree <- fread(input$data_tree$datapath,
    header = FALSE,
    stringsAsFactors = TRUE,
    encoding = "UTF-8"
  )

  table.tree <<- table.tree
})

# 保存数据
output$tree_preview <- renderDataTable(df_tree_res(),
  options = list(pageLength = 20)
)

df_tree_res <- eventReactive(input$tree_submit, {
  if (input$tree_submit > 0) {
    file.remove("./Bash/tree.sh")
    file.remove(paste0("./UserTreeResults/RAxML_bootstrap", ".", input$output_file_suffix))
    file.remove(paste0("./UserTreeResults/RAxML_bestTree", ".", input$output_file_suffix))
    file.remove(paste0("./UserTreeResults/RAxML_bipartitions", ".", input$output_file_suffix))
    file.remove(paste0("./UserTreeResults/RAxML_bipartionsBranchLabel", ".", input$output_file_suffix))
    file.remove("./UserTreeResults/tree.input.data.fa")

    # 保存用户数据
    fwrite(user_data_tree(),
      file = "./UserTreeResults/tree.input.data.fa",
      row.names = FALSE, col.names = FALSE, quote = FALSE
    )

    # 构建命令
    if (input$tree_algorithm == "fasttree") {
      bash.sh <- paste0("fasttree ./UserTreeResults/tree.input.data.fa > ./UserTreeResults/RAxML_bestTree.", input$output_file_suffix)
    } else {
      par1 <- "raxmlHPC-PTHREADS-AVX -T 2 -s "
      par2 <- "./UserTreeResults/tree.input.data.fa "
      par3 <- paste0("-n ", input$output_file_suffix, " -m PROTGAMMAAUTO -f a -# ")
      par4 <- input$bootstrap_times
      par5 <- " -x 8153044963028367 -p 644124967711489"

      bash.sh <- paste0(par1, par2, par3, par4, par5)
    }

    # 输出脚本
    fwrite(as.data.frame(bash.sh), file = "./Bash/tree.sh", col.names = FALSE, row.names = FALSE, quote = FALSE)

    system2(command = "sh", args = " ./Bash/tree.sh")

    file_name <- paste0("./UserTreeResults/RAxML_bestTree.", input$output_file_suffix)

    df.tree <- ggtree::read.tree(file = file_name) %>% as_tibble() %>% as.data.frame()

    df <- df.tree
  }
  df
})


# 展示进化树
output$tree_figure <- renderPlot(plot_tree(),
  height = 800,
  width = 2000
)

plot_tree <- eventReactive(input$tree_submit, {
  if (input$tree_submit > 0) {
    file_name <- read.tree(paste0("./UserTreeResults/RAxML_bestTree.", input$output_file_suffix))

    plot_tree <- ggtree(file_name, branch.length = "none", layout = "circular") +
      geom_tiplab()
  }
  plot_tree
})

# 下载数据
output$download_tree <- downloadHandler(
  filename = function() {
    paste0(input$data_tree$dataname, ".", input$output_file_suffix)
  },
  content = function(file) {
    if (input$tree_algorithm == "fasttree") {
      file.copy(paste0("./UserTreeResults/RAxML_bestTree", ".", input$output_file_suffix), file)
    } else {
      if (input$tree_seq_type == "RAxML_bootstrap") {
        file.copy(paste0("./UserTreeResults/RAxML_bootstrap", ".", input$output_file_suffix), file)
      } else if (input$tree_seq_type == "RAxML_bestTree") {
        file.copy(paste0("./UserTreeResults/RAxML_bestTree", ".", input$output_file_suffix), file)
      } else if (input$tree_seq_type == "RAxML_bipartitions") {
        file.copy(paste0("./UserTreeResults/RAxML_bipartitions", ".", input$output_file_suffix), file)
      } else {
        file.copy(paste0("./UserTreeResults/RAxML_bipartionsBranchLabel", ".", input$output_file_suffix), file)
      }
    }
  }
)
