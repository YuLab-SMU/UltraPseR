#' @title wappers UltraPse in R
#' @param input A FASTA format file for input. The comment line of a sequence in this file should be unique. If you do not specify an in-file, the program will try to read it from keyboard.
#' @param format Output format.{svm|tsv|csv}
#' @param module Representation module choices. This option can appear for multiple times.{comp|pse|dpc|cov|lua|pseb3|user,LIB_OBJECT,MOD_NAME}
#' @param note Sequence definition types. There are four internal types. If the user want to use their own sequence type, a task definition file id required. {stdprot|didna|dirna|tridna}) 
#' @param property Activate the property PROP-ID for current task. This option can appear for multiple times.
#' @param w Omega,a mode specific option. Omega parameter in the pse module. This option can have user defined purpose.
#' @param l Lambda,a mode specific option. Lambda parameter in the pse module. This option can have user defined purpose.
#' @param t Type, a mode specific option. Type parameter in the pse / cov module. This option can have user defined purpose.
#' @author Lang Zhou
#' @export

UpseR <- function(input, format = "svm", module = "comp", note = "stdprot", property = "ZIMJ680105", w = 0.05, l = 10, t = 1){
	w <- as.character(w)
	l <- as.character(l)
	t <- as.character(t)
    runUpse(input = input, format = format, module = module, note = note, property = property, omega = w, lambda = l, type = t) 
    #result <- as.data.frame(result)
    #return(result)

}



#' @title get availabel property
#' @param note Sequence definition types. There are four internal types.{stdprot|didna|dirna|tridna}) 
#' @author Lang Zhou
#' @export

availabel_prop <- function(note = "stdprot"){
    available_property(note = note)

}