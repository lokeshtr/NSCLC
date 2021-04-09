# Instructions to use WGCNA analysis.
## 1. <I>Use R for using WGCNA which will make clusters for different colored genes.</I>

open the <b>WGCNA.R</b> file, in the code, set working directory according to your device by using 

<b>setwd("F:/NIBIOHN github/GITHUB/NIBIOHN-NSCLC/WGCNA");</b>



## 2. <i>Install the following dependencies in R using the mentioned commands:</i>

<b>install.packages("stringr")</b>
  
<b>install.packages("WGCNA")</b>

<b>source("http://bioconductor.org/biocLite.R") </b>
## Note:
<b>Make sure MultiProcessing is installed in R to ensure fast processing.</b>



## 3. <i>Running the whole code will give you a file</i> <b>"genevscolors.csv"</b>.

This file shall be used by the next python code as an input to build heatmaps.


# Now, Run the python code "cluster-maps by WGCNA.ipynb" to see the following results:


## Blue colored clusters will show clusterMaps like:

```python

#green = 0 (NSCLC)
#blue = 1 (Normal)

import seaborn as sns; sns.set(color_codes=True)
color_dict=dict(zip(np.unique(y),np.array(['g','b'])))
target_df = pd.DataFrame({"DISEASE_OR_CONTROLLED":y})
row_colors = target_df.DISEASE_OR_CONTROLLED.map(color_dict)

ax = sns.clustermap(train_turquoise,
               metric="correlation",
               row_colors=row_colors, cmap='RdBu')
```

![Blue](https://github.com/saranshqm/NIBIOHN-NSCLC/blob/master/WGCNA/genevscolors/blue.png?raw=true)

## Turquoise colored clusters will show clusterMaps like:

```python

#green = 0 (NSCLC)
#blue = 1 (Normal)

import seaborn as sns; sns.set(color_codes=True)
color_dict=dict(zip(np.unique(y),np.array(['g','b'])))
target_df = pd.DataFrame({"DISEASE_OR_CONTROLLED":y})
row_colors = target_df.DISEASE_OR_CONTROLLED.map(color_dict)

ax = sns.clustermap(train_turquoise,
               metric="correlation",
               row_colors=row_colors, cmap='RdBu')
```

![Turquoise](https://github.com/saranshqm/NIBIOHN-NSCLC/blob/master/WGCNA/genevscolors/turquoise.png?raw=true)

## Grey colored clusters will show clusterMaps like:

```python

#green = 0 (NSCLC)
#blue = 1 (Normal)

import seaborn as sns; sns.set(color_codes=True)
color_dict=dict(zip(np.unique(y),np.array(['g','b'])))
target_df = pd.DataFrame({"DISEASE_OR_CONTROLLED":y})
row_colors = target_df.DISEASE_OR_CONTROLLED.map(color_dict)

ax = sns.clustermap(train_turquoise,
               metric="correlation",
               row_colors=row_colors, cmap='RdBu')
```


![Grey](https://github.com/saranshqm/NIBIOHN-NSCLC/blob/master/WGCNA/genevscolors/grey.png?raw=true)



## Overall clustermap of the whole data-set would be shown like this:

```python

#green = 0 (NSCLC)
#blue = 1 (Normal)

import seaborn as sns; sns.set(color_codes=True)
color_dict=dict(zip(np.unique(y),np.array(['g','b'])))
target_df = pd.DataFrame({"DISEASE_OR_CONTROLLED":y})
row_colors = target_df.DISEASE_OR_CONTROLLED.map(color_dict)

ax = sns.clustermap(x,
               metric="correlation",
               row_colors=row_colors, cmap='RdBu')
```


![overall](https://github.com/saranshqm/NIBIOHN-NSCLC/blob/master/WGCNA/genevscolors/overallclustermap.png?raw=true)




These are the outcomes of WGCNA analysis.

# Note:
In the results shown, there is a column, <b>DISEASE_OR_CONTROLLED</b> which means the color profile of that column will show the <b> disease (Marked in green)</b> or <b>Normal (Marked in Blue)</b>

