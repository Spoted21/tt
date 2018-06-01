#Convert Unix time to datetime object
unixToMtn <- function(x) {
  as.POSIXct(as.numeric(as.character(x)),origin="1970-01-01",tz="GMT")
}

