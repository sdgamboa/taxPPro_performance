
## This script is only for the habitat attribute
library(bugphyzz)
library(taxPPro)

h <- physiologies('habitat')[[1]]

## Using NCBI_ID ####
h_filtered_ids_fname <- 'habitat_filtered_ids.csv'
if (file.exists(h_filtered_ids_fname)) {
    h_filtered_ids_fname <- read.csv(h_filtered_ids_fname)
} else {
    h_filtered_ids <- preSteps(h, 'NCBI_ID', remove_false = TRUE)
    write.csv(x = h_filtered_ids, file = h_filtered_ids_fname)
}

## Propagate with genus as max level
h_prop_g_ids_fname <- 'habitat_propagated_genus_ids.csv'
if (file.exists(h_prop_g_ids_fname)) {
    h_prop_g_ids <- read.csv(h_prop_g_ids_fname)
} else {
    start_time <- Sys.time()
    h_prop_g_ids <- propagate(h_filtered_ids, 'genus', remove_false = TRUE)
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    h_prop_g_ids$time <- elapsed_time
    h_prop_g_ids$data_type <- 'h_prop_g_ids'
    write.csv(x = h_prop_g_ids, file = h_prop_g_ids_fname)
}

## Propagate with family as max level
h_prop_f_ids <- propagate(h_filtered_ids, 'family', remove_false = TRUE)
h_prop_f_ids_fname <- 'habitat_propagated_family_ids.csv'
if (file.exists(h_prop_f_ids_fname)) {
    h_prop_f_ids <- read.csv(h_prop_f_ids_fname)
} else {
    start_time <- Sys.time()
    h_prop_f_ids <- propagate(h_filtered_ids, 'family', remove_false = TRUE)
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    h_prop_f_ids$time <- elapsed_time
    h_prop_f_ids$data_type <- 'h_prop_f_ids'
    write.csv(x = h_prop_f_ids, file = h_prop_f_ids_fname)
}

## Using Taxon_name ####
h_filtered_taxnames_fname <- 'habitat_filtered_taxnames.csv'
if (file.exists(h_filtered_taxnames_fname)) {
    h_filtered_taxnames_fname <- read.csv(h_filtered_taxnames_fname)
} else {
    h_filtered_taxnames <- preSteps(h, 'Taxon_name', remove_false = TRUE)
    write.csv(x = h_filtered_taxnames, file = h_filtered_taxnames_fname)
}

## Propagate with genus as max level
h_prop_g_taxnames_fname <- 'habitat_propagated_genus_taxnames.csv'
if (file.exists(h_prop_g_taxnames_fname)) {
    h_prop_taxnames_ids <- read.csv(h_prop_g_taxnames_fname)
} else {
    start_time <- Sys.time()
    h_prop_g_taxnames <- propagate(h_filtered_taxnames, 'genus', remove_false = TRUE)
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    h_prop_g_taxnames$time <- elapsed_time
    h_prop_g_taxnames$data_type <- 'h_prop_g_taxnames'
    write.csv(x = h_prop_g_taxnames, file = h_prop_g_taxnames_fname)
}

## Propagate with family as max level
h_prop_f_taxnames <- propagate(h_filtered_taxnames, 'family', remove_false = TRUE)
h_prop_f_taxnames_fname <- 'habitat_propagated_family_taxnames.csv'
if (file.exists(h_prop_f_taxnames_fname)) {
    h_prop_f_taxnames <- read.csv(h_prop_f_taxnames_fname)
} else {
    start_time <- Sys.time()
    h_prop_f_taxnames <- propagate(h_filtered_taxnames, 'family', remove_false = TRUE)
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    h_prop_f_taxnames$time <- elapsed_time
    h_prop_f_taxnames$data_type <- 'h_prop_f_taxnames'
    write.csv(x = h_prop_f_taxnames, file = h_prop_f_taxnames_fname)
}
