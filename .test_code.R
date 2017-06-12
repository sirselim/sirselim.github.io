devtools::install_github('rstudio/blogdown')

# require(blogdown)
options(servr.daemon = TRUE)
# blogdown::new_site(theme = 'gcushen/hugo-academic')
# blogdown::new_site()
blogdown::serve_site()
# blogdown::install_theme('yoshiharuyamashita/blackburn')
# blogdown::new_post('testing-RMarkdown')

blogdown::new_post('GWAS-workshop', subdir = 'workshops-tutorials/', author = 'Miles Benton')
blogdown::new_post('EWAS-workshop', subdir = 'workshops-tutorials/', author = 'Miles Benton')
blogdown::new_post('bootNet', subdir = 'projects/', author = 'Miles Benton')
blogdown::new_post('nihs-project', subdir = 'projects/', author = 'Miles Benton')


# blogdown::new_content(path = '/test.md', kind = "default")


