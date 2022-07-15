# 斐波那契数列-r语言
fibonacci <- function(n) {
  if (n==0)
    return (0)
  if (n==1)
    return (1)
  return (fibonacci(n-1) + fibonacci(n-2))
}

#测试n = 12,结果为144，正确
print(fibonacci(12))

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

#测试n = 12，结果为144，正确
print(fibonacci_c(12))
