
## This script is only for the habitat attribute
library(bugphyzz)
library(taxPPro)

aer <- physiologies('aerophilicity')[[1]]

## Using NCBI_ID ####
aer_filtered_ids_fname <- 'aerophilicity_filtered_ids.csv'
if (file.exists(aer_filtered_ids_fname)) {
    aer_filtered_ids <- read.csv(aer_filtered_ids_fname)
} else {
    aer_filtered_ids <- preSteps(aer, 'NCBI_ID', remove_false = TRUE)
    write.csv(x = aer_filtered_ids, file = aer_filtered_ids_fname)
}

## Propagate with genus as max level
aer_prop_g_ids_fname <- 'aerophilicity_propagated_genus_ids.csv'
if (file.exists(aer_prop_g_ids_fname)) {
    aer_prop_g_ids <- read.csv(aer_prop_g_ids_fname)
} else {
    start_time <- Sys.time()
    aer_prop_g_ids <- propagate(
        aer_filtered_ids, 'genus', remove_false = TRUE,
        filter.tax.id.type = 'NCBI_ID'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    aer_prop_g_ids$time <- elapsed_time
    aer_prop_g_ids$data_type <- 'aer_prop_g_ids'
    write.csv(x = aer_prop_g_ids, file = aer_prop_g_ids_fname)
}

## Propagate with family as max level
aer_prop_f_ids_fname <- 'aerophilicity_propagated_family_ids.csv'
if (file.exists(aer_prop_f_ids_fname)) {
    aer_prop_f_ids <- read.csv(aer_prop_f_ids_fname)
} else {
    start_time <- Sys.time()
    aer_prop_f_ids <- propagate(
        aer_filtered_ids, 'family', remove_false = TRUE,
        filter.tax.id.type = 'NCBI_ID'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    aer_prop_f_ids$time <- elapsed_time
    aer_prop_f_ids$data_type <- 'aer_prop_f_ids'
    write.csv(x = aer_prop_f_ids, file = aer_prop_f_ids_fname)
}

## Using Taxon_name ####
aer_filtered_taxnames_fname <- 'aerophilicity_filtered_taxnames.csv'
if (file.exists(aer_filtered_taxnames_fname)) {
    aer_filtered_taxnames_fname <- read.csv(aer_filtered_taxnames_fname)
} else {
    aer_filtered_taxnames <- preSteps(aer, 'Taxon_name', remove_false = TRUE)
    write.csv(x = aer_filtered_taxnames, file = aer_filtered_taxnames_fname)
}

## Propagate with genus as max level
aer_prop_g_taxnames_fname <- 'aerophilicity_propagated_genus_taxnames.csv'
if (file.exists(aer_prop_g_taxnames_fname)) {
    aer_prop_taxnames_ids <- read.csv(aer_prop_g_taxnames_fname)
} else {
    start_time <- Sys.time()
    aer_prop_g_taxnames <- propagate(
        aer_filtered_taxnames, 'genus', remove_false = TRUE,
        filter.tax.id.type = 'Taxon_name'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    aer_prop_g_taxnames$time <- elapsed_time
    aer_prop_g_taxnames$data_type <- 'aer_prop_g_taxnames'
    write.csv(x = aer_prop_g_taxnames, file = aer_prop_g_taxnames_fname)
}

## Propagate with family as max level
aer_prop_f_taxnames_fname <- 'aerophilicity_propagated_family_taxnames.csv'
if (file.exists(aer_prop_f_taxnames_fname)) {
    aer_prop_f_taxnames <- read.csv(aer_prop_f_taxnames_fname)
} else {
    start_time <- Sys.time()
    aer_prop_f_taxnames <- propagate(
        aer_filtered_taxnames, 'family', remove_false = TRUE,
        filter.tax.id.type = 'Taxon_name'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    aer_prop_f_taxnames$time <- elapsed_time
    aer_prop_f_taxnames$data_type <- 'aer_prop_f_taxnames'
    write.csv(x = aer_prop_f_taxnames, file = aer_prop_f_taxnames_fname)
}
