---
layout: post
category: codenotebook
title:  "Creating a QuasR target file using the terminal"
date:   2014-04-28
categories: Linux codenotebook formatting 
---

I've just recieved some sequencing data from a couple of Illumina HiSeq lanes and need to run some QC and initial analyses for the miR RNA-seq experiment.

As this my introduction into RNA-seq I've been doing a little reading and came across a very nice overview of using R/Bioconductor for RNA-seq analysis: [Thomas Girke - Analysis of RNA-Seq Data with R/Bioconductor](http://faculty.ucr.edu/~tgirke/HTML_Presentations/Manuals/Workshop_Dec_12_16_2013/Rrnaseq/Rrnaseq.pdf)

I've decided to give [QuasR](http://www.bioconductor.org/packages/release/bioc/html/QuasR.html) a go, I'll report back either here or on the blog with progress. To get up and running QuasR requires a targets file which lists all the .fastq (in this case .fastq.gz) files, and their respective ID's under the columns **FileName** and **SampleName**.  Now I could just fire up gedit/sublime text/libreoffice calc etc., however I'm trying to achieve as much as possible with the terminal these days, so I thought I'd put a bit of what I've been learning into practice.

Now there is probably a nice one-liner or more correct way of achieving the below, but I'm documenting this as it's part of my continued learning process (and may be useful for someone else).

    # prep targets file for QuasR RNA-seq analysis
    ls -R | grep '.fastq.gz' > FileName.txt
The above line recursively searches and lists all fastq.gz files, then writes them to the file `FileName.txt`.

    ls -R | grep '.fastq.gz' | cut -c 1-14 > SampleName.txt
This line is the same as above by cuts the first 14 characters from each line and writes them out to `SampleName.txt`.

    ls -d */ > directories.txt
    paste directories.txt FileName.txt -d '' > target_files.txt
    paste target_files.text SampleName.txt > targets_file.txt 
The path to the compressed fastq files needs to be included as the `FileName`. The above writes the directory list of the current 'working directory' and pastes this to the file names extracted earlier. This is then pasted to the SampleNames file to create the 2 column layout required.

    echo -e "FileName\tSampleName" | cat - targets_file.txt > /tmp/out && mv /tmp/out targets_file.txt
Now to create the header line.  QuasR requires that the targets file has 2 columns, with **FileName** and **SampleName** as the header (first row).  The above uses the echo command piped to cat to achieve the final overall targets file.

    rm SampleName.txt FileName.txt target_files.txt directories.txt
Time for a tidy up, this removes all the 'temporary' files.

What it looks like:

    $ head targets_file.txt 
    FileName	SampleName
    Sample_H92V3ADXX-1-10/H92V3ADXX-1-10_TAGCTT_L001_R1_001.fastq.gz	H92V3ADXX-1-10
    Sample_H92V3ADXX-1-11/H92V3ADXX-1-11_GGCTAC_L001_R1_001.fastq.gz	H92V3ADXX-1-11
    Sample_H92V3ADXX-1-12/H92V3ADXX-1-12_CTTGTA_L001_R1_001.fastq.gz	H92V3ADXX-1-12
    Sample_H92V3ADXX-1-I1/H92V3ADXX-1-I1_ATCACG_L001_R1_001.fastq.gz	H92V3ADXX-1-I1
    Sample_H92V3ADXX-1-I2/H92V3ADXX-1-I2_CGATGT_L001_R1_001.fastq.gz	H92V3ADXX-1-I2
    Sample_H92V3ADXX-1-I3/H92V3ADXX-1-I3_TTAGGC_L001_R1_001.fastq.gz	H92V3ADXX-1-I3
    Sample_H92V3ADXX-1-I4/H92V3ADXX-1-I4_TGACCA_L001_R1_001.fastq.gz	H92V3ADXX-1-I4
    Sample_H92V3ADXX-1-I5/H92V3ADXX-1-I5_ACAGTG_L001_R1_001.fastq.gz	H92V3ADXX-1-I5
    Sample_H92V3ADXX-1-I6/H92V3ADXX-1-I6_GCCAAT_L001_R1_001.fastq.gz	H92V3ADXX-1-I6

Final product has two columns, tab-delimited, absolute path as part of FileName, and correct header row. Done.

Now on to the actual QC and analysis steps.