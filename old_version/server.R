# source需要的安装包
source("./main/global.R")$value

# 定义颜色
style <- "color: #fff; background-color: 	#B22222; border-color: #2e6da4"

shinyServer(function(input,output,session){
  source("./main/introduction_server.R", local = TRUE, encoding = "UTF-8")$value
  source("./main/download_server.R", local = TRUE, encoding = "UTF-8")$value
  source("./main/blast_server.R", local = TRUE, encoding = "UTF-8")$value
  source("./main/anlgnment_server.R", local = TRUE, encoding = "UTF-8")$value
  source("./main/PhylogeneticTree_server.R", local = TRUE, encoding = "UTF-8")$value
})