/* Macros64.h  macros used in the C64 code generator*/
#ifndef ilcgmacros
#include <math.h>
#define ilcgmacros 1
#define ieee32 float
#define ieee64 double 
#define add(a,b) (a+b)
#define satp(a,b) (a+b<127?(a+b< -128?-128:a+b):127)
#define sats(a,b)  (a-b<127?(a-b< -128?-128:a-b):127)
#define satm(a,b) ((a*b)>>7)
#define sub(a,b) ((a)-(b))
#define and(a,b) ((int)(a) & (int)(b))
#define or(a,b) ((int)(a) | (int)(b))
#define xor(a,b) ((int)(a) ^ (int)(b))
#define mul(a,b) ((a)*(b))
#define min(a,b) (a<b?a:b)
#define max(a,b) (a>b?a:b)
#define div(a,b) (a/b)
#define mod(a,b) (a%b)
#define lt(a,b) ((a<b)?-1 :0)
#define gt(a,b) ((a>b)?-1:0)
#define eq(a,b) ((a==b)?-1:0)
#define ng(a,b) ((a<=b)?-1:0)
#define le(a,b) ((a<=b)?-1:0)
#define nl(a,b) ((a>=b)?-1:0)
#define ge(a,b) ( (a>=b)?-1:0)
#define ne(a,b) ((a!=b)?-1:0)
#define shiftleft(a,b) (a<<b)
#define shiftright(a,b) (a>>b) 
typedef int int32;
typedef long long INT64;
typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned short UINT16;
typedef unsigned char BYTE;
typedef signed char INT8;
typedef unsigned char octet;
typedef unsigned short uint16;
INT64 r0,r1,rbp,r3,r4,r5,r6,r7;int r8,r9,r10,r11,r12,r13,r14,r15;
float F0,F1,F2,F3;
double D0,D1,D2,D3;
#endif
