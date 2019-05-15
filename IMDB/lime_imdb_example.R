#
# Convenience functions to run examples from section 6.3.3
# of Practical Data Science with R, Second Edition
#



library(wrapr)
library(xgboost)
# if this fails, make sure text2vec is installed:
# install.packages("text2vec")
library(text2vec)


#
# function that takes a training corpus (texts)
# and returns a vocabulary: 10,000 words that
# appear in at least 10% of the documents, but
# fewer than half.
#
create_pruned_vocabulary <- function(texts) {
  # create an iterator over the training set
  it_train <- itoken(texts,
                    preprocessor = tolower,
                    tokenizer = word_tokenizer,
                    ids = names(texts),
                    progressbar = FALSE)

  # tiny stop word list
  stop_words <- qc(the, a, an, this, that, those, i, you)
  vocab <- create_vocabulary(it_train, stopwords = stop_words)

  # prune the vocabulary
  # prune anything too common (appears in over half the documents)
  # prune anything too rare (appears in less than 0.1% of the documents)
  # limit to 10,000 words after that
  pruned_vocab <- prune_vocabulary(
    vocab,
    doc_proportion_max = 0.5,
    doc_proportion_min = 0.001,
    vocab_term_max = 10000
  )

  pruned_vocab
}


# take a corpus and a vocabulary
# and return a sparse matrix (of the kind xgboost will take)
# rows are documents, columns are vocab words
# this representation loses the order or the words in the documents
make_matrix <- function(texts, vocab) {
  iter <- itoken(texts,
                preprocessor = tolower,
                tokenizer = word_tokenizer,
                ids = names(texts),
                progressbar = FALSE)
  create_dtm(iter, vocab_vectorizer(vocab))
}

#
# Input:
# - dtm_train: document term matrix of class dgCmatrix
# - labelvvec: numeric vector of class labels (1 is positive class)
#
# Returns:
# - xgboost model
#
fit_imdb_model <- function(dtm_train, labels) {
  # run this estimate the number of rounds
  # needed for xgboost
  # cv <- xgb.cv(dtm_train, label = labels,
  #             params=list(
  #               objective="binary:logistic"
  #               ),
  #             nfold=5,
  #             nrounds=500,
  #             print_every_n=10,
  #             metrics="logloss")
  #
  # evalframe <- as.data.frame(cv$evaluation_log)
  # NROUNDS <- which.min(evalframe$test_logloss_mean)

  # we've run it already, so here's a good answer
  NROUNDS <- 371


  model <- xgboost(data=dtm_train, label=labels,
                  params=list(
                    objective="binary:logistic"
                  ),
                  nrounds=NROUNDS,
                  verbose=FALSE)

  model
}

