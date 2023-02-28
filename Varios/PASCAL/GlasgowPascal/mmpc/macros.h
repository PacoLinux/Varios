/* Macros.h  macros used in the C code generator*/
#ifndef ilcgmacros
#define ilcgmacros 1
#define add(a,b) (a+b)
#define sub(a,b) (a-b)
#define and(a,b) (a & b)
#define or(a,b) (a | b)
#define xor(a,b) (a ^ b)
#define mul(a,b) (a*b)
#define div(a,b) (a/b)
#define mod(a,b) (a%b)
#define lt(a,b) (a<b)
#define gt(a,b) (a>b)
#define eq(a,b) (a==b)
#define ng(a,b) (a<=b)
#define le(a,b) (a<=b)
#define nl(a,b) (a>=b)
#define ge(a,b) (a>=b)
#define ne(a,b) (a!=b)
#define shiftleft(a,b) (a<<b)
#define shiftright(a,b) (a>>b)
typedef unsigned short UINT16;
typedef unsigned char BYTE;
int r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
float F0,F1,F2,F3;
double D0,D1,D2,D3;
#endif
