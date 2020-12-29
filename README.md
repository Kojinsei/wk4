<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
*** This README.md is based on the Best-README-Template (https://github.com/othneildrew/Best-README-Template).
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** Kojinsei, wk4, twitter_handle, email, project_title, project_description
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
![GitHub](https://img.shields.io/github/license/Kojinsei/wk4)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/Kojinsei/wk4)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/Kojinsei/wk4)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Kojinsei/wk4)
![GitHub Repo stars](https://img.shields.io/github/stars/Kojinsei/wk4?style=social)
![GitHub forks](https://img.shields.io/github/forks/Kojinsei/wk4?label=Forks&style=social)

<!-- ABOUT THE PROJECT -->
## About wk4
## Peer-graded Assignment for Getting and Cleaning Data Course Project
This is the peer-graded assingnment for "Week 4, Getting and Cleaning Data" by Johns Hopkins University at Coursera.
* Date: Dec 25, 2020
* Author: Koji Chono

Original data is available from UCI Machine Learning Repository
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Platform and R version Information
| System Info | |
|---|---|
| platform | x86_64-apple-darwin17.0 |
| arch | x86_64 |
| os | darwin17.0 |
| system | x86_64, darwin17.0 |

| Version status | |
|---|---|
| major | 4 |
| minor | 0.2 |
| year | 2020 |
| month | 06 |
| day | 22 |
| svn rev | 78730 |
| language | R |
| version.string | R version 4.0.2 (2020-06-22)|
| nickname | Taking Off Again |
| RStudio | Version 1.3.1073 |

## Files
- [run_analysis.R](run_analysis.R)
  - R script file contains the assignment script.

- [tidyData1.txt](tidyData1.txt)
- [tidyData2.txt](tidyData1.txt)
  - Exported Data tables of resultsData1 and resultsData2 using `fwrite()` function.

- [exScript.R](exScript.R)
  - Extra script to merge Inertial Singals data sets.

<!-- GETTING STARTED -->
## Getting Started
### Prerequirements
This script requires the following three packages

- [tidyr](https://cran.r-project.org/web/packages/tidyr/index.html)
- [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html)
- [reshape2](https://cran.r-project.org/web/packages/reshape2/index.html)
- [data.table](https://cran.r-project.org/web/packages/data.table/index.html)
  - *Notes*: reshape2 has already been retired. They recommend using tidyr package instead.

```R
requiredPkgs <- c("tidyr", "dplyr", "reshape2", "data.table")
sapply(requiredPkgs, require, character.only=TRUE, quietly=FALSE)
rm(requiredPkgs)
```


### Run R script
1. Download the dataset from the original repository,[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  - *Note:* The directory name must be `UCI HAR Dataset`
  
2. Store the file in your R working directory

3. Download a local copy and run `source()` function
```R
source("run_analysis.R")
```
4. Check your result object `resultsData1` and `resultsData2` and output files [tidyData1.txt](tidyData1.txt) and [tidyData2.txt](tidyData2.txt) in the working directory, respectively.
```R
View(resultsData1) #or simply resultsData1
View(resultsData2) #or simply resultsData2
```


<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.


<!-- CONTACT -->
## Contact

Kojinsei - [@KojiChono](https://twitter.com/KojiChono)
Project Link: [https://github.com/Kojinsei/wk4](https://github.com/Kojinsei/wk4)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Coursera](https://www.coursera.org)
* [Othneil Drew](https://github.com/othneildrew): Best-README-Template, An awesome README template to jump start your projects!
