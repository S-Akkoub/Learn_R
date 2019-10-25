# Install package from CRAN
#install.packages("remotes")

# Install package from github
remotes::install_github("kwb-r/kwb.utils")
remotes::install_github("kwb-r/fhpredict@dev")

# Load dataset related to the project "flusshygiene"
riverData <- kwb.utils::loadObject("store_river_data.RData", objectname = "x")

river <- "havel"

#request function?

    if ((river <- "havel") == TRUE) 
    {
      riverData$river
      riverData$havel$hygiene_havel
      x <- riverData$havel
      #rename parameters
      x$hygiene_havel <- kwb.utils::renameColumns(x$hygiene_havel, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_havel$datum <- x$hygiene_havel$datum + 12*60*60
      write.table(x$hygiene_havel, file = "havel_temp.csv", sep = ",",
                  row.names = FALSE, quote = FALSE)
      
    } else if ((river <- "rhein") == TRUE){
      riverData$river
      riverData$rhein$hygiene_rhein
      x <- riverData$rhein
      #rename parameters
      x$hygiene_rhein <- kwb.utils::renameColumns(x$hygiene_rhein, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_rhein$datum <- x$hygiene_rhein$datum + 12*60*60
      write.table(x$hygiene_rhein, file = "rhein_temp.csv", sep = ",",
                  row.names = FALSE, quote = FALSE)
      
    } else if ((river <- "mosel") == TRUE){
      riverData$river
      riverData$mosel$hygiene_mosel
      x <- riverData$mosel
      #rename parameters
      x$hygiene_mosel <- kwb.utils::renameColumns(x$hygiene_mosel, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_mosel$datum <- x$hygiene_mosel$datum + 12*60*60
      write.table(x$hygiene_mosel, file = "mosel_temp.csv", sep = ",", 
                  row.names = FALSE, quote = FALSE)
      
    } else if ((river <- "ruhr") == TRUE){
      riverData$river
      riverData$ruhr$hygiene_ruhr
      x <- riverData$ruhr
      #rename parameters
      x$hygiene_ruhr <- kwb.utils::renameColumns(x$hygiene_ruhr, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_ruhr$datum <- x$hygiene_ruhr$datum + 12*60*60
      write.table(x$hygiene_ruhr, file = "ruhr_temp.csv", sep = ",",
                  row.names = FALSE, quote = FALSE)
      
    } else if ((river <- "isar") == TRUE){
      riverData$river
      riverData$isar$hygiene_marzling
      x <- riverData$isar
      #rename parameters
      x$hygiene_marzling <- kwb.utils::renameColumns(x$hygiene_marzling, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_marzling$datum <- x$hygiene_marzling$datum + 12*60*60
      write.table(x$hygiene_marzling, file = "isar_temp.csv", sep = ",",
                  row.names = FALSE, quote = FALSE)
      
    } else if ((river <- "ilz") == TRUE){
      riverData$river
      riverData$ilz$hygiene_fischhaus
      x <- riverData$ilz
      #rename parameters
      x$hygiene_fischhaus <- kwb.utils::renameColumns(x$hygiene_fischhaus, list(
        "datum" = "date", 
        "e.coli" = "conc_ec",
        "entero" = "conc_ie"
      ))
      x$hygiene_fischhaus$datum <- x$hygiene_fischhaus$datum + 12*60*60
      write.table(x$hygiene_fischhaus, file = "ilz_temp.csv", sep = ",",
                  row.names = FALSE, quote = FALSE)
    }

# absolutley nothing new

