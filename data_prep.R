library(readr)
library(tidyverse)

luminal_cells_MCF_7 <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017117_luminal_cells_MCF-7_.FPKM.txt")
luminal_cells_T47D <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017118_luminal_cells_T47D_.FPKM.txt")
luminal_cells_BT_474 <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017119_luminal_cells_BT-474_.FPKM.txt")
Basal_cells_SUM_159 <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017120_Basal_cells_SUM-159_.FPKM.txt")
Basal_cells_HBL_100 <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017121_Basal_cells_HBL-100_.FPKM.txt")
Basal_cells_BT_549 <- read_table2("Data/GSE110810_RAW (1)/Raw Counts/GSM3017122_Basal_cells_BT-549_.FPKM.txt")

luminal_cells_MCF_7 <- luminal_cells_MCF_7[,c(1,3)]
luminal_cells_T47D <- luminal_cells_T47D[,c(1,3)]
luminal_cells_BT_474 <- luminal_cells_BT_474[,c(1,3)]
Basal_cells_SUM_159 <- Basal_cells_SUM_159[,c(1,3)]
Basal_cells_HBL_100 <- Basal_cells_HBL_100[,c(1,3)]
Basal_cells_BT_549 <- Basal_cells_BT_549[,c(1,3)]

bc_counts <- full_join(luminal_cells_MCF_7, luminal_cells_T47D, by = "gene_id")
bc_counts <- full_join(bc_counts, luminal_cells_BT_474, by = "gene_id")
bc_counts <- full_join(bc_counts, Basal_cells_BT_549, by = "gene_id")
bc_counts <- full_join(bc_counts, Basal_cells_HBL_100, by = "gene_id")
bc_counts <- full_join(bc_counts, Basal_cells_SUM_159, by = "gene_id")

write.csv(bc_counts, "GSE110810_counts.csv")
