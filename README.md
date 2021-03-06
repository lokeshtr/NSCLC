# Integrative analysis of the progression of non-small cell lung cancer (NSCLC)
The study employs an interconnected two-prong approach to investigate the biology of NSCLC. The first approach involved identifying- by the means of feature selection- the key genes whose activities collectively contributed to the onset of progression of NSCLC. This set of selected features was then sourced as inputs for two independent analytical workfows.
    
  1. The first analytical worflow involved a series of steps to examine the functional associations of the selected feature genes, both individually and in a network-context to extract coexpressed gene modules and protein complexes that were likely to shape the outcomes in NSCLC. Functional enrichment analysis was then used to guide the selection of cellular processes and to simulate perturbations and "normalization" in these processes to pinpoint suitable targets for experimental validation and potential therapeutic intervention.
    
  2. The second workflow involved invoking different machine learning approaches to generate prediction models capable of successfully discriminating NSCLC cohort from the healthy.
    
This repository contains the scripts and datasets for the analysis done in this study.

# Publication
Saransh Gupta, Haswanth Vundavilli, Rodolfo S. Allendes Osorio, Mari N. Itoh, Attayeb Mohsen, Aniruddha Datta,Kenji Mizuguchi, Lokesh P. Tripathi. An integrative machine learning and bayesian modeling approach highlights the crucial roles of Rho-GDI signaling pathway in the progression of non-small cell lung cancer (NSCLC). 

## Installation

Users are advised to use the package manager [pip](https://pip.pypa.io/en/stable/) to install the following dependencies.

```bash
pip install numpy==1.18.5
pip install markov-clustering==0.0.6.dev
pip install pickle-mixin==1.0.2
pip install joblib==0.17.0
pip install pandas==1.1.4
pip install pgmpy==0.1.11
pip install networkx==1.19.4
pip install pylab-sdk==1.3.2
pip install scikit-learn==0.22.2.post1
pip install xgboost==1.2.1
pip install scipy==1.5.4
pip install catboost==0.4
pip install lightgbm==2.3.1
pip install imbalanced-learn==0.6.2
pip install seaborn==0.11.0
pip install matplotlib==3.3.3
pip install mplot3d-dragger
pip install Boruta==0.2
pip install plotly==4.13.0
```
## Feature selection

The code required to perform Feature selection (using Boruta algorithm) is included in the <b>Boruta Feature Selection.ipynb</b> notebook.

The code takes as input the gene expression profiles of 10077 genes and their classes (Normal/NSCLC).

Sklearn library "Labelencoder" was used to encode Normal as 1 and NSCLC (Disease) as 0.

This process involves a series of steps.

1. Step 1 involved building of two different dataframes:

    1. features dataframe:
        -   It contains all of the genes with their gene expression values
    2. target variable (y):
        -   It contains the classes Normal (1) and Disease (0)

2. The above two dataframes form the inputs for Boruta Feature Selection, which uses Random Forest Classifiers to estimate the variable importance feature.

3. The features obtained using Boruta Feature Selection were examined for overlaps with an independent test set, which was a dataset of gene expression profiles of NSCLC samples from an independent experiment. 412 out of 489 genes overlapped across the two datasets and hence were retained for machine learning.

After these steps, the following output files were obtained:

   1. training_data_after_feature_selection.csv
   2. test_data_after_feature_selection.csv

## Machine learning

The code required to perform machine learning are included in <b>ML Analysis/ML_Classifiers.ipynb </b>. 

The code takes training_data_after_feature_selection.csv as input to build  machine learning models.

To address the issue of high class-imbalance, we used an oversampling technique "SMOTE" to oversample the minority (Normal/Healthy) class. The oversampled dataset was 
used to generate prediction models using different machine learning classifiers. This process included training the models on a training data and test the results on validation and test dataset. Model performances were evaluated by testing their prediction performances on the validation set. We estimated the accuracies and the area under the AUC-ROC score using the scikit-learn package.

## PPI network analysis

The code required to perform the PPI network analysis referenced in the article
is included in the <b>Network and Systems Approach/MCL_analysis.ipynb</b> notebook.

The code takes as input an undirected graph, expressed as a tab separated (tsv) file of interactions. Normally a file with four columns would be expected, including both Gene symbol and Gene ID for source and target nodes of each interaction.

It is possible to generate three different types of output, each at one of the major steps in the process:

  1. List of clustering results. These are the clusters obtained from using the Markov-Clustering algorithm on the largest connected component of the input network. The list of clusters includes both the size of the cluster and its members, listed both as Gene Symbols and Gene IDs.

> *Notice that the clustering is not performed on the whole network, but only on its largest connected component.*

  2. List of enriched pathways. Through integration with the TargetMine data warehouse it is possible to perform pahtway enrichment on the resulting clusters, and the list of resulting enriched pathwas can be saved as a csv file.

> *Notice that current configuration performs enrichment only on clusters of more than 5 and less than 20 genes.*
  
  3. Cluster Display. Finally, individual clusters can be illustrated, and the resulting images saved for subsequent analyses. 


## Bayesian simulation

The code required to perform the Bayesian simulation analysis is included in the <b>Bayesian network Analysis.ipynb</b> notebook.

The code takes as input gene expression values (of all genes in the Rho-GDI signalling pathway; see text), expressed as a matrix and generates an output sumarising the conditional probabilities for either NSCLC or Healthy cohorts (determined by selecting 1 or 0, respectively, as input parameters)

1. In the first step, the gene-expression values were discretized, using a mean threshold into binary values. Values greater than the threshold were normalized as '1' and values lesser than the threshold were all normalized as '0'.

2. Next step involved building a bayesian network equivalent of the RhoGDI sigaling pathway using <b>networkx</b> for the Bayesian network analysis.

3. Finally, conditional probabilities i.e. the probability that an output gene was over-expressed given an upstream gene was under-expressed simultaneously, for all genes within the network were inferred and were used to pinpoint potential targets for therapeutic gene intervention.
    
## For queries, comments and feedback contact
 Saransh Gupta (saransh.official.iitkgp[at]gmail.com)  
 Hashwanth Vundavilli (hashwanthvv[at]gmail.com)  
 Rodolfo Allendes (rallendes[at]nibiohn.go.jp)  
 Kenji Mizuguchi (kenji[at]nibiohn.go.jp)  
 Lokesh P. Tripathi (lokesh[at]nibiohn.go.jp. lokesh.tripathi[at]riken.jp)  
