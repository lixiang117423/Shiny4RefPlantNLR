# source需要的安装包
source("./main/global.R")$value

# 定义颜色
style <- "color: #fff; background-color: 	#B22222; border-color: #2e6da4"

# 构建选项卡
sidebar <- dashboardSidebar(
  width = 230,
  sidebarMenu(
    id = "tabs",
    style = "position: relative; overflow: visible;",
    color = "olive",
    tags$style(
      ".tabname {
      font-size: 20px;
      #font-weight: bold;
      color: white;
    }
    #element {
      color: red;
    }
    "
    ),

    # Introduction Item
    menuItem(p(class = "tabname", "Introduction"),
      tabName = "introduction"
      #,icon = icon("bullhorn")
    ),
    # Download Item
    menuItem(p(class = "tabname", "Download"),
      tabName = "download"
      #,icon = icon("paper-plane")
    ),
    # Blast Item
    menuItem(p(class = "tabname", "Blast+"),
      tabName = "blast"
      #,icon = icon("paper-plane")
    ),
    # Alignment Item
    menuItem(p(class = "tabname", "Alignment"),
      tabName = "anlgnment"
      #,icon = icon("paper-plane")
    ),
    # Phylogentic tree Item
    menuItem(p(class = "tabname", "Phylogenetic Tree"),
      tabName = "PhylogeneticTree"
      #,icon = icon("paper-plane")
    )
  )
)

# 选项卡细节
body <- dashboardBody(
  tabItems(
    tabItem(
      tabName = "introduction",
      source("./main/introduction_ui.R", local = TRUE, encoding = "UTF-8")$value
    ),
    tabItem(
      tabName = "download",
      source("./main/download_ui.R", local = TRUE, encoding = "UTF-8")$value
    ),
    tabItem(
      tabName = "blast",
      source("./main/blast_ui.R", local = TRUE, encoding = "UTF-8")$value
    ),
    tabItem(
      tabName = "anlgnment",
      source("./main/anlgnment_ui.R", local = TRUE, encoding = "UTF-8")$value
    ),
    tabItem(
      tabName = "PhylogeneticTree",
      source("./main/PhylogeneticTree_ui.R", local = TRUE, encoding = "UTF-8")$value
    )
  )
)

# 合并选项卡及其细节
ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = "Shiny4RefPlantNLR"),
  sidebar = sidebar,
  body = body
)
