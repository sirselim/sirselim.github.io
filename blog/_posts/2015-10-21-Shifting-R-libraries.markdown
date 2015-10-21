---
layout: post
category: blog
title:  "That's my root partition you're hogging! Moving R site-library on Unix machines."
date:   2015-10-21
categories: R package-management library
---

I recently noticed that my `/` partition was not so slowly running out of space. This was somewhat alarming as I'd given it a generious 23Gb of SSD space which is surely overkill for a Debian install...

Well it turns out that the culprit was `R`, more specifically the default site-library located in `/usr/local/lib/R/site-library`:  

    sudo du -h /usr/local/lib/R/site-library
    6.0G	/usr/local/lib/R/site-library/

That's **6Gb** of R packages dominating my root directory, thanks Bioconductor!

After piecing together information from various searches I thought I'd document how I dealt with moving and reassigning this site-library containing the majority of my `R` packages.


