# informalexample 8.12 of section 8.4.2 
# (informalexample 8.12 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 

k <- 1       	# Note: 1 
(significance_cutoff <- k / nrow(score_frame))
# [1] 0.001831502
score_frame$selected <- score_frame$sig < significance_cutoff
                                

suppressPackageStartupMessages(library("dplyr")) 	# Note: 2 

score_frame %>%
  group_by(., code, selected) %>%
  summarize(., 
            count = n()) %>%
  ungroup(.) %>%
  cdata::pivot_to_rowrecs(., 
                          columnToTakeKeysFrom = 'selected',
                          columnToTakeValuesFrom = 'count',
                          rowKeyColumns = 'code',
                          sep = '=') 

# # A tibble: 5 x 3
#   code  `selected=FALSE` `selected=TRUE`
#   <chr>            <int>           <int>
# 1 catB                12              21
# 2 catP                 7              26
# 3 clean              158              15
# 4 isBAD               60             111
# 5 lev                 74              62

# Note 1: 
#   Use our filter significances at k / nrow(score_frame) heuristic with k = 1 

# Note 2: 
#   Bring in the dplyr package to help summarize the selections. 

