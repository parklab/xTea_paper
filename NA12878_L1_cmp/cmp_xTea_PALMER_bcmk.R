#
dev.off(dev.list()["RStudioGD"])

library(VennDiagram)#
p <- draw.pairwise.venn(area1           = 208,
                        area2           = 203,
                        cross.area      = 168,
                        category        = c("xTea", "PALMER paper\nreleased"),
                        fill            = c("blue", "red"),
                        lty             = "blank",
                        cex             = 2,
                        cat.cex         = 2,
                        cat.pos         = c(285, 105),
                        cat.dist        = 0.09,
                        cat.just        = list(c(-1, -1), c(1, 1)))

####