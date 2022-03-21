################################################################################
# Setting an OTM colour palette
################################################################################

otm_color_hexes <- c(
  black = "#000000",
  white = "#FFFFFF",
  blue = "#4477AA",
  red = "#EE6677",
  green = "#228833",
  yellow = "#CCBB44",
  cyan = "#66CCEE",
  purple = "#AA3377",
  grey = "#BBBBBB",
  `v-blue` = "#0077BB",
  `v-orange` = "#EE7733",
  `v-cyan`= "#33BBEE",
  `v-magenta` = "#EE3377",
  `v-red` = "#CC3311",
  `v-teal` = "#009988"
)

otm_colors <- function(...){
 
  cols <- c(...)
  
  if(is.null(cols)){
    return(otm_color_hexes)
  }
  
  not_found <- which(!(cols %in%  names(otm_color_hexes)))
  if(length(not_found) > 0){
    warning(paste0("Could not find colors ", paste0(cols[not_found], collapse = ", "), ". Returned NAs instead.\n"))
  }
  
  unname(otm_color_hexes[cols])
}


# Colour Palettes
otm_palettes <- list(
  `main` = otm_colors("blue", "red", "green", "yellow", "cyan", "purple", "grey"),
  `vibrant` = otm_colors("v-blue", "v-orange", "v-teal", "v-cyan", "v-magenta", "v-red", "grey")
)


#' Colour Palettes Generator.
#'
#' Returns a function that can interpolate between colors in a palette.
#'
#' @param palette Character name of a palette
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
otm_pal <- function(palette = "main", reverse = FALSE, ...){
  
  assertthat::assert_that(palette %in% names(otm_palettes),
                          msg = paste0("Palette not found. Please use one of: ", paste0(names(otm_palettes), collapse = ", ")))
  
  pal <- otm_palettes[[palette]]
  
  if(reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}