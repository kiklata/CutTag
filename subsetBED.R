UCSC <- read.delim("~/Reference/CutTag/UCSC.bed", header=FALSE)
refs = UCSC$V4
genelist = bitr(refs %>% stringr::str_sub(.,1,-3) ,fromType = 'REFSEQ',toType = 'SYMBOL',OrgDb = 'org.Hs.eg.db')

library(GSEABase)
genes = getGmt('~/HALLMARK_CHOLESTEROL_HOMEOSTASIS.v2023.1.Hs.gmt')

geid = geneIds(genes)[[1]]

allrna = genelist %>% filter(.,SYMBOL %in% geid) %>% .['REFSEQ']

sub.UCSC = filter(UCSC, stringr::str_sub(UCSC$V4,1,-3) %in% allrna$REFSEQ) %>% .[1:4]

write.table(sub.UCSC,file = '~/Reference/CutTag/subUCSC.bed',quote = F,row.names = F,col.names = F,sep = '\t')
