#' A Blinking Function
#'
#' This function provides a limited wrapper to the Blink1 device. To learn more about 
#' the device https://blink1.thingm.com/
#' 
#'
#' @param times the number of times to blink
#' @param Color the name of the color to blink
#'
#' 
#' @keywords package
#' @export
#' @examples
#' blink()
#' 
#' 

blink <- function(times = 3 , color ="blue",printcomm=FALSE){
  
  myColors <-structure(list(Color = c("white", "red", "lime", "blue", "yellow", 
                                      "cyan", "magenta", "silver", "gray", "maroon", "olive", "green", 
                                      "purple", "teal", "navy"), RGB = structure(c(3L, 14L, 9L, 6L, 
                                                                                   16L, 10L, 15L, 2L, 1L, 11L, 13L, 7L, 12L, 8L, 5L), .Label = c("-128,128,128",
                                                                                                                                                 "-192,192,192", "-255,255,255", "/", "0,0,128", "0,0,255", "0,128,0", 
                                                                                                                                                 "0,128,128", "0,255,0", "0,255,255", "128,0,0", "128,0,128", 
                                                                                                                                                 "128,128,0", "255,0,0", "255,0,255", "255,255,0"), class = "factor")),
                       .Names = c("Color", "RGB"),
                       row.names = c(1L, 2L, 3L, 4L, 5L, 6L, 8L, 10L, 11L, 12L, 
                                     13L, 14L, 15L, 16L, 17L), class = "data.frame")
  
  rgbValue <- myColors[myColors$Color==color,]$RGB
  pathToBlink <- "C:\\blink\\blink1-tool.exe"
  myBlink <- paste0(pathToBlink," --rgb ",rgbValue," --blink ",times)
  if(printcomm==T) print(myBlink)
  system(command = myBlink,show.output.on.console= F,
         ignore.stdout = T, ignore.stderr = T)
}
