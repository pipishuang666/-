#接下来比较两个函数运行时间，时间少的运行速度更快
#首先是r语言函数运行时间
t1 <- proc.time()
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
print(fibonacci(39))
t2 <- proc.time()
t <- t2 - t1
print(paste('执行时间: ',t[3][[1]],'秒'))
#在本次测试环境下，输出为[1] "执行时间:  228.050000000017 秒"

#接着测试使用Rcpp编译的C++函数运行时间
t1 <- proc.time()
library(Rcpp)
cppFunction(code = '
    int fibonacci_c(const int x){
    if(x < 2) return x;
    if(x > 40) return -1;
    //太大x占用过多资源
    return (fibonacci_c(x-1) + fibonacci_c(x-2));
    }
')
print(fibonacci_c(39))
t2 <- proc.time()
t <- t2 - t1
print(paste('执行时间: ',t[3][[1]],'秒'))
#在本次测试环境下，输出为[1] "执行时间:  0.220000000001164 秒"
#可以看出使用Rcpp比使用R语言函数速度快上数百倍。
