Description
==========
This package perform cellular hypoxia status evaluation by integrating single cell or bulk transcriptome data and hypoxia gene sets. It will:
* calculate hypoxia score in your data
* infer hypoxia status
* identify high- and low-hypoxia subgroups

Installation
==========
Please download the distribution to your specific location. If you are cloning from github, ensure that you have git-lfs installed.

For example

devtools::install_github("zzzzzzz0208/Calhypscore")

remotes::install_github("zzzzzzz0208/Calhypscore")

Input files
==========

  *Gene sets input file (a list of 10 hypoxia gene stes):*
  
  	$geneset1
  	gene1	gene2	gene3	......

  	$geneset2
  	gene1	gene2	gene3	......

  *single cell or bulk expression input file:*

	Two types of input files are allowed:
	(1).Rdata file
 	(2).txt or .csv file

	Two types of expression profile are allowed:
	(1)data.frame
 	(2)matrix

          cell1/sample1  cell2/sample2  cell3/sample3  ......
    gene1      0             1.2            2.3   ......
    gene2     1.7            1.5             0    ......

>For single cell or bulk expression file input, the value can be integer count, such as those derived from RNA-seq experiments, or continuous count, such as RNA-seq log-RPKMs or log-TPMs.

Output files
==========

    After running CalHypscore package, output a list.
    result.Rdata which includes the cells' or samples' id, the user-selected gene set, hypoxia scores, and high/low hypoxia subgroups.
