

#' Read data from NOAA Real-Time Meteorological Observation Network
#'
#' @param con url
#'
#' @return data.frame
#' @export
#'
readNoaa <- function(con = "https://www.glerl.noaa.gov/metdata/chi/2019/20190421.04t.txt"){
  retrieved_data <- read.delim(con,
                               sep = "",
                               skip = 1)

  if (!identical(class(retrieved_data), "data.frame")) {
    stop("readNoaa() did not return a data frame")
  }

  if (!identical(colnames(retrieved_data),
                c("ID", "Year", "DOY", "UTC", "C", "m.s", "m.s.1", "deg", "X."))) {
    stop("Unexpected column headers returned by readNoaa()")
  }

  if (nrow(retrieved_data) < 5) {
    stop("readNoaa() returne less rows than expected")
  }

  return(retrieved_data)

}



#' Generate url to yesterday's report
#'
#' @return url (string)
#' @export
#'
urlGenerator <- function(){


  date_portion <- paste0(format(Sys.Date() - 1, "%Y/%Y%m%d"))

  paste0("https://www.glerl.noaa.gov/metdata/chi/",
         date_portion,
         ".04t.txt")
}

