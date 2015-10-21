---
layout: post
category: blog
title:  "That's my root partition you're hogging! Moving R site-library on Unix machines."
date:   2015-10-21
categories: R package-management library
---

I recently noticed that my `/` (root) partition was not so slowly running out of space. This was somewhat alarming as I'd given it a generous 23Gb of SSD space which is surely overkill for a Debian install...

Well it turns out that the culprit was `R`, more specifically the default site-library located in `/usr/local/lib/R/site-library`:  

```sh
$ sudo du -h /usr/local/lib/R/site-library
6.0G	/usr/local/lib/R/site-library/
```

That's **6Gb** of R packages dominating my root directory, thanks Bioconductor! Actually I'm most likely to blame through my running of `R` and `RStudio` via `sudo`, a bad habit I got into because `RStudio` was a little 'quirky' running as a normal user on Debain (though I haven't checked this in a while).

After piecing together information from various searches I thought I'd document how I dealt with moving and reassigning this site-library containing the majority of my `R` packages.

**Just a quick note before proceeding, it goes without saying that the use of `sudo` can be disastrous - you have been warned!**

First thing to do is define where you'd like your new 'main' or site-library to live. I chose `/home` as this means that if I ever have to install the OS I'll still have all of my many R packages (no large downloads is always good).

```sh
$ sudo mkdir /home/R/site-library
```

Next thing is to locate and modify the files that run on R startup, these are commonly referred to as environment files. On my system these reside at `/etc/R/Renviron` and `/etc/R/Renviron.site` respectively. 

```sh
$ locate Renviron
/etc/R/Renviron
/etc/R/Renviron.site
```

For more information on these files, and for an in-depth overview of the R startup routine type `help(startup)` in `R`, there is a wealth of information.

First file to modify is `Renviron` (I've done this using `nano`, obviously you have many options to edit text files):

```sh
$ sudo nano /etc/R/Renviron
```

The line we're most interested in is the one containing `R_LIBS_SITE`. You'll notice a series of library paths separated by a `:`. I replaced the `/usr/local/lib/R/site-library` path with the newly created '/home/R/site-library'. Save and exit.

Next we apply a similar edit to the `Renviron.site` file:

```sh
$ sudo nano /etc/R/Renviron.site
```

Specifically you want to uncomment (remove the `#` from the start) the line containing `R_LIBS` and replace the default path with '/home/R/site-library'. Save and exit.

Now that these changes have been made it's time to copy across all the packages from the default site-library (mine was `/usr/local/lib/R/site-library`) to the new non-root library:

```sh
$ sudo cp -rv /usr/local/lib/R/site-library /home/R/
```
*Note: the cp command above will move the site-library directory and all its contents, hence me leaving site-library off /home/R/*

The `-rv` arguments tell the `cp` command to copy recursively (all directories and their files) and output verbosely. 

With that done time to fire up `R` and check to see if a) `.libPaths()` outputs the correct library paths, and b) all the packages are visible and working. I was initially a little worried, even though my `.libPaths()` looked correct I couldn't find my packages... Turns out there was a little typo, once corrected everything was working as expected. Nice!

So the last thing to do is to free up all that space on the root partition. I didn't do this earlier as it's nice to have a back up plan should something go horribly wrong! If the worst were to happen and I couldn't get my new library operating I knew all I had to do was return the paths to default in `Renviron` and `Renviron.site`. However, no we are up and running time to toast that great waste of root space:

```sh
$ sudo rm -R /usr/local/lib/R/site-library*
```

There we have it, much more space on the root partition that eases my drive cleanliness OCD.