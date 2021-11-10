## 
golem::add_fct("nav")
golem::add_fct("row")

## 添加模块
golem::add_module(name = "home")
golem::add_module(name = "about")
golem::add_module(name = "download")
golem::add_module(name = "blast")
golem::add_module(name = "alignment")
golem::add_module(name = "tree")

## 下方的代码将整个app中依赖的包都写进DESCRIPTION文件中
usethis::use_package("shiny")
usethis::use_package("shinydashboard")
usethis::use_package("shinyWidgets")
usethis::use_package("dplyr")
usethis::use_package("data.table")
usethis::use_package("stringr")
usethis::use_package("markdown")
usethis::use_package("knitr")
usethis::use_package("reshape2")
usethis::use_package("ggmsa",)
usethis::use_package("ggtree")
usethis::use_package("treeio")
usethis::use_package("golem")
usethis::use_pipe()

## 添加帮助文档
golem::add_fct( "helpers" ) 
golem::add_utils( "helpers" )

## 添加其他文件inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "handlers" )
golem::add_css_file( "custom" )

## 添加测试文件
usethis::use_test( "app" )

## 添加Vignette
usethis::use_vignette("shiny4RefPlantNLR")
devtools::build_vignettes()

## 添加浏览器button
golem::browser_button()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
## usethis::use_github()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

