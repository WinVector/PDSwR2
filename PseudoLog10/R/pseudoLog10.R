
#' Return the pseudo logarithm, base 10.
#'
#' Return the pseudo logarithm (base 10) of x, which is close to
#' sign(x)*log10(abs(x)) for x such that abs(x) is large
#' and doesn't "blow up" near zero.  Useful
#' for transforming wide-range variables that may be negative
#' (like profit/loss).
#'
#' See: \url{http://www.win-vector.com/blog/2012/03/modeling-trick-the-signed-pseudo-logarithm/}
#'
#' NB: This transform has the undesirable property of making most
#' signed distributions appear bi-modal around the origin, no matter
#' what the underlying distribution really looks like.
#' The argument x is assumed be numeric and can be a vector.
#'
#' @param x numeric vector
#' @return pseudo logarithm, base 10 of x
#'
#' @examples
#'
#' pseudoLog10(c(-5, 0, 5))
#' # should be: [1] -0.7153834  0.0000000  0.7153834
#'
#' @export
#'
pseudoLog10 <- function(x) {
  asinh(x / 2) / log(10)
}
