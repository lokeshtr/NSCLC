# Integrative analysis of the progression of non-small cell lung cancer (NSCLC)
The study employs an interconnected two-prong approach to investigate the biology of NSCLC. The first approach involved identifying- by the means of feature selection- the key genes whose activities collectively contributed to the onset of progression of NSCLC. This set of selected features was then sourced as inputs for two independent analytical workfows.
    
  1. The first analytical worflow involved a series of steps to examine the functional associations of the selected feature genes, both individually and in a network-context to extract coexpressed gene modules and protein complexes that were likely to shape the outcomes in NSCLC. Functional enrichment analysis was then used to guide the selection of cellular processes and to simulate perturbations and "normalization" in these processes to pinpoint suitable targets for experimental validation and potential therapeutic intervention.
    
  2. The second workflow involved invoking different machine learning approaches to generate prediction models capable of successfully discriminating NSCLC cohort from the healthy.
    
The analytical workflow of the study is summarised in Figure 1.

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
pip install time
pip install mplot3d-dragger
pip install Boruta==0.2
pip install plotly==4.13.0
```
## Feature selection

The code required to perform Feature selection (using Boruta algorithm) is included in the <b>Boruta Feature Selection.ipynb</b> notebook. To perform feature selection, the users must extract the <b>train_data_whole_merged.zip</b> archive to the specified location.

The code generates two output files:
   1. original_data_with_412_genes.csv
   2. test_after_features_selection.csv

These two files form the inputs for the subsequent steps using <b>All Models.ipynb</b>

## Machine learning

The code required to perform machine learning are included in <b>All_Models oversampling KFOLD.ipynb and All Models testing-KFOLDOVERSAMPLING.ipynb </b> notebooks. 

## PPI network analysis

The code required to perform the PPI network analysis referenced in the article
is included in the <b>network_analysis.ipynb</b> notebook.

The code takes as input an undirected graph, expressed as a tab separated (tsv) file of interactions. Normally a file with four columns would be expected, including both Gene symbol and Gene ID for source and target nodes of each interaction.

It is possible to generate three different types of output, each at one of the major steps in the process:

  1. List of clustering results. These are the clusters obtained from using the Markov-Clustering algorithm on the largest  connected component of the input network. The list of clusters includes both the size of the cluster and its members, listed both as Gene Symbols and Gene IDs.

> *Notice that the clustering is not performed on the whole network, but only on its largest connected component.*

  2. List of enriched pathways. Through integration with the TargetMine data warehouse it is possible to perform pahtway enrichment on the resulting clusters, and the list of resulting enriched pathwas can be saved as a csv file.

> *Notice that current configuration performs enrichment only on clusters of more than 5 and less than 20 genes.*
  
  3. Cluster Display. Finally, individual clusters can be illustrated, and the resulting images saved for subsequent analyses. 


## Bayesian simulation

The code required to perform the Bayesian simulation analysis is included in the <b>Bayesian network FOR Rho GDI signalling pathway.ipynb</b> notebook.

The code takes as input gene expression values, expressed as a matrix and generates an output sumarising the conditional probabilities for either NSCLC or Healthy cohorts (determined by selecting 1 or 0, respectively, as input parameters)
    
## For queries, comments and feedback contact
 Saransh Gupta  
 Hashwanth Vundavilli  
 Rodolfo Allendes  
 Lokesh P. Tripathi
