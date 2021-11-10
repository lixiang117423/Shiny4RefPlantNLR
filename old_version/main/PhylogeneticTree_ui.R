navbarPage(
  "Tree",
  tabPanel(h4("Parameter Setting"),
    width = NULL,
    # height = 920,
    # title = "Parameter Setting",
    status = "danger",
    solidHeader = TRUE,
    collapsible = TRUE,
    background = NULL,
    # 上传文件
    fileInput("data_tree",
      label = h4("UpLoad data"),
      accept = NULL,
      buttonLabel = "View..."
    ),

    # 选择算法
    selectInput("tree_algorithm",
      label = h4("Select Algorithm"),
      choices = list(
        "FastTree" = "fasttree",
        "RAxML" = "raxml"
      ),
      selected = "fasttree"
    ),

    # 是否展示比对结果
    selectInput("show_tree_figure",
      label = h4("Show Figure or NOT"),
      choices = list(
        "YES" = "yes",
        "NO" = "no"
      ),
      selected = "yes"
    ),

    # 输出文件后缀
    br(),
    textInput("output_file_suffix",
      label = h4("Output File Suffix"),
      value = "ex"
    ),

    # BootStrap数量
    br(),
    textInput("bootstrap_times",
      label = h4("Bootstrap Times"),
      value = "1000"
    ),

    # E-value
    br(),

    # 序列下载格式
    br(),
    selectInput("tree_seq_type",
      label = h4("Output File Type"),
      choices = list(
        "RAxML_bootstrap" = "RAxML_bootstrap",
        "RAxML_bestTree" = "RAxML_bestTree",
        "RAxML_bipartitions" = "RAxML_bipartitions",
        "RAxML_bipartionsBranchLabels" = "RAxML_bipartionsBranchLabels"
      ),
      selected = "RAxML_bestTree"
    ),

    # 提交按钮
    br(),
    fluidRow(
      column(
        width = 1,
        actionButton("tree_submit",
          label = h4("Submit"),
          width = 100,
          icon = NULL
        )
      ),
      column(
        width = 1,
        # offset = 4,
        downloadButton("download_tree",
          label = h4("Download"),
          width = 600
        )
      )
    )
  ),
  tabPanel(h4("Tree Table"),
    width = NULL,
    # height = 920,
    # title = "Table Preview",
    status = "warning",
    solidHeader = TRUE,
    collapsible = TRUE,
    background = NULL,
    br(),
    dataTableOutput("tree_preview")
  ),
  tabPanel(h4("Show Tree"),
    width = NULL,
    # height = 920,
    # title = "Figure Preview",
    status = "warning",
    solidHeader = TRUE,
    collapsible = TRUE,
    background = NULL,
    br(),
    plotOutput("tree_figure")
  )
)