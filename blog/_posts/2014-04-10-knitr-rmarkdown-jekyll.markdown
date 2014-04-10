---
layout: post
category: blog
title: "Blogging with Knitr, RMarkdown, and Jekyll"
date:   2014-04-10
categories: RMarkdown Knitr Jekyll
---

Those that know me (and those that read enough of this site) understand that I have a great fondness for R. R was the first programming language that I really picked up, way back at the start of my PhD. I credit it for how far I've come, and giving me a greater urge to learn additional programming languages and techniques. Recently I've started to embark on the reproducible research path because I really believe in the philosophy behind it, and it makes life a whole lot easier when it comes to writing manuscripts!

For years I've done my analysis and teaching in RStudio, and in line with above I've just migrated report writing over to knitr and RMarkdown. In keeping with this, I thought it would be nice to have RMarkdown files (<code>rmd</code>) integrated into my blogging process.  

After a bit of searching I came across this wonderful post at [jfisher-usgs](http://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/). I have used this as the basis for my <code>rmd</code> blogging needs.

The [knitr](http://yihui.name/knitr/) package provides an easy way to embed 
[R](http://www.r-project.org/) code in a [Jekyll-Bootstrap](http://jekyllbootstrap.com/) 
blog post. The only required input is an **R Markdown** source file. The file I used in this example is <code>"2014-04-10-knitr-rmarkdown-jekyll.rmd"</code>.
<br />
<br />

## In R

Open the R Console and process the source file:

{% highlight r %}
KnitPost <- function(input, base.url = "/") {
  require(knitr)
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  knit(input, envir = parent.frame())
}
KnitPost("2014-04-10-knitr-rmarkdown-jekyll.rmd")
{% endhighlight %}
<br />

## Move the files

Move the resulting image folder *2014-04-10-knitr-rmarkdown-jekyll* and **Markdown** file *2014-04-10-knitr-rmarkdown-jekyll.md* to the local repository.
The KnitPost function assumes that the image folder will be placed in a **figs/** folder located at the root of the repository.
<br />
<br />

## Modify your css (once-off)  

Add the following CSS code to the appropriate css file to center images:

    [alt=center] {
      display: block;
      margin: auto;
    }

That's it.

***

Here are a few examples of embedding R code:

{% highlight r %}
summary(cars)
{% endhighlight %}



{% highlight text %}
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
{% endhighlight %}



{% highlight r %}
par(mar = c(4, 4, 0.1, 0.1), omi = c(0, 0, 0, 0))
plot(cars)
{% endhighlight %}

![center](/figs/2014-04-10-knitr-rmarkdown-jekyll_rmd/fig1.png) 

##### Figure 1: Caption
<br />

{% highlight r %}
par(mar = c(2.5, 2.5, 0.5, 0.1), omi = c(0, 0, 0, 0))
filled.contour(volcano)
{% endhighlight %}

![center](/figs/2014-04-10-knitr-rmarkdown-jekyll_rmd/fig2.png) 

##### Figure 2: Caption

And don't forget your session information for proper reproducible research.

{% highlight r %}
sessionInfo()
{% endhighlight %}



{% highlight text %}
## R version 3.1.0 RC (2014-04-05 r65382)
## Platform: x86_64-pc-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_NZ.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_NZ.UTF-8        LC_COLLATE=en_NZ.UTF-8    
##  [5] LC_MONETARY=en_NZ.UTF-8    LC_MESSAGES=en_NZ.UTF-8   
##  [7] LC_PAPER=en_NZ.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_NZ.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitr_1.5.14
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.3 formatR_0.10.3 stringr_0.6.2  tools_3.1.0
{% endhighlight %}
<br />

***

I want to take this a bit further when I get the time and automate the process so that the figures and <code>md</code> files are output to the correct directories. This is a fantastic start though and I'm looking forward to embedding lots of R content within future posts.