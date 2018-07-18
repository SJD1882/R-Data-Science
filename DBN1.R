### DEEP BELIEF NETWORK in R

setwd(dir = 'C:/Users/Sebastien David/Advanced-Deep-Learning-Finance/Notebooks')

#install.packages('ROCR')

### LIBRARIES
library(deepnet)
library(caTools)
library(pROC)
library(ROCR)

### LOAD DATASET

X = read.csv('DATA/X.csv', header=TRUE, row.names=1)
Y = read.csv('DATA/application_train.csv', header=TRUE)['TARGET']

x = as.matrix(X)
y = as.matrix(Y)

ind = sample.split(Y=y, SplitRatio=0.7)
Xtrain = x[ind,]
Xvalid = x[!ind,]
Ytrain = y[ind,]
Yvalid = y[!ind,]

### DEEP BELIEF NETWORK w/ RBM
dnn = dbn.dnn.train(x=x, y=y, hidden=c(120, 120, 120), learningrate=0.1,
                    cd=1, numepochs=15, hidden_dropout=0.1)


Ypred = nn.predict(dnn, Xvalid)
auc(Yvalid, Ypred)


### DEEP BELIEF NETWORK w/ DAE

sae = sae.dnn.train(x=x, y=y, hidden=c(100, 100), learningrate=0.8,
                    numepochs=3, sae_output = 'sigm')

Ypred = nn.predict(sae, Xvalid)
auc(Yvalid, Ypred)
