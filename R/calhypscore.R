
#' @title Calculate hypoxia score
#' @description This function allows users to select different hypoxia gene sets to calculate the hypoxia score per sample, and the default parameter is RWnetHS.
#'
#' @param expr should be a data.frame or matrix
#' @param geneset a hypoxia gene set
#' @param class "continuous" or "count"
#' @param index from 1 and 10, and the default value is 1
#'
#' @return hypoxia score, high group, low group and median score
#' @export
#' @importFrom GSVA gsva
#'
#' @examples
#' res<-calhypscore(ExpMatrix, Hypoxia.Sig, class='count', index = 1); res
calhypscore <- function(expr, geneset, class, index = 1) {
  selected_gene_set <- geneset[[index]]
  cat("calculate ssGSEA score, the hypoxia gene set is :", names(geneset)[index], "\n")

  if (class == 'count') {
    cat("input expression values are integer counts, kcdf = 'Poisson'\n")
    kcdf_value <- "Poisson"
  } else if (class == "continuous") {
    cat("input expression values are continuous, kcdf = 'Gaussian'\n")
    kcdf_value <- "Gaussian"
  }
  ssgsea_score <- GSVA::gsva(as.matrix(expr), list(selected_gene_set),
                             method = "ssgsea",kcdf = kcdf_value, verbose = TRUE)
  rownames(ssgsea_score) <- names(geneset)[index]

  median_score <- median(ssgsea_score)
  high_group <- colnames(ssgsea_score)[which(ssgsea_score >= median_score)]
  low_group <- colnames(ssgsea_score)[which(ssgsea_score < median_score)]

  return(list(
    ssgsea_score = ssgsea_score,
    high_group = high_group,
    low_group = low_group,
    median_score = median_score
  ))
}
