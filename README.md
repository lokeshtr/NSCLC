# Integrative analysis of the progression of non-small cell lung cancer (NSCLC)
This repository includes the datasets, files and scripts associated with the research published in "An integrative machine learning and bayesian modeling approach highlights the crucial roles of Rho-GDI signaling pathway in the progression of non-small cell lung cancer (NSCLC)"

# Publication
Saransh Gupta, Haswanth Vundavilli, Rodolfo S. Allendes Osorio, Mari N. Itoh, Attayeb Mohsen, Aniruddha Datta,Kenji Mizuguchi, Lokesh P. Tripathi. An integrative machine learning and bayesian modeling approach highlights the crucial roles of Rho-GDI signaling pathway in the progression of non-small cell lung cancer (NSCLC). 

## Analysis workflow:

The analytical workflow can be categorised as follows:
1. Data cleaning and processing.
2. Feature selection.
3. Assessment and functional enrichment analysis of the selected features.
4. Using an ensemble of <b>Machine Learning Algorithms</b> to generate prediction models that can discriminate NSCLC cohort from Healthy cohort.
5. Comparative assessment of ML classifiers.
6. Using Bayesian simulation to assess the mechanistics of pathway perturbations in NSCLC.
7. PPI network analysis, network sub-cluster extraction (using MCL algorithm) and functional enrichment analysis of selected clusters.

## Installation

Readers are advised to use the package manager [pip](https://pip.pypa.io/en/stable/) to install the following dependencies.

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
# Please ensure that all the files are accessible on your local machine.

## Use Boruta feature selection

1. Use <b>Boruta Feature Selection.ipynb</b>

2. Unzip "train_data_whole_merged.zip" to the local directory and save to the main working directory where the zip file was earlier saved. 

3. Execute the code to commence processing.

4. After the processing step, two output files will be generated:
   1. original_data_with_412_genes.csv
   2. test_after_features_selection.csv
  These two files form the inputs for the subsequent steps using <b>All Models.ipynb</b>

## Prediction models

1. Open <b>All_Models oversampling KFOLD.ipynb and All Models testing-KFOLDOVERSAMPLING.ipynb </b> (make sure all dependencies mentioned above are installed, if not then install using the commands above)


2. Rull All cells and wait for some time while all other models are compiling the results.

3. After compilation, please check the results of each and every model.

## Bayesian simulation

1. Run "Bayesian network FOR Rho GDI signalling pathway.ipynb", input 0 if you want the simulation for the dataset containing only the healthy cohorts, else 1 for the NSCLC cohorts

2. check the conditional probabilities obtained.

## Directions to use <b> Dimensional reduction analysis.ipynb and Analyzing FC values for train and test.ipynb</b>

1. Run the code, and get the results

## For specific queries contact
