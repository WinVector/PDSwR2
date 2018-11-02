#
# Script to create example data files for section 6.3.3
# of Practical Data Science with R, Second Edition
#

# IMDB corpus: http://s3.amazonaws.com/text-datasets/aclImdb.zip
# 50,000 reviews from Internet Movie Database.
# Extraction script adapted from
# Listing 6.8 of Francois Chollet, J.J. Allaire, Deep Learning with R, Manning 2018
#
# to run script: unzip aclImdb.zip into working directory

library(zeallot)

getdata = function(dir) {
  labels <- c()
  texts <- c()
  for (label_type in c("neg", "pos")) {
    label <- switch(label_type, neg = 0, pos = 1)
    dir_name <- file.path(dir, label_type)
    for (fname in list.files(dir_name, pattern = glob2rx("*.txt"),
                             full.names = TRUE)) {
      texts <- c(texts, readChar(fname, file.info(fname)$size))
      labels <- c(labels, label)
    }
  }
  list(texts = texts, labels=labels)
}


#
#  training set
#

imdb_dir <- "aclImdb"
train_dir <- file.path(imdb_dir, "train")
c(texts, labels) %<-% getdata(train_dir)

# give the texts and labels names
n <- length(texts)
ids <- paste0("train_", 1:n)
names(texts) <- ids
names(labels) <- ids

# scramble the data (default arrangement: negative first, then positive)
set.seed(241397)
ix <- sample.int(n, size=n, replace=FALSE)
texts <- texts[ix]
labels <- labels[ix]

IMDBtrain <- list(texts, labels)

#
# test set
#

test_dir <- file.path(imdb_dir, "test")
c(test_txt, test_labels) %<-% getdata(test_dir)

# give them names
ntest <- length(test_txt)
ids <- paste0("test_", 1:ntest)
names(test_txt) <- ids; names(test_labels) <- ids

IMDBtest <- list(test_txt, test_labels)

saveRDS(IMDBtrain, file="IMDBtrain.RDS")
saveRDS(IMDBtest, file="IMDBtest.RDS")
