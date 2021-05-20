# Integrative analysis of the progression of non-small cell lung cancer (NSCLC)
The analytical workflow of the study is summarised in Figure 1. The study employs an interconnected two-prong approach to investigate the biology of NSCLC. The first approach involved identifying- by the means of feature selection- the key genes the activities of which collectively contribute to the onset of progression of NSCLC. This set of seleted features was then fed into two independent analytical workfows.
    The first analytical pipeline involved a series of steps to examine the functional associations of the selected feature genes, both individually and in a network-context to extract coexpressed gene modules and protein complexes that were likely to shape the outcomes in NSCLC. Functional enrichment analysis was then used to simulate the perturbations and "normalization" of target pathways to pinpoint suitable targets for experimental validation and optential therapeutic intervention.
    The second approach involved inoking a seriies of Machine Leanring approaches to generate prediction models capable of successfully discriminating NSCLC cohort from the healthy.

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
## Use Boruta feature selection

1. Unzip "train_data_whole_merged.zip" to the specified location and run through the commands in <b>Boruta Feature Selection.ipynb</b>

2. At he end of the process two output files will be generated:
   1. original_data_with_412_genes.csv
   2. test_after_features_selection.csv
  These two files form the inputs for the subsequent steps using <b>All Models.ipynb</b>

## Machine learning

1. Open and run through the steps in <b>All_Models oversampling KFOLD.ipynb and All Models testing-KFOLDOVERSAMPLING.ipynb </b> 

2. The process is time-consuming tso the users may have to wait while the models compile their output.

3. After compilation, the users may examine the idividual outputs.

## PPI network analysis


## Bayesian simulation

1. Run "Bayesian network FOR Rho GDI signalling pathway.ipynb", input 0 if the user wishes to simulate for the healthy cohort. else 1 for the NSCLC cohort.

2. The output files will list the conditional probabilities inferred for each cohort.

## For queries, comments and feedback contact
Saransh Gupta
Hashwanth Vundavilli
Lokesh P. Tripathi
