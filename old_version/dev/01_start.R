################################################################################
####################### Fill the DESCRIPTION file & Set options ################
################################################################################

golem::fill_desc(
  pkg_name = "shiny4RefPlantNLR", 
  pkg_title = "Identity NLR Proteins with RefPlantNLR", 
  pkg_description = "An R shiny for RefPlantNLR. The shiny app can alllow user 
  to search NLR sequences from RefPlantNLR or Blast their sequences. Then these 
  sequences can be aligned by ClustalO. After these steps, the user can construct
  their phylogenetic tree and Visualize.",
  author_first_name = "Xiang",
  author_last_name = "LI",
  author_email = "lixiang117423@foxmail.com",
  repo_url = "https://github.com/lixiang117423/Shiny4RefPlantNLR"
)     

## Set {golem} options ----
golem::set_golem_options()

## Create Common Files ----
usethis::use_mit_license( "Xiang LI" )
usethis::use_readme_rmd( open = FALSE )
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge(stage = "experimental" )
usethis::use_cran_badge()
usethis::use_news_md( open = FALSE )

## 编译时隐藏某些文件
usethis::use_build_ignore("CODE_OF_CONDUCT.md")
usethis::use_build_ignore("LICENSE.md")
usethis::use_build_ignore("README.Rmd")
usethis::use_build_ignore("app.R")
usethis::use_build_ignore("data-raw/")
usethis::use_build_ignore("dev/")
usethis::use_build_ignore("manifest.json")


## 添加数据
usethis::use_data_raw(name = "all.data", open = TRUE)
usethis::use_data_raw(name = "all.gff", open = TRUE)
#usethis::use_data_raw(name = "iris")





## Use git ----
## usethis::use_git()

## 创建测试文件
golem::use_recommended_tests()

## 使用推荐的依赖关系，在DESCRIPTION中可以找到
golem::use_recommended_deps()

## 使用图标
## golem::use_favicon(path = "inst/app/www/") 
## golem::remove_favicon()

## 添加帮助模块
golem::use_utils_ui() # Copies the golem_utils_ui.R to the R folder.
golem::use_utils_server() # Copies the golem_utils_server.R to the R folder.

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

