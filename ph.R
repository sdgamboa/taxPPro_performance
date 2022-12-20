
## This script is only for the habitat attribute
library(bugphyzz)
library(taxPPro)

ph <- physiologies('optimal ph')[[1]]

## Using NCBI_ID ####
ph_filtered_ids_fname <- 'ph_filtered_ids.csv'
if (file.exists(ph_filtered_ids_fname)) {
    ph_filtered_ids <- read.csv(ph_filtered_ids_fname)
} else {
    ph_filtered_ids <- preSteps(ph, 'NCBI_ID', remove_false = TRUE)
    write.csv(x = ph_filtered_ids, file = ph_filtered_ids_fname)
}

## Propagate with genus as max level
ph_prop_g_ids_fname <- 'ph_propagated_genus_ids.csv'
if (file.exists(ph_prop_g_ids_fname)) {
    ph_prop_g_ids <- read.csv(ph_prop_g_ids_fname)
} else {
    start_time <- Sys.time()
    ph_prop_g_ids <- propagate(
        ph_filtered_ids, 'genus', remove_false = TRUE,
        filter.tax.id.type = 'NCBI_ID'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    ph_prop_g_ids$time <- elapsed_time
    ph_prop_g_ids$data_type <- 'ph_prop_g_ids'
    write.csv(x = ph_prop_g_ids, file = ph_prop_g_ids_fname)
}

## Propagate with family as max level
ph_prop_f_ids_fname <- 'ph_propagated_family_ids.csv'
if (file.exists(ph_prop_f_ids_fname)) {
    ph_prop_f_ids <- read.csv(ph_prop_f_ids_fname)
} else {
    start_time <- Sys.time()
    ph_prop_f_ids <- propagate(
        ph_filtered_ids, 'family', remove_false = TRUE,
        filter.tax.id.type = 'NCBI_ID'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    ph_prop_f_ids$time <- elapsed_time
    ph_prop_f_ids$data_type <- 'ph_prop_f_ids'
    write.csv(x = ph_prop_f_ids, file = ph_prop_f_ids_fname)
}

## Using Taxon_name ####
ph_filtered_taxnames_fname <- 'ph_filtered_taxnames.csv'
if (file.exists(ph_filtered_taxnames_fname)) {
    ph_filtered_taxnames_fname <- read.csv(ph_filtered_taxnames_fname)
} else {
    ph_filtered_taxnames <- preSteps(ph, 'Taxon_name', remove_false = TRUE)
    write.csv(x = ph_filtered_taxnames, file = ph_filtered_taxnames_fname)
}

## Propagate with genus as max level
ph_prop_g_taxnames_fname <- 'ph_propagated_genus_taxnames.csv'
if (file.exists(ph_prop_g_taxnames_fname)) {
    ph_prop_taxnames_ids <- read.csv(ph_prop_g_taxnames_fname)
} else {
    start_time <- Sys.time()
    ph_prop_g_taxnames <- propagate(
        ph_filtered_taxnames, 'genus', remove_false = TRUE,
        filter.tax.id.type = 'Taxon_name'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    ph_prop_g_taxnames$time <- elapsed_time
    ph_prop_g_taxnames$data_type <- 'ph_prop_g_taxnames'
    write.csv(x = ph_prop_g_taxnames, file = ph_prop_g_taxnames_fname)
}

## Propagate with family as max level
ph_prop_f_taxnames_fname <- 'ph_propagated_family_taxnames.csv'
if (file.exists(ph_prop_f_taxnames_fname)) {
    ph_prop_f_taxnames <- read.csv(ph_prop_f_taxnames_fname)
} else {
    start_time <- Sys.time()
    ph_prop_f_taxnames <- propagate(
        ph_filtered_taxnames, 'family', remove_false = TRUE,
        filter.tax.id.type = 'Taxon_name'
    )
    end_time <- Sys.time()
    elapsed_time <-  round(difftime(end_time, start_time, units = 'mins'), 1)
    elapsed_time <- as.character(elapsed_time)
    ph_prop_f_taxnames$time <- elapsed_time
    ph_prop_f_taxnames$data_type <- 'ph_prop_f_taxnames'
    write.csv(x = ph_prop_f_taxnames, file = ph_prop_f_taxnames_fname)
}
