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

It takes "train_data_whole_merged.csv" as input. This file contains gene expression dataset of 10077 genes and their classes (Normal / Healthy).

We use sklearn library "Labelencoder" to encode Normal as 1 and Disease as 0.

The we create two different dataframes:

    1. features dataframe:
        -   It contains all of the genes with their gene expression values
    2. target variable (y):
        -   It contains the classes Normal (1) and Disease (0)

Once we have these dataframes, we then use them as input for Boruta Feature Selection which uses Random Forest Classifiers as a method to train.

Once Boruta Feature Selection gets compiled, we get 489 Genes as output which are more contributing for stratifying between NSCLC and Normal.
After we get the dataset with 489 features (genes), we then check how many of those 489 features are actually present in out test dataset.

We found that 412/489 genes were present in the test dataset, hence we retained the data-set containing only 412 genes, because further we want to train a machine learning model
if features do not match, we can not test our model on the test dataset.

After these steps, we get our final outputs:

   1. original_data_with_412_genes.csv
   2. test_after_features_selection.csv


These two files form the inputs for the subsequent steps using <b>All Models.ipynb</b>

## Machine learning

The code required to perform machine learning are included in <b>All_Models oversampling KFOLD.ipynb and All Models testing-KFOLDOVERSAMPLING.ipynb </b> notebooks. 

Here we take original_data_with_412_genes.csv an input which was the final output of feature-selection pipeline.
Using the gene-expression values as features and healthy/disease as target variable, we generate a machine learning model here.

While analyzing the data, we observed a high class-imbalance between the two classes, hence to balance the classes, we used an oversampling technique "SMOTE".

Once we get the final data after oversampling, we feed them to different Machine Learning classifiers, train them on the training data and test the results on validation and test dataset.

In the notebook, we demonstrate the results of our different ML classifiers on the training, validation and test dataset using pre-trained models.

The results of Machine Learning models on the test dataset confirms that the 412 genes that we have selected have significant role in stratifying Cancer and Normal Cohorts.

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

Here, we take the complete data as an input and select gene-expression values of only those genes which have a role in Rho-GDI signalling pathway.
The code takes as input gene expression values, expressed as a matrix and generates an output sumarising the conditional probabilities for either NSCLC or Healthy cohorts (determined by selecting 1 or 0, respectively, as input parameters)

For the sake of simplicity, we first discretize the continuous gene-expression values into binary values.
Then we make a graph using <b>networkx</b> and then solve the graph using The Bayesian Simulation.

Once the above graph is solved, we get the upregulated and downregulated genes in the Rho-GDI Signalling pathway.

    
## For queries, comments and feedback contact
 Saransh Gupta  
 Hashwanth Vundavilli  
 Rodolfo Allendes  
 Lokesh P. Tripathi
