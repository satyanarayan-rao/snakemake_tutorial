library(ggplot2)
library(ggthemes)
library(dplyr)
library(tidyr)
# input stream should have two columns only 
# head -5 /beevol/home/satyanarr/softlinks/pu1_len_dist/estimating_pdx_using_positive_control_v2/stats/to_plot.tsv
#0.092	MCF7
#0.083	MCF7
#0.096	MCF7
#0.1	MCF7
#0.094	MCF7
args = commandArgs (trailingOnly = T)
dt = read.table(file("stdin"), sep = "\t", header = F, stringsAsFactors = F)


print (head(dt))
num_cat = length(unique(dt$V2))
dt$V2 = factor(dt$V2, levels = unique(dt$V2), ordered = T)
# ------------------- #
font_size = 10
figure2_theme <- function (){
    theme (axis.text.y =element_text(vjust =1))+
    theme(plot.title=element_text( size=font_size )) +
    theme(axis.title.x = element_text(colour = "black", size = font_size),
          axis.title.y = element_text(colour = "black", size = font_size)) +
    theme(axis.text.x = element_text(size = font_size),
          axis.text.y = element_text(size = font_size, vjust = 0.5, hjust = 0.5)) +
    theme(legend.title= element_text(size = font_size),
          legend.text = element_text(size = font_size)) +
    theme(axis.line.x = element_line(color="black", size = 0.5),
          axis.line.y = element_line(color="black", size = 0.5)) + 
    theme(plot.title = element_text(hjust = 0.5)) + 
    theme(legend.position = "bottom") 
}

nrows = nrow(dt)
plt = ggplot(dt, aes(x = V2, y = V1)) + geom_boxplot(notch = F) + 
    geom_rangeframe() + 
#   theme_bw(line_scale_size = 0.1) 
   theme_few() + 
   xlab("") + ylab(args[2]) + ggtitle(args[3])  + 
   figure2_theme()  + labs(color = "") 
pdf(args[1], height = 4, width = 1.5 * num_cat)
print(plt)
dev.off()
