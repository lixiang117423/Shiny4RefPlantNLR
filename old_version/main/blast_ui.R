navbarPage(
  "Blast",
  
  tabPanel(h4("Parameter Setting"),
           width = NULL,
           #height = 920,
           #title = "Parameter Setting",
           status = "danger",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           # 上传文件
           fileInput("data_blast",
                     label = h4("UpLoad data"),
                     accept = NULL,
                     buttonLabel = "View..."
           ),
           
           # 序列下载格式
           br(),
           selectInput("blast_seq_type",
                       label = h4("Sequences Type"),
                       choices = list(
                         "Amino acid" = "aa",
                         "CDS" = "cds",
                         "Domain" = "domain"
                       ),
                       selected = "aa"
           ),
           
           # E-value
           br(),
           textInput("blast_evalue",
                     label = h4("E-value"),
                     value = "1e-5"
           ),
           
           # Out format
           br(),
           selectInput("blast_format",
                       label = h4("Output Format"),
                       choices = list(
                         "1" = "1",
                         "2" = "2",
                         "3" = "3",
                         "4" = "4",
                         "5" = "5",
                         "6" = "6",
                         "7" = "7",
                         "8" = "8",
                         "9" = "9",
                         "10" = "10",
                         "11" = "11",
                         "12" = "12"
                       ),
                       selected = "6"
           ),
           
           # 提交按钮
           br(),
           fluidRow(
             column(
               width = 1,
               actionButton("blast_submit",
                            label = h4("Submit"),
                            width = 100,
                            icon = NULL
               )
             ),
             column(
               width = 1,
               #offset = 4,
               downloadButton("download_blast",
                              label = h4("Download"),
                              width = 600
               )
             )
           ),
           # 下载结果

  ),
  tabPanel(h4("Blast Preview"),
           width = NULL,
           #height = 920,
           #title = "Preview",
           status = "warning",
           solidHeader = TRUE,
           collapsible = TRUE,
           background = NULL,
           br(),
           dataTableOutput("blast_preview"))
)