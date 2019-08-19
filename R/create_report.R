#' Create rmarkdown report
#'
#' @param output_dir optional out directory to write rmarkdown to
#'
#' @return none, creates rmarkdown report
#' @export
#'

createReport <- function(output_dir = getwd()){
  warning(
  rmarkdown::render(system.file("reproducible_report.Rmd",
                                package = "autoReportR"),
                    output_dir = output_dir)
  )
  warning(getwd())
}
