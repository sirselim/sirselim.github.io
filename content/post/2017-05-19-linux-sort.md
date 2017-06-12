---
title: Useful Linux sort variants
author: ~
date: '2014-04-10 10:55:29'
slug: linux-sort
categories: []
tags: [linux, codenotebook]
description: ''
draft: yes
topics: []
---

I just wanted a quick reference to look back on.

You have a list of chromosomes in a random order:

	$ cat chr.list
	chr3
	chr6
	chr2
	chr11
	chr5
	chr7
	chr9
	chr10
	chr1
	chr4
	chr8
	chr12
	chr20
	chr22


Default sort:

	$ cat chr.list | sort
	chr1
	chr10
	chr11
	chr12
	chr2
	chr20
	chr22
	chr3
	chr4
	chr5
	chr6
	chr7
	chr8
	chr9


Sort with --version-sort:

	$ cat chr.list | sort --version-sort
	chr1
	chr2
	chr3
	chr4
	chr5
	chr6
	chr7
	chr8
	chr9
	chr10
	chr11
	chr12
	chr20
	chr22


Another way to get the same as above:

	$ cat chr.list | sort -t 'r' -n -k2
	chr1
	chr2
	chr3
	chr4
	chr5
	chr6
	chr7
	chr8
	chr9
	chr10
	chr11
	chr12
	chr20
	chr22


It's just another way to sort/order, one which is more consistent with
files that would be entered into various genomic analyses.  Hope this
is helpful.