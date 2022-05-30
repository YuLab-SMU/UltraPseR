#' @title get available property
#' @param note Sequence definition types. There are four internal types.{stdprot|didna|dirna|tridna}) 
#' @author Lang Zhou
#' @examples  
#' available_prop(note = "didna")
#' available_prop(note = "stdprot")
#' @export

available_prop <- function(note = "stdprot"){
    available_property(note = note)
    
}