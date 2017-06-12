---
title: Introduction to Genomewide Association Studies
author: Miles Benton
date: 2015-06-26T10:15:30+12:00
slug: gwas-workshop
categories: [workshop, tutorial, GWAS, PLINK, R]
tags: []
description: 'An introductory workshop to GWAS analysis using PLINK and R'
topics: []
---

In this workshop we will explore the basics of performing Genomewide Association Studies (GWAS) using a combination of the software `plink` (http://pngu.mgh.harvard.edu/~purcell/plink/) and `R` (http://www.r-project.org/).

At a later stage (a separate workshop) we will also introduce the `GenABEL` package which offers additional functionality of genomic association analyses in `R`.

This workshop is written to be accessible to a range of people, from those that have never performed any command-line work, to those that just want a refresher. As such I have written it to include clear and straight forward outlines of all `R` and plink operations, most of the time stepping through these one line at at time.

### Workshop manual and files

The workshop manual is available in the form of the `GWAS_workshop.pdf` file from my GitHub, here is the [repository](https://github.com/sirselim/Intro_to_GWAS). This contains all the information and code to run through the entire workshop, as well as hopefully helpful information.

#### Set up

  1. Either clone into this [repository](https://github.com/sirselim/Intro_to_GWAS) or download via the `Download ZIP` button to the right (on GitHub), then start `R` and ensure this repository is set as your working directory.
  2. In `R` run the following: `source('scripts/GWAS_workshop_setup.R')`. The GWAS_workshop_setup.R script is provided to automatically:
    + extract the example data to example/
    + download OS specific version of `plink` 
    + extract `plink` binary to bin/
  3. Once you have performed the above you should be able to follow along with the workshop manual.