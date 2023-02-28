#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#define CL_TARGET_OPENCL_VERSION 220
#include <CL/cl.h>
//#define VERBOSE
////////////////////////////////////////////////////////////////////////////////

// Use a static data size for simplicity
//
#define REGLEN (256)
#define REGS 8
#define KERNMULT 0
#define KERNADD 1
#define KERNSUB 2
#define KERNDIV 3
#define KERNSQRT 4
#define KERNREP 5
#define KERNS 6
////////////////////////////////////////////////////////////////////////////////

// Simple compute kernel that computes the square of an input array.       [1]
//
const char *KernelSource = "\n" \
                           "__kernel void add(                                                       \n" \
                           "   __global float4* input,                                              \n" \
                           "   __global float4* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] = output[i] + input[i];                               \n" \
                           "}                                                                      \n" \
                           "__kernel void spesqrt(                                                       \n" \
                           "   __global float4* input,                                              \n" \
                           "   __global float4* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] = sqrt( input[i]);                                    \n" \
                           "}                                                                      \n" \
                           "__kernel void sperep(                                                       \n" \
                           "     const float input,                                              \n" \
                           "   __global float* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] =  input;                                             \n" \
                           "}                                                                      \n" \
                           "__kernel void div(                                                       \n" \
                           "   __global float4* input,                                              \n" \
                           "   __global float4* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] = output[i] / input[i];                               \n" \
                           "}                                                                      \n" \
                           "__kernel void sub(                                                       \n" \
                           "   __global float4* input,                                              \n" \
                           "   __global float4* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] = output[i] - input[i];                               \n" \
                           "}                                                                      \n" \
                           "__kernel void mult(                                                  \n" \
                           "   __global float4* input,                                              \n" \
                           "   __global float4* output,                                             \n" \
                           "   const unsigned int count)                                           \n" \
                           "{                                                                      \n" \
                           "   int i = get_global_id(0);                                           \n" \
                           "   if(i < count)                                                       \n" \
                           "       output[i] = output[i] * input[i];                                \n" \
                           "}                                                                      \n" \
                           "\n";

////////////////////////////////////////////////////////////////////////////////
int err;                          // error code returned from api calls


cl_mem reghandles[REGS];          // handles to the registers
unsigned int correct;             // number of correct results returned

size_t global;                    // global domain size for our calculation
size_t local;                     // local domain size for our calculation

cl_device_id device_id;           // device ID
cl_context context;               // context
cl_command_queue queue;           // command queue
cl_program program;               // program
cl_kernel kernels[KERNS];                 // kernel




void initopencl() {

    cl_platform_id plats[3];
    cl_uint num_plats;
    err= clGetPlatformIDs(1,plats,&num_plats);
    if(err!=CL_SUCCESS) {
        fprintf(stderr,"can not get platform ids %d num plats returned %d\n",err,num_plats);//exit(-1);
    }
#ifdef VERBOSE
    fprintf(stderr,"%d platforms\n",num_plats);
#endif
    // Get an ID for the device
    int gpu = 1;

    cl_uint devicecount;
    err = clGetDeviceIDs(plats[0], gpu ? CL_DEVICE_TYPE_GPU : CL_DEVICE_TYPE_CPU,   1,       &device_id, &devicecount);
    if(err != CL_SUCCESS) {
        gpu=0;
        err = clGetDeviceIDs(plats[0], gpu ? CL_DEVICE_TYPE_GPU : CL_DEVICE_TYPE_CPU, 1,       &device_id, &devicecount);
    } else {

    }
#ifdef VERBOSE
    fprintf(stderr,"using device type %d\n" ,gpu);
#endif
    if (err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to get open cl device: %d\n",err);    //
        exit(-1);
    }

    // Create a context
    //
    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
    if (!context)
    {
        fprintf(stderr,"failed to create opencl context ");
        exit(-2);
    }
#ifdef VERBOSE
    fprintf(stderr,"created clContext\n" );
#endif
    // Create a command queue
    //
    queue = clCreateCommandQueueWithProperties(context, device_id, 0, &err);
    if (!queue)
    {
        fprintf(stderr,"failed to create opencl command queue ");
        exit(-3);
    }
#ifdef VERBOSE
    fprintf(stderr,"created cl command q\n" );
#endif
    // Create the compute program from the source buffer
    //
    program = clCreateProgramWithSource(context, 1,
                                        (const char **) & KernelSource, NULL, &err);
    if ( program==NULL)
    {
        fprintf(stderr,"failed to compile the opencl programme ");
        exit(-4);
    }
#ifdef VERBOSE
    fprintf(stderr,"created cl program for kernel \n" );
#endif
    // Build the program executable                                        [7]
    //
    err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
    if (err != CL_SUCCESS)
    {
        size_t len;
        char buffer[2048];

        fprintf(stderr,"Error: Failed to build program executable\n");
        clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG,
                              sizeof(buffer), buffer, &len);
        fprintf(stderr,"%s\n", buffer);
        exit(1);
    }
#ifdef VERBOSE
    fprintf(stderr,"built cl program for kernel \n" );
#endif
    kernels[KERNMULT] = clCreateKernel(program, "mult", &err);
    if (!kernels[KERNMULT] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel multiply");
        exit(-5);
    }
#ifdef VERBOSE
    fprintf(stderr,"creaed kernel mult \n" );
#endif
    kernels[KERNADD] = clCreateKernel(program, "add", &err);
    if (!kernels[KERNADD] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel add");
        exit(-5);
    }
    
#ifdef VERBOSE
    fprintf(stderr,"creaed kernel add \n" );
#endif
    
    kernels[KERNSUB] = clCreateKernel(program, "sub", &err);
    if (!kernels[KERNSUB] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel sub");
        exit(-5);
    }
    

#ifdef VERBOSE
    fprintf(stderr,"creaed kernel sub \n" );
#endif
    kernels[KERNDIV] = clCreateKernel(program, "div", &err);
    if (!kernels[KERNDIV] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel div");
        exit(-5);
    }
    

#ifdef VERBOSE
    fprintf(stderr,"creaed kernel div \n" );
#endif
    kernels[KERNSQRT] = clCreateKernel(program, "spesqrt", &err);
    if (!kernels[KERNSQRT] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel spesqrt");
        exit(-5);
    }
    
#ifdef VERBOSE
    fprintf(stderr,"creaed kernel sqrt \n" );
#endif
    kernels[KERNREP] = clCreateKernel(program, "sperep", &err);
    if (!kernels[KERNREP] || err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to create opencl kernel sperep");
        exit(-5);
    }
#ifdef VERBOSE
    fprintf(stderr,"creaed kernel sperep \n" );
#endif
    // Create the registers of the virtual machine

    int i;
    for(i=0; i<REGS; i++) {
        reghandles[i] = clCreateBuffer(context,  CL_MEM_READ_WRITE,
                                       sizeof(float) *REGLEN,  NULL, NULL);
        if (!reghandles[i])
        {
            fprintf(stderr,"failed to create opencl virtual machine register ");
            exit(-6);
        }
    }
#ifdef VERBOSE
    fprintf(stderr, "completed OpenCl initialisation\n");
#endif
}
void openclCleanUp()
{
    // Shut down and clean up
    //
    int i;
    for(i=0; i<REGS; i++)
        clReleaseMemObject(reghandles[i]);


    clReleaseProgram(program);
    for(i=0; i<KERNS; i++)
        clReleaseKernel(kernels[i]);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);
}
//=======================================================================
// opcodes
void simdldop( float * data,long r2)
{
#ifdef VERBOSE
    fprintf(stderr,"simdldop  \n" );
    int r=r2;
    printf( "to NV%d\n",r);
    fprintf(stderr, "ldop %ld %lx\n",r2,(unsigned long)data);
#endif
    cl_mem input = reghandles[r2];
    // Write our data set into the input array in device memory          [11]
    //
    int err = clEnqueueWriteBuffer(queue, input, CL_TRUE, 0,  sizeof(float) *REGLEN, data, 0, NULL, NULL);
    if (err != CL_SUCCESS)
    {
        fprintf( stderr,"failed to enque opencl write buffer \n");
        exit(-11);
    }


}

void simdstop(float * results,long r1) {
    float buf[REGLEN];
    int i;
#ifdef VERBOSE
    fprintf(stderr,"stop %ld %lx\n",r1,(unsigned long)results);
#endif
    cl_mem output = reghandles[r1];

    clFinish(queue);
#ifdef VERBOSE
    fprintf(stderr," about to enque readbuffer\n");
#endif
    int err = clEnqueueReadBuffer(queue,
                                  output,
                                  CL_TRUE,
                                  0,
                                  sizeof(float) *REGLEN,
                                  results,
                                  0,
                                  NULL,
                                  NULL );

#ifdef VERBOSE
    fprintf(stderr,"   enqued readbuffer\n");
#endif

    if (err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to enque opencl read buffer ");    // Read the results from the device                                  [16]
        exit(-11);
    }


}
void sperep(long r1, float f) {
#ifdef VERBOSE
    fprintf(stderr,"sperep %ld %g \n",r1,f);
#endif
    cl_mem input;
    cl_mem output;

    output = reghandles[r1];
    cl_kernel kernel;
    kernel = kernels[KERNREP];
    err = 0;
    cl_uint count = REGLEN;
    err  = clSetKernelArg(kernel, 0, sizeof(cl_mem), &f);
    err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &output);
    err |= clSetKernelArg(kernel, 2, sizeof(unsigned int), &count);
    if (err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to set opencl arguments ");
        exit(-8);
    }


    global = REGLEN;


    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &global, NULL,0, NULL, NULL);
    if (err)
    {
        fprintf(stderr,"failed to enque  opencl kernel %d",err);
        exit(-10);
    }

}
void genop(long r1, long r2, long operation) {
#ifdef VERVBOSE
    fprintf(stderr,"genop %d %d %d \n",r1,r2,operation);
#endif
    cl_mem input;                     // device memory used for the input array
    cl_mem output;                    // device memory used for the output array
    input = reghandles[r2];
    output = reghandles[r1];
    cl_kernel kernel;
    kernel = kernels[operation];
    err = 0;
    cl_uint count = REGLEN;
    err  = clSetKernelArg(kernel, 0, sizeof(cl_mem), &input);
    err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &output);
    err |= clSetKernelArg(kernel, 2, sizeof(unsigned int), &count);
    if (err != CL_SUCCESS)

    {
        fprintf(stderr,"failed to set opencl arguments ");
        exit(-8);
    }

    // Get the maximum work-group size for executing the kernel on the device
    //
    // err = clGetKernelWorkGroupInfo(kernel, device_id, CL_KERNEL_WORK_GROUP_SIZE,
    //                                                   sizeof(int), &local, NULL);
    //  if (err != CL_SUCCESS)
    //  { fprintf(stderr,"failed to get opencl work group information ");exit(-9); }
    //fprintf(stderr," local group %d \n",local);
    // Execute the kernel
    //
    global = REGLEN/4;
    //  if (local >global) local = global;
    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &global, NULL,
                                 0, NULL, NULL);
    if (err)
    {
        fprintf(stderr,"failed to enque  opencl kernel %d",err);
        exit(-10);
    }

}
void mfop( long r1, float * data,long operation) {
#ifdef VERBOSE
    fprintf(stderr,"mfop %ld  %ld %lx\n",r1,operation,(unsigned long ) data);
#endif
    cl_mem input;                     // device memory used for the input array
    cl_mem output;                    // device memory used for the output array

    output = reghandles[r1];
    cl_kernel kernel;
    kernel = kernels[operation];
    err = 0;
    cl_uint count = REGLEN;
    input=clCreateBuffer(context,  CL_MEM_COPY_HOST_PTR,
                         sizeof(float) *REGLEN,  data,&err);
    if(err != CL_SUCCESS)
    {
        fprintf(stderr,"failed to sllocate input buffer ");
        exit(-8);
    }
    err  = clSetKernelArg(kernel, 0, sizeof(cl_mem), &input);
    err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &output);
    err |= clSetKernelArg(kernel, 2, sizeof(unsigned int), &count);
    if (err != CL_SUCCESS)

    {
        fprintf(stderr,"failed to set opencl arguments ");
        exit(-8);
    }

    // Get the maximum work-group size for executing the kernel on the device
    //
    // err = clGetKernelWorkGroupInfo(kernel, device_id, CL_KERNEL_WORK_GROUP_SIZE,
    //                                                   sizeof(int), &local, NULL);
    //  if (err != CL_SUCCESS)
    //  { fprintf(stderr,"failed to get opencl work group information ");exit(-9); }
    //fprintf(stderr," local group %d \n",local);
    // Execute the kernel
    //
    global = REGLEN/4;
    //  if (local >global) local = global;
    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &global, NULL,
                                 0, NULL, NULL);
    if (err)
    {
        fprintf(stderr,"failed to enque  opencl kernel %d",err);
        exit(-10);
    }
    clReleaseMemObject ( 	input);
}
void spesqrt(int r1) {
    genop(r1,r1,KERNSQRT);
}


