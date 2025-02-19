library(ggtree)
library(ape)
library(tidyverse)

setwd("/analysis")

treefile <- read.tree("combine_all_geno_PASS_final_snp.min4.phy.treefile")


p <- ggtree(treefile, branch.length = "none") + 
  geom_tiplab(size = 3)  # 显示叶节点标签

#p <- p + geom_text2(aes(subset = !isTip, label = label), hjust = -0.3)  # 显示 bootstrap 支持值

print(p)

group_info <- read.csv("group_info.csv")  # 分组信息

p <- ggtree(treefile, layout='circular', branch.length = "none") %<+% group_info +  
  geom_tiplab(aes(color = tissue), size = 3) +  
  geom_tiplab(aes(label = pathology), hjust = 1.5, size = 2.5, offset = 0.02) +
  theme(legend.position = "right")  

print(p)


ggsave("phylogenetic_tree.pdf", plot = p, width = 10, height = 8)


# pca
library(ggplot2)
library(ggrepel)
pca_data <- read.table("./pca.eigenvec", header=FALSE)

# 绘制 PCA 图（使用 PC1 和 PC2）
p<-ggplot(pca_data, aes(V3, V4)) + 
  geom_point(size=3) +
  xlab("PC1") + ylab("PC2") +
  geom_text_repel(aes(label=V1), vjust=-1, hjust=0.5)+
  ggtitle("PCA plot for AS 34 strains") +
  theme_minimal()

ggsave("pca.pdf", plot = p, width = 10, height = 8)
