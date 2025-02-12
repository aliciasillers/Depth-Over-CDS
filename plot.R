library(tidyverse)
library(reshape)

#read in data

g1s1 <- read.delim("Fxa1Ag100440SRR5241935.filtered.bed", header = FALSE, sep = '\t')
g1s2 <- read.delim("Fxa1Ag100440SRR5241937.filtered.bed", header = FALSE, sep = '\t')
g1s3 <- read.delim("Fxa1Ag100440SRR5241942.filtered.bed", header = FALSE, sep = '\t')
g1s4 <- read.delim("Fxa1Ag100440SRR7157738.filtered.bed", header = FALSE, sep = '\t')
g1s5 <- read.delim("Fxa1Ag100440SRR7157740.filtered.bed", header = FALSE, sep = '\t')
g2s1 <- read.delim("Fxa3Bg103787SRR5241935.filtered.bed", header = FALSE, sep = '\t')
g2s2 <- read.delim("Fxa3Bg103787SRR5241937.filtered.bed", header = FALSE, sep = '\t')
g2s3 <- read.delim("Fxa3Bg103787SRR5241942.filtered.bed", header = FALSE, sep = '\t')
g2s4 <- read.delim("Fxa3Bg103787SRR7157738.filtered.bed", header = FALSE, sep = '\t')
g2s5 <- read.delim("Fxa3Bg103787SRR7157740.filtered.bed", header = FALSE, sep = '\t')

#format data

g1s1 <- g1s1 %>% mutate(sample = rep("SRR5241935", length(g1s1[,1])), .after = V4)
g2s1 <- g2s1 %>% mutate(sample = rep("SRR5241935", length(g2s1[,1])), .after = V4)
g1s2 <- g1s2 %>% mutate(sample = rep("SRR5241937", length(g1s2[,1])), .after = V4)
g2s2 <- g2s2 %>% mutate(sample = rep("SRR5241937", length(g2s2[,1])), .after = V4)
g1s3 <- g1s3 %>% mutate(sample = rep("SRR5241942", length(g1s3[,1])), .after = V4)
g2s3 <- g2s3 %>% mutate(sample = rep("SRR5241942", length(g2s3[,1])), .after = V4)
g1s4 <- g1s4 %>% mutate(sample = rep("SRR7157738", length(g1s4[,1])), .after = V4)
g2s4 <- g2s4 %>% mutate(sample = rep("SRR7157738", length(g2s4[,1])), .after = V4)
g1s5 <- g1s5 %>% mutate(sample = rep("SRR7157740", length(g1s5[,1])), .after = V4)
g2s5 <- g2s5 %>% mutate(sample = rep("SRR7157740", length(g2s5[,1])), .after = V4)

g1 <- rbind(g1s1, g1s2, g1s3, g1s4, g1s5)
g1 <- cbind(g1$V3, g1$V4, g1$sample)
colnames(g1) <- c("Position", "Coverage", "Sample")
g1 <- as.data.frame(g1)
g1$Coverage <- as.numeric(g1$Coverage)
g2 <- rbind(g2s1, g2s2, g2s3, g2s4, g2s5)
g2 <- cbind(g2$V3, g2$V4, g2$sample)
colnames(g2) <- c("Position", "Coverage", "Sample")
g2 <- as.data.frame(g2)
g2$Coverage <- as.numeric(g2$Coverage)
head(g2)

#average

mean_g1 <- group_by(g1, Position) %>% summarize(Coverage = mean(Coverage, na.rm = TRUE))
mean_g1 <- mean_g1 %>% mutate(Sample = rep("Average", length(mean_g1[,1])), .after = Coverage)
mean_g2 <- group_by(g2, Position) %>% summarize(Coverage = mean(Coverage, na.rm = TRUE))
mean_g2 <- mean_g2 %>% mutate(Sample = rep("Average", length(mean_g2[,1])), .after = Coverage)
head(mean_g2)

g1 <- rbind(g1, mean_g1)
g2 <- rbind(g2, mean_g2)
g1$Sample <- factor(g1$Sample, c("SRR5241935", "SRR5241937", "SRR5241942", "SRR7157738", "SRR7157740", "Average"))
g2$Sample <- factor(g2$Sample, c("SRR5241935", "SRR5241937", "SRR5241942", "SRR7157738", "SRR7157740", "Average"))

#plot

png("depthFxa1Ag100440.png", width = 20, height = 20, units = "cm", res = 900)
plot1 <- ggplot(data = g1, aes(x = Position, y = Coverage, color = Sample, group = Sample)) + geom_line() + scale_color_manual(values = c(SRR5241935 = "gray", SRR5241937 = "gray", SRR5241942 = "gray", SRR7157738 = "gray", SRR7157740 = "gray", Average = "red3")) + theme(legend.position = "none", axis.text.x = element_blank())
print(plot1)
dev.off()
png("depthFxa3Bg203787.png", width = 20, height = 20, units = "cm", res = 900)
plot2 <- ggplot(data = g2, aes(x = Position, y = Coverage, color = Sample, group = Sample)) + geom_line() + scale_color_manual(values = c(SRR5241935 = "gray", SRR5241937 = "gray", SRR5241942 = "gray", SRR7157738 = "gray", SRR7157740 = "gray", Average = "red3")) + theme(legend.position = "none", axis.text.x = element_blank())
print(plot2)
dev.off()
