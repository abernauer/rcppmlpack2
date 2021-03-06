# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Run a Cover Tree distance measure analysis which provides a specialised 
#'
#' This function performs a distance calculation using a Cover Tree.
#' A cover tree is a tree specifically designed to speed up nearest-neighbor
#' computation in high-dimensional spaces.  Each non-leaf node references a
#' point and has a nonzero number of children, including a \dQuote{self-child} which
#' references the same point.  A leaf node represents only one point.
#'
#' @title Run a Cover Tree distance analysis
#' @param dataset A matrix of training data values
#' @param k An integer specifying the number of dimensions
#' @return A list with two elements giving the nighbors and their distances
#' @examples
#' data(testData1kBy3)
#' mat <- t(testData1kBy3)
#' res <- coverTreeNeighbor(mat, 5)
coverTreeNeighbor <- function(dataset, k) {
    .Call(`_RcppMLPACK_coverTreeNeighbor`, dataset, k)
}

#' Run a k-means clustering analysis, returning a list of cluster assignments
#'
#' This function performs a k-means clustering analysis on the given data set.
#'
#' @title Run a k-means clustering analysis
#' @param data A matrix of data values
#' @param clusters An integer specifying the number of clusters
#' @return A list with cluster assignments
#' @examples
#' x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
#'            matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
#' colnames(x) <- c("x", "y")
#' cl <- kMeans(x, 2)
#'
#' data(trees, package="datasets")
#' cl2 <- kMeans(t(trees),3)
kMeans <- function(data, clusters) {
    .Call(`_RcppMLPACK_kMeans`, data, clusters)
}

#' Run a lars/lasso/elasticNet regression
#'
#' This function performs a lars, lasso or elastic net regression.
#'
#' @title Run a lars / lasso / elasticNet regression
#' @param matX A matrix of explanatory variables, i.e. regressors
#' @param vecY A vector with the target variable
#' @param lambda1 A doube with l1-norm penalty regularization parameter
#' @param lambda2 A doube with l2-norm penalty regularization parameter
#' @param useCholesky A logical value indicating whether to use the Cholesky
#' @param testX A optional matrix of test values to validate prediction
#' decomposition when solving the linear system, else full Gram matrix is used.
#' @return A list with estimated coefficient, the value of lambda1 after each iteration
#' and the predicted values, either from the training data or, if supplied, the test
#' set.
#' @examples
#' ## LARS demo data set from MLPACK with limited rank
#' data(lars)
#' fit1 <- LARS(matX = lars_dependent_x, vecY = lars_dependent_y, 0.1, 0.1, FALSE)
#' fit2 <- LARS(matX = lars_dependent_x, vecY = lars_dependent_y, 0.1, 0.1, TRUE)
LARS <- function(matX, vecY, lambda1, lambda2, useCholesky = FALSE, testX = NULL) {
    .Call(`_RcppMLPACK_LARS`, matX, vecY, lambda1, lambda2, useCholesky, testX)
}

#' Run a linear regression (with optional ridge regression)
#'
#' This function performs a linear regression, and serves as a simple
#' test case for accessing an MLPACK function.
#'
#' @title Run a linear regression with optional ridge regression
#' @param matX A matrix of explanatory variables ('predictors') in standard
#' R format (i.e. \sQuote{tall and skinny'} to be transposed internally to MLPACK
#' format (i.e. `\sQuote{short and wide}).
#' @param vecY A vector of dependent variables ('responses')
#' @param lambda An optional ridge parameter, defaults to zero
#' @param intercept An optional boolean switch about an intercept, default is true.
#' @return A vector with fitted values
#' @examples
#' suppressMessages(library(utils))
#' data("trees", package="datasets")
#' X <- with(trees, cbind(log(Girth), log(Height)))
#' y <- with(trees, log(Volume))
#' lmfit <- lm(y ~ X)
#' # summary(fitted(lmfit))
#' mlfit <- linearRegression(X, y)
#' # summary(mlfit)
#' all.equal(unname(fitted(lmfit)),  as.vector(mlfit))
linearRegression <- function(matX, vecY, lambda = 0.0, intercept = TRUE) {
    .Call(`_RcppMLPACK_linearRegression`, matX, vecY, lambda, intercept)
}

#' Run a Logistic Regression given training data (and optional test data).
#'
#' This function uses a train set matrix and vector of target labels to run
#' a logistic regression. If an optional test data set is supplied, it will
#' be evaluated given the estimates from the initial test set.
#'
#' @title Run a Logistic Regression
#' @param train A matrix of training data values
#' @param labels An integer vector of target (class) labels, with the same
#'  length as the training data set
#' @param test An optional test set, with the same number of columns as
#'  the test set.
#' @return A list with several components: means of training data means,
#'  variance of training data variances, probanbilities of training data
#'  class probabilities. If a test data set was supplied an estimated
#'  classification vector is also returned.
#' @examples
#' data(trainSet)
#' mat <- t(trainSet[, -5])     ## train data, transpose and removing class labels
#' lab <- trainSet[, 5]         ## class labels for train set
#' logisticRegression(mat, lab)
#' testMat <- t(testSet[, -5])  ## test data
#' logisticRegression(mat, lab, testMat)
logisticRegression <- function(train, labels, test = NULL) {
    .Call(`_RcppMLPACK_logisticRegression`, train, labels, test)
}

#' Run a Naive Bayes Classifier given training data (and optional test data).
#'
#' This function uses a train set matrix and vector of target labels to run
#' a naive Bayes classifier for an externally given nummber of class. If
#' an optional test data set is supplied, it will be evaluated given the
#' estimates from the initial test set.
#'
#' @title Run a Naive Bayes Classifier
#' @param train A matrix of training data values
#' @param labels An integer vector of target (class) labels, with the same 
#'  length as the training data set
#' @param classes An integer with the given number of classes
#' @param test An optional test set, with the same number of columns as
#'  the test set.
#' @return A list with several components: means of training data means,
#'  variance of training data variances, probanbilities of training data
#'  class probabilities. If a test data set was supplied an estimated
#'  classification vector is also returned.
#' @examples
#' data(trainSet)
#' mat <- t(trainSet[, -5])     ## train data, transpose and removing class labels
#' lab <- trainSet[, 5]         ## class labels for train set
#' naiveBayesClassifier(mat, lab, 2L)
#' testMat <- t(testSet[, -5])  ## test data
#' naiveBayesClassifier(mat, lab, 2L, testMat)
naiveBayesClassifier <- function(train, labels, classes, test = NULL) {
    .Call(`_RcppMLPACK_naiveBayesClassifier`, train, labels, classes, test)
}

