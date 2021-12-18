################################################################################
# Define an OTM ggplot style
################################################################################

# otm_logo <- readPNG("otm_logo.png")

theme_otm <- function(legend_show = FALSE, subtitle = FALSE) { 
  font <- "Peclet"   
  label_color <- otm_colors("teal")
  
  if(legend_show == TRUE){
    legend_position <- "right"
  } else {
    legend_position <- "none"
  }
  
  if(subtitle == TRUE){
    title_spacing <- 7
  } else {
    title_spacing <- 15
  }
  
  
  theme_minimal() %+replace%    # work from minimal as base
    
    theme(
      axis.line.x = element_line(size = .5),
      # axis.line.y = element_line(size = .5),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),  
      axis.ticks = element_blank(),    
      
      #text elements
      plot.title = element_text(
        family = font,
        size = 16,
        face = 'bold',
        hjust = 0,
        vjust = 2,
        margin=margin(7,0,title_spacing,0)),
      
      plot.title.position = "plot",
      
      plot.subtitle = element_text(
        family = font,
        vjust = 2,
        hjust = 0,
        size = 14,
        margin=margin(0,0,15,0)),
      
      plot.caption = element_text(
        family = font,
        size = 9,
        hjust = 0,
        margin=margin(7,0,0,0)),
      
      plot.caption.position = "plot",
      
      axis.title = element_text(
        family = font,  
        color = label_color,
        size = 10),
      
      axis.text = element_text(
        family = font,
        size = 9),
      
      axis.text.x = element_text(
        margin=margin(5, b = 10)),
      
      # Legend
      legend.position = legend_position,
      
    )
}