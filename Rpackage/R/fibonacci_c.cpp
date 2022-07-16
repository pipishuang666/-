#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

int fibonacci_c(const int x){
  if(x < 2) return x;
  if(x > 40) return -1;
  //太大x占用过多资源
  return (fibonacci_c(x-1) + fibonacci_c(x-2));
}


