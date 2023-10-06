#remotes::install_github(repo = "poisonalien/trackplot")
#install dependencies:: bwtool, mysql,
library(trackplot)

bw = c(list.files('/home/zhepan/CutTag/data',full.names = T,pattern = 'bigwig'))
bigWigs = read_coldata(bws = bw, build = "hg38")
pos_loci = "1:154935000-154945000"

#Extract bigWig signal for a loci of interest
t = track_extract(colData = bigWigs, loci =  pos_loci)

#Or you can also specifiy a gene name instead of a loci 
# - loci and gene models will be automatically extracted from UCSC genome browser
#t = track_extract(colData = bigWigs, gene = "SREBF1")
track_cols = c("#d35400","#2980b9")

track_plot(summary_list = t,col = track_cols,
           draw_gene_track = T,
           show_ideogram = T,)
