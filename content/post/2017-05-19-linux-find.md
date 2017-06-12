---
title: Linux find examples
author: Miles Benton
date: '2014-06-10'
slug: linux-find
categories: []
tags: [linux, codenotebook]
description: ''
draft: yes
topics: []
---

I just wanted to record a few short find commands that are very fast and useful.

To find all the files modified on a specific date, in the case below the 13th May 2014:

	$ find . -type f -name "*" -newermt 2014-05-13 ! -newermt 2014-05-14
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.hh
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.log
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.map
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.nof
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.ped
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.hh
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.log
	./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.nof
	./Presentations/Genemappers_2014/conference_notes/example_expression_variance.png
	./Presentations/Genemappers_2014/conference_notes/notes_20140513.txt

You can also append ls to the above to get more detailed information about the files:

	$ find . -type f -name "*" -newermt 2014-05-13 ! -newermt 2014-05-14 -ls
	17990    8 -rw-------   1 miles    miles        4859 May 13 17:28 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.hh
	17989    4 -rw-------   1 miles    miles        2283 May 13 17:28 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.log
	17993    1 -rw-------   1 miles    miles         521 May 13 17:28 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.map
	17991    1 -rw-------   1 miles    miles          11 May 13 17:28 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.nof
	17992   28 -rw-------   1 miles    miles       27914 May 13 17:28 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/male_Y_SNPS.ped
	17972    8 -rw-------   1 miles    miles        4859 May 13 17:20 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.hh
	8221    4 -rw-------   1 miles    miles        2052 May 13 17:20 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.log
	17974    1 -rw-------   1 miles    miles          11 May 13 17:20 ./Phd/NI_genetic_data/SNPloci_update_May-2013/bed/plink.nof
	18064   12 -rw-------   1 miles    miles       10627 May 13 19:37 ./Presentations/Genemappers_2014/conference_notes/example_expression_variance.png
	17995    4 -rw-------   1 miles    miles        1794 May 13 19:39 ./Presentations/Genemappers_2014/conference_notes/notes_20140513.txt

You can also specify the type of files that should be returned if found.

.txt: 

	$ find . -type f -name "*.txt" -newermt 2014-05-13 ! -newermt 2014-05-14
	./Presentations/Genemappers_2014/conference_notes/notes_20140513.txt

.png: 

	$ find . -type f -name "*.png" -newermt 2014-05-13 ! -newermt 2014-05-14 -ls
	18064   12 -rw-------   1 miles    miles       10627 May 13 19:37 ./Presentations/Genemappers_2014/conference_notes/example_expression_variance.png
