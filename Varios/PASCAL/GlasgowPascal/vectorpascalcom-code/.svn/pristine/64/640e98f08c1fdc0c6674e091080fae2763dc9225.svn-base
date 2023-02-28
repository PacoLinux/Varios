/* 
   calculate the Mandelbrot Set and write to file
*/

#include<stdio.h>
#include<assert.h>
#include<stdlib.h>

typedef struct complex{
  double real;
  double imag;
} Complex;

int cal_pixel(Complex c){
  int count, max_iter;
  Complex z;
  double temp, lengthsq;
  
  max_iter = 256;
  z.real = 0;
  z.imag = 0;
  count = 0;

  do{
    temp = z.real * z.real - z.imag * z.imag + c.real;
    z.imag = 2 * z.real * z.imag + c.imag;
    z.real = temp;
    lengthsq = z.real * z.real + z.imag * z.imag;
    count++;
  }
  while ((lengthsq < 4.0) && (count < max_iter));
  return(count);
}

#define NX 2048
#define NY 2048
 int data[NX][NY];
int main(int argc, char **argv){
  FILE *file;
  int i, j;
  Complex c;
  int tmp;
 


  for (i = 0; i < NX; ++i){
    c.real = i/((double) NX) * 2. - 1.5 ; 
    for (j = 0; j < NY; ++j){
      c.imag = j/((double) NY) * 2. - 1. ; 
      tmp = cal_pixel(c);
      data[i][j] = tmp;
    }
  }

  file = fopen("mandelbrot.bin_0000", "w");
  fwrite(data, NX*NY, sizeof(int), file);
  fclose(file);
}
