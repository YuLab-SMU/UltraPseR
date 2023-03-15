#' @title wappers UltraPse in R
#' @param input A FASTA format file for input. The comment line of a sequence in this file should be unique. If you do not specify an in-file, the program will try to read it from keyboard.
#' @param module Representation module choices. This option can appear for multiple times.{comp|pse|dpc|cov|lua|pseb3|user,LIB_OBJECT,MOD_NAME}
#' @param note Sequence definition types. There are four internal types. If the user want to use their own sequence type, a task definition file id required. {stdprot|didna|dirna|tridna}) 
#' @param property Activate the property PROP-ID for current task. This option can appear for multiple times.
#' @param w Omega,a mode specific option. Omega parameter in the pse module. This option can have user defined purpose.
#' @param l Lambda,a mode specific option. Lambda parameter in the pse module. This option can have user defined purpose.
#' @param t Type, a mode specific option. Type parameter in the pse / cov module. This option can have user defined purpose.
#' @importFrom dplyr %>%
#' @author Lang Zhou
#' @return a data.frame
#' @examples
#' tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
#' UpseR(input = tiny_sequences, note = "stdprot", module = "pse", property = "ZIMJ680105")
#' @export

UpseR <- function(input, module = "comp", note = "stdprot", property = "ZIMJ680105", w = 0.05, l = 10, t = 1){
	w <- as.character(w)
	l <- as.character(l)
	t <- as.character(t)
    x <- runUpse(input = input, 
                 #format = format,
                 format = "csv",
                 module = module, 
                 note = note, 
                 property = property, 
                 omega = w, 
                 lambda = l, 
                 type = t) %>% utils::capture.output()
    
    #cover x into data.frame
    y <- lapply(x %>% seq_along, function(i) {
        sequence_names <- sapply(strsplit(x[i], ", "),"[", 1)
        df <- sapply(strsplit(x[i], ", "),"[", -1) %>% as.data.frame
        names(df) <- sequence_names
        return(df)
    })  %>% do.call(cbind,.)
    
    return(y)
    # if( format == "tsv") {
    #     #lapply(seq(length(x)), function(i) {
    #     #    split_x <- strsplit(x[i], "\t") %>% unlist
    #     #    seq_vector <- head(split_x,-1) %>% tail(-1) %>% as.numeric
    #     #    return(seq_vector)
    #     #})
    #     x <- paste0(x, collapse="")
    #     x <- gsub('\\\t\\(null\\)', "\n", x)
    #     x <- utils::read.table(text=x, sep='\t', row.names = 1)
    #     return(x)
    # }else {
    #     return(x)
    # }
}





