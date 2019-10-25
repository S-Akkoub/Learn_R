# Install package from CRAN
#install.packages("remotes")

# Install package from github
remotes::install_github("kwb-r/kwb.utils")
remotes::install_github("kwb-r/fhpredict@dev")

# Load dataset related to the project "flusshygiene"
riverData <- kwb.utils::loadObject("store_river_data.RData", objectname = "x")

river <- "havel"

riverData$river
riverData[[river]]

identical(riverData$havel, riverData[["havel"]])

riverData$havel$hygiene_havel

x <- riverData$havel
#x <- riverData$ilz

#head(x$hygiene_fischhaus)
#head(x$ka_ilz)
#head(x$q_ilz)

x$hygiene_havel$datum <- x$hygiene_havel$datum + 12*60*60

x$hygiene_havel$conc_ie <- 9999

write.table(
  kwb.utils::selectElements(x, "hygiene_havel"),
  file = "havel.csv", sep = ",", row.names = FALSE, quote = FALSE
)

# na = "NA" soll die fehlende Reihe ersetzen
#Isar
#river <- "isar"

if (FALSE) 
{
  riverData$isar$hygiene_marzling
  x <- riverData$isar
  x$hygiene_marzling$datum <- x$hygiene_marzling$datum + 12*60*60
  write.table(x$hygiene_marzling, file = "isar_temp.csv", row.names = FALSE)
}  

#Ilz
river <- "ilz"

riverData$river
riverData[[river]]

identical(riverData$havel, riverData[["ilz"]])

riverData$ilz$hygiene_fischhaus

x <- riverData$ilz

#head(x$hygiene_fischhaus)
#head(x$ka_ilz)
#head(x$q_ilz)

x$hygiene_fischhaus <- kwb.utils::renameColumns(x$hygiene_fischhaus, list(
  "datum" = "date", 
  "e.coli" = "conc_ec",
  "entero" = "conc_ie"
))

x$hygiene_fischhaus$date <- x$hygiene_fischhaus$date + 12*60*60
x$hygiene_fischhaus$conc_ie[is.na(x$hygiene_fischhaus$conc_ie)] <- 9999

nrow(x$hygiene_fischhaus)

blocks <- kwb.utils::splitIntoFixSizedBlocks(x$hygiene_fischhaus, blocksize = 50)

for (i in seq_along(blocks)) {
  write.table(
    blocks[[i]],
    file = sprintf("ilz_%d.csv", i), sep = ",", row.names = FALSE, quote = FALSE
  )
}

#mosel
river <- "mosel"

riverData$river
riverData[[river]]

identical(riverData$mosel, riverData[["mosel"]])

riverData$mosel$hygiene_mosel

x <- riverData$mosel
#x <- riverData$ilz

#head(x$hygiene_fischhaus)
#head(x$ka_ilz)
#head(x$q_ilz)

x$hygiene_mosel$datum <- x$hygiene_mosel$datum + 12*60*60

write.table(
  kwb.utils::selectElements(x, "hygiene_mosel"),
  file = "mosel.csv", sep = ",", row.names = FALSE, quote = FALSE
)

#Rhein
river <- "rhein"

riverData$river
riverData[[river]]

identical(riverData$rhein, riverData[["rhein"]])

riverData$rhein$hygiene_rhein

x <- riverData$rhein
#x <- riverData$ilz

#head(x$hygiene_fischhaus)
#head(x$ka_ilz)
#head(x$q_ilz)

x$hygiene_rhein$datum <- x$hygiene_rhein$datum + 12*60*60

write.table(
  kwb.utils::selectElements(x, "hygiene_rhein"),
  file = "rhein.csv", sep = ",", row.names = FALSE, quote = FALSE
)

#ruhr
river <- "ruhr"

riverData$river
riverData[[river]]

identical(riverData$ruhr, riverData[["ruhr"]])

riverData$ruhr$hygiene_ruhr

x <- riverData$ruhr
#x <- riverData$ilz

#head(x$hygiene_fischhaus)
#head(x$ka_ilz)
#head(x$q_ilz)

x$hygiene_ruhr$datum <- x$hygiene_ruhr$datum + 12*60*60

write.table(
  kwb.utils::selectElements(x, "hygiene_ruhr"),
  file = "ruhr.csv", sep = ",", row.names = FALSE, quote = FALSE
)
