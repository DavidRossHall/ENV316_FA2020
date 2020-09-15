library(webchem) 
library(rcdk)

CASRN <- c("73829-36-4",
           "196859-54-8",
           "171978-95-3",
           "862374-87-6",
           "1763-23-1",
           "754-91-6")


cids <- get_cid(CASRN) # get's the pubchem Compound IDs (cids)

# Get properties listed on pubchem
x <- pc_prop(cids$cid,
             properties = c("MolecularFormula", 
                            "CanonicalSMILES",
                            "MonoisotopicMass",
                            "XLogP"))

x$CAS <- CASRN


m <- parse.smiles(x$CanonicalSmiles[[6]])[[1]]
dep <- get.depictor(width=300,height = 300,style='nob')
copy.image.to.clipboard(m,dep)
img <- view.image.2d(m,dep)

plot(c(100, 300), c(100, 300), type = "n", xlab = "", ylab = "")
rasterImage(img, 100, 100, 300, 300 )


