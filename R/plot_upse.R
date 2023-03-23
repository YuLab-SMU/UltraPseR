#' @title plot UltraPseR result
#' @param seq_result Data.frame, the result after running UpseR()
#' @param line_size line size
#' @param alpha alpha
#' @param spline_shape A numeric vector of values between -1 and 1, which control the shape of the spline relative to the control points.
#' @importFrom tidyr gather
#' @importFrom RColorBrewer brewer.pal
#' @importFrom ggplot2 ggplot
#' @importFrom ggalt geom_xspline
#' @importFrom ggplot2 scale_x_continuous
#' @importFrom ggplot2 scale_color_manual
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes_
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_bw
#' 
#' 
#' @author Lang Zhou
#' @return ggplot2 object
#' @examples
#' tiny_sequences <- system.file("extdata", "tiny.fas", package = "UltraPseR")
#' y <- UpseR(input = tiny_sequences, 
#'            note = "stdprot", module = "pse", property = c("ZIMJ680105"), 
#'            w = 0.1, l = 10, t = 1)
#' @export

plot_upse <- function(seq_result, 
                      line_size = 1, 
                      alpha = 0.7,
                      spline_shape = 0.4) {
    y <- seq_result
    
    try( 
        if(!is.data.frame(y)) stop("The input is incorrect") 
    )
    
    y$pos <- rownames(y) %>% as.numeric
    df_y <- gather(y,key = "id", value = "value",-pos)
    cols <- brewer.pal(n = 6, name = "Set2")
    x_label <- pretty(df_y$pos, n = (length(df_y$pos %>% unique) /2) )
    p <-ggplot(df_y, aes_(x =~ pos, y = ~value, group = ~id, color = ~id)) + 
        #geom_point() + 
        geom_xspline(size = line_size, alpha = alpha, spline_shape = spline_shape) +
        scale_x_continuous(breaks = x_label, labels = x_label) +
        scale_color_manual(values = cols) +
        labs(y = NULL, x = "Position", color = "Sequences") +
        theme_bw() + 
        theme(panel.grid.minor.y = element_blank(),
              panel.grid.major.x = element_blank(),
              panel.grid.minor.x = element_blank())
    return(p)
}

utils::globalVariables(c("."))
utils::globalVariables(c("pos"))