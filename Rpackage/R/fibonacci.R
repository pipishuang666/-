# 斐波那契数列-r语言
#' Title
#'
#' @param n
#'
#' @return
#' @export
#'
#' @examples
fibonacci <- function(n) {
  if (n==0)
    return (0)
  if (n==1)
    return (1)
  return (fibonacci(n-1) + fibonacci(n-2))
}

# 斐波那契数列-在R中编译c++语言
library(Rcpp)
cppFunction(code = '
    int fibonacci_c(const int x){
    if(x < 2) return x;
    if(x > 40) return -1;
    //太大x占用过多资源
    return (fibonacci_c(x-1) + fibonacci_c(x-2));
    }
')
