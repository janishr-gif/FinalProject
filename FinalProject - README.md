# FinalProject
R coding script for FinalProject of DAT 511 graduate course
---
title: "FinalProject ReadMe"
author: "Robert Janish Jr."
date: "`r Sys.Date()`"
output: html_document
---

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

This file should explain how scripts run and how they are connected and any other relevant details pertaining to this project.

Project Title: 
	Analysis of the U.S. National Oceanic and Atmospheric Administration's (NOAA) Storm Database

Dataset: 
  This analysis requires choosing most recent files and ensure all have same dates on them.
		StormEvents_details-ftp_v1.0_d2024_c20250818.csv
		StormEvents_fatalities-ftp_v1.0_d2024_c20250818.csv
		StormEvents_locations-ftp_v1.0_d2024_c20250818.csv

Objective: 
  The goal of this assignment is to explore the NOAA Storm Database and answer basic questions about severe weather events, which can be referenced in the Synopsis section   of the R Markdown document. The database must be used to answer questions for            assignment and the analysis will consist of tables, figures, or other summaries, which   are found under the Results section of the same document.

Files:
1.	NOAA Weather.md includes the following:
			-Title
			-Synopsis (describes and summarizes project analysis)
			-Data Processing (words/results)			
			-Results (plots and other supporting documents)

2.	FinalProject.R is the script used to process this data information 

3.	The plots, among other documents, will be included in the R Markdown document.

Libraries and packages required:
		library(Dplyr)
		library(readr)
		library(ggplot2)
		library(knitr)
		
