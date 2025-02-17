#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(realpath $(dirname $0))
DATA_DIR=${SCRIPT_DIR}/../data

download(){
   URL=$1
   FILE=$(basename ${URL})
   if [[ ! -e ${DATA_DIR}/${FILE} ]]; then
      >&2 echo Downloading ${FILE}
      wget --quiet ${URL} -O ${DATA_DIR}/${FILE}
   else
      >&2 echo ${FILE} already exists
   fi
}

# Jurkat Cells https://www.10xgenomics.com/datasets/jurkat-cells-1-standard-1-1-0
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/jurkat/jurkat_filtered_gene_bc_matrices.tar.gz

# 293T Cells https://www.10xgenomics.com/datasets/293-t-cells-1-standard-1-1-0
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/293t/293t_filtered_gene_bc_matrices.tar.gz

# 50%:50% Jurkat:293T Cell Mixture https://www.10xgenomics.com/datasets/50-percent-50-percent-jurkat-293-t-cell-mixture-1-standard-1-1-0
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/jurkat:293t_50:50/jurkat:293t_50:50_filtered_gene_bc_matrices.tar.gz

# Peripheral blood mononuclear cells (PBMCs) from a healthy donor (same donor as pbmc8k)
# https://www.10xgenomics.com/datasets/4-k-pbm-cs-from-a-healthy-donor-2-standard-2-1-0
download https://cf.10xgenomics.com/samples/cell-exp/2.1.0/pbmc4k/pbmc4k_filtered_gene_bc_matrices.tar.gz

# 3k Pan T Cells from a Healthy Donor
# https://www.10xgenomics.com/datasets/3-k-pan-t-cells-from-a-healthy-donor-2-standard-2-1-0
download https://cf.10xgenomics.com/samples/cell-exp/2.1.0/t_3k/t_3k_filtered_gene_bc_matrices.tar.gz

# 293T and 3T3 Cell Mixture
# https://www.10xgenomics.com/datasets/293-t-and-3-t-3-cell-mixture-1-standard-1-1-0
download https://cf.10xgenomics.com/samples/cell-exp/1.1.0/293t_3t3/293t_3t3_filtered_gene_bc_matrices.tar.gz

# Human Glioblastoma Multiforme cells from a male donor aged 57
# https://www.10xgenomics.com/datasets/human-glioblastoma-multiforme-3-v-3-whole-transcriptome-analysis-3-standard-4-0-0
download https://cf.10xgenomics.com/samples/cell-exp/4.0.0/Parent_SC3v3_Human_Glioblastoma/Parent_SC3v3_Human_Glioblastoma_filtered_feature_bc_matrix.tar.gz

# 2020-A reference packages are backward compatible with Cell Ranger v3.1.0 and prior.
# https://www.10xgenomics.com/support/software/cell-ranger/latest/release-notes/cr-reference-release-notes
download https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz

# PBMC donors
download https://cf.10xgenomics.com/samples/cell-exp/9.0.0/5k_Human_Donor1_PBMC_3p_gem-x_5k_Human_Donor1_PBMC_3p_gem-x/5k_Human_Donor1_PBMC_3p_gem-x_5k_Human_Donor1_PBMC_3p_gem-x_count_sample_filtered_feature_bc_matrix.h5
download https://cf.10xgenomics.com/samples/cell-exp/9.0.0/5k_Human_Donor2_PBMC_3p_gem-x_5k_Human_Donor2_PBMC_3p_gem-x/5k_Human_Donor2_PBMC_3p_gem-x_5k_Human_Donor2_PBMC_3p_gem-x_count_sample_filtered_feature_bc_matrix.h5
download https://cf.10xgenomics.com/samples/cell-exp/9.0.0/5k_Human_Donor3_PBMC_3p_gem-x_5k_Human_Donor3_PBMC_3p_gem-x/5k_Human_Donor3_PBMC_3p_gem-x_5k_Human_Donor3_PBMC_3p_gem-x_count_sample_filtered_feature_bc_matrix.h5
download https://cf.10xgenomics.com/samples/cell-exp/9.0.0/5k_Human_Donor4_PBMC_3p_gem-x_5k_Human_Donor4_PBMC_3p_gem-x/5k_Human_Donor4_PBMC_3p_gem-x_5k_Human_Donor4_PBMC_3p_gem-x_count_sample_filtered_feature_bc_matrix.h5

>&2 echo Done
exit 0
