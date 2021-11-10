navbarPage(
  "SeqAlign",
  tabPanel(h4("Parameter Setting"),
           width = NULL,
           #height = 920,
           #title = "Parameter Setting",
           status = "danger",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           # 上传文件
           fileInput("data_align",
                     label = h4("UpLoad data"),
                     accept = NULL,
                     buttonLabel = "View..."
           ),
           
           # 是否展示比对结果
           selectInput("show_align_figure",
                       label = h4("Show Figure or NOT"),
                       choices = list("YES"="yes",
                                      "NO"="no"),
                       selected = "yes"),
           
           # 起点
           br(),
           textInput("start_show",
                     label = h4("Show Start Location"),
                     value = "1"),
           
           # 终点
           br(),
           textInput("end_show",
                     label = h4("Show End Location"),
                     value = "50"),
           
           # E-value
           br(),
           
           # 序列下载格式
           br(),
           selectInput("align_seq_type",
                       label = h4("File Type"),
                       choices = list(
                         "Fasta" = "fa",
                         "Txt" = "txt"
                       ),
                       selected = "fa"
           ),
           
           # 提交按钮
           br(),
           fluidRow(
             column(
               width = 1,
               actionButton("align_submit",
                            label = h4("Submit"),
                            width = 100,
                            icon = NULL
               )
             ),
             column(
               width = 1,
               #offset = 4,
               downloadButton("download_align",
                              label = h4("Download"),
                              width = 600
               )
             ))),
  tabPanel(h4("Alignment Result"),
           width = NULL,
           #height = 920,
           #title = "Table Preview",
           status = "warning",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           br(),
           dataTableOutput("align_preview")),
  tabPanel(h4("Show Alignment"),
           width = NULL,
           #height = 920,
           #title = "Figure Preview",
           status = "warning",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           br(),
           plotOutput("align_figure"))
)