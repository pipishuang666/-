library(Rcpp)
#接下来比较两个函数运行时间，时间少的运行速度更快
#首先是r语言函数运行时间
t1 <- proc.time()
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
#在本次测试环境下，输出为[1] "执行时间:  91.4500000000116 秒"

#接着测试使用Rcpp编译的C++函数运行时间
t1 <- proc.time()
cppFunction(code = '
    int fibonacci_c(const int x){
    if(x < 2) return x;
    if(x > 40) return -1;
    //太大x占用过多资源
    return (fibonacci_c(x-1) + fibonacci_c(x-2));
    }
')
print(fibonacci(39))
t2 <- proc.time()
t <- t2 - t1
print(paste('执行时间: ',t[3][[1]],'秒'))
#在本次测试环境下，输出为[1] "执行时间:  90.8500000000058 秒"
#可以看出二者时间有0.6秒的差距
#请问老师这是正常的结果吗，为什么差距这么小，甚至可以说没什么差别。