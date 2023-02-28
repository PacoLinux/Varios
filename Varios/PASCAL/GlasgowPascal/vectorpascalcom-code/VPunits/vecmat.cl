__kernel void vnegate(
    __global float* output, __global float* input,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = -( input[i]);
}
__kernel void vrecip(
    __global float* output, __global float* input,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = 1/( input[i]);
}

__kernel void svadd(
    __global float* output,
    float input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1  + input2[i];
}

__kernel void vsadd(
    __global float* output,
    __global float* input1,
    float input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i]  + input2 ;
}
__kernel void vadd(
    __global float* output,
    __global float* input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i] + input2[i];
}
 
__kernel void vsmult(
    __global float* output,
    __global float* input1,
    float input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i]  * input2 ;
}
__kernel void svmult(
    __global float* output,
    float input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1  * input2[i];
}

__kernel void vmult(
    __global float* output,
    __global float* input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i] * input2[i];
}
__kernel void svsub(
    __global float* output,
    float input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1  - input2[i];
}

__kernel void vssub(
    __global float* output,
    __global float* input1,
    float input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i]  - input2 ;
}

__kernel void vsub(
    __global float* output,
    __global float* input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i] - input2[i];
}

__kernel void svdiv(
    __global float* output,
    float input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1  / input2[i];
}

__kernel void vsdiv(
    __global float* output,
    __global float* input1,
    float input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i]  / input2 ;
}
__kernel void vdiv(
    __global float* output,
    __global float* input1,
    __global float* input2,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input1[i] / input2[i];
}
__kernel void spesqrt(
    __global float4* output, __global float4* input,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = sqrt( input[i]);
}
__kernel void sperep(
    __global float* output, const float input,
    const unsigned int count)
{
    int i = get_global_id(0);
    if(i < count)
        output[i] = input;
}



