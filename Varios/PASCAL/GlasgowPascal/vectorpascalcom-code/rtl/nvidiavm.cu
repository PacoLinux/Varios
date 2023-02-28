#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <cuda.h>
#include "kernels.h"
//#define VERBOSE
////////////////////////////////////////////////////////////////////////////////

#define THREADS 1024
#define NUMVECS 4
#define BLOCKS 4
#define VECSIZE 4096

////////////////////////////////////////////////////////////////////////////////


void *vecptr[NUMVECS];      // pointers to the registers in host space
void *vecmap[NUMVECS];		// mapped pointers of the registers in GPU address space




/* ************************************
*
* set-up function
*
* Initializes memory spaces for use
**************************************/
extern "C"
void setupNvidia() {

    // Create the registers of the virtual machine
	// 64-bits long to accomodate that size and smaller
    int i;
	int length = sizeof(long long int) * VECSIZE;

	//required for cudaHostAllocMapped
	cudaSetDeviceFlags(cudaDeviceMapHost);

    for(i=0; i<NUMVECS; i++) {

        cudaError_t error = cudaHostAlloc((void**)&vecptr[i], length, cudaHostAllocMapped);
        if (error != cudaSuccess)
        {
            printf("CUDA error in malloc: %s\n", cudaGetErrorString(error));
            exit(-1);
        }

		error = cudaHostGetDevicePointer((void**)&vecmap[i], (void *)vecptr[i], 0);
        if (error != cudaSuccess)
        {
            printf("CUDA error in gpu mapping: %s\n", cudaGetErrorString(error));
            exit(-1);
        }
    }
#ifdef VERBOSE
    fprintf(stderr, "completed nvidia virtual machine initialisation\n");
#endif
}


/**************************************
* Clean-up function
*
* Frees memory and resets the Nvidia device
*
***************************************/
extern "C"
void nvidiaClean()
{
    //clean up
    //
    int i;
    for(i=0; i<NUMVECS; i++)
        cudaFreeHost(vecptr[i]);
}

//================================================
// operation functions
//================================================




/***********************************
* gpuLoad functions
*
* load data into a vitrual register
* onr function for each supported type
*
***********************************/
extern "C"

void gpuLoad(int reg, int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif

    int* input = (int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(int));

}



extern "C"

void gpuLoadu(int reg, unsigned int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    unsigned int* input = (unsigned int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(unsigned int));
}



extern "C"

void gpuLoadfp(int reg, float* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    float* input = (float *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(float));
}



extern "C"

void gpuLoad64(int reg, long long int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    long long int* input = (long long int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(long long int));
}



extern "C"

void gpuLoad64u(int reg, unsigned long long int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    unsigned long long int* input = (unsigned long long int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(unsigned long long int));
}



extern "C"

void gpuLoad64fp(int reg, double* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    double* input = (double *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(double));
}



extern "C"

void gpuLoad16(int reg, short int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    short int* input = (short int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(short int));
}



extern "C"

void gpuLoad16u(int reg, unsigned short int* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)data);
#endif
    unsigned short int* input = (unsigned short int *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(unsigned short int));
}



extern "C"

void gpuLoad8(int reg, signed char* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)source);
#endif
    signed char* input = (signed char *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(signed char));
}



extern "C"

void gpuLoad8u(int reg, unsigned char* source)
{
#ifdef VERBOSE
    fprintf(stderr,"gpuload %d %x\n",reg,(unsigned int)data);
#endif
    unsigned char* input = (unsigned char *)vecptr[reg];

	memcpy(input, source, VECSIZE*sizeof(unsigned char));
}






/****************************************
*
* gpu Store instructions
*
* Store values from a virtual register back to
* regular host memory
* One function for each supported type
*****************************************/
extern "C"

void gpuStore(int reg, int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    int* output = (int *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStoreu(int reg, unsigned int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    unsigned int* output = (unsigned int *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(unsigned int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStorefp(int reg, float* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    float* output = (float *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(float));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore64(int reg, long long int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    long long int* output = (long long int *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(long long int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore64u(int reg, unsigned long long int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    unsigned long long int* output = (unsigned long long int *)vecptr[reg];

	//copy result to host mem

	memcpy(results, output, VECSIZE*sizeof(unsigned long long int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore64fp(int reg, double* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    double* output = (double *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(double));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore16(int reg, short int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    short int* output = (short int *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(short int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore16u(int reg, unsigned short int* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    unsigned short int* output = (unsigned short int *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(unsigned short int));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore8(int reg, signed char* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    signed char* output = (signed char *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(signed char));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



extern "C"

void gpuStore8u(int reg, unsigned char* results) {

#ifdef VERBOSE
    fprintf(stderr,"store %d %x\n",r1,(unsigned int)results);
#endif
    unsigned char* output = (unsigned char *)vecptr[reg];

	memcpy(results, output, VECSIZE*sizeof(unsigned char));

#ifdef VERBOSE
    fprintf(stderr,"  memory copied to host\n");
#endif

}



//==============================================
// kernel launching functions
//==============================================


/***************************************
*
* gpu Replicate functions
*
* Fill a vertual register with a given value
*
* one function for each supported type
****************************************/
extern "C"

void gpuRep(int r1, int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    int *output = (int *)vecmap[r1];

	rep<int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRepu(int r1, unsigned int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    unsigned int *output = (unsigned int *)vecmap[r1];

	rep<unsigned int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRepfp(int r1, float val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    float *output = (float *)vecmap[r1];

	rep<float><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep64(int r1, long long int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    long long int *output = (long long int *)vecmap[r1];

	rep<long long int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep64u(int r1, unsigned long long int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    unsigned long long int *output = (unsigned long long int *)vecmap[r1];

	rep<unsigned long long int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep64fp(int r1, double val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    double *output = (double *)vecmap[r1];

	rep<double><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep16(int r1,  short int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    short int *output = (short int *)vecmap[r1];

	rep<short int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep16u(int r1, unsigned short int val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    unsigned short int *output = (unsigned short int *)vecmap[r1];

	rep<unsigned short int><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep8(int r1, signed char val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    signed char *output = (signed char *)vecmap[r1];

	rep<signed char><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}



extern "C"

void gpuRep8u(int r1, unsigned char val) {
#ifdef VERBOSE
    fprintf(stderr,"fill vector %d %g \n",r1,f);
#endif

    unsigned char *output = (unsigned char *)vecmap[r1];

	rep<unsigned char><<<BLOCKS, THREADS>>>(output, val);

	//wait till kernel done
	cudaThreadSynchronize();
}




/***********************************************
*
* gpu vector-vector operations
*
* Launches appropriate kernel for the passed
* operation number, takes two vectors, result
* placed in the first passed vector
*
* one function for each type
***********************************************/
extern "C"

void gpuVVops(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    int *input = (int *)vecmap[r2];
    int *output = (int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVopsu(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    unsigned int *input = (unsigned int *)vecmap[r2];
    unsigned int *output = (unsigned int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<unsigned int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVopsfp(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    float *input = (float *)vecmap[r2];
    float *output = (float *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<float><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<float><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<float><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<float><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops64(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    long long int *input = (long long int *)vecmap[r2];
    long long int *output = (long long int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops64u(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    unsigned long long int *input = (unsigned long long int *)vecmap[r2];
    unsigned long long int *output = (unsigned long long int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops64fp(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    double *input = (double *)vecmap[r2];
    double *output = (double *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<double><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<double><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<double><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<double><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops16(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    short int *input = (short int *)vecmap[r2];
    short int *output = (short int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops16u(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    unsigned short int *input = (unsigned short int *)vecmap[r2];
    unsigned short int *output = (unsigned short int *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<unsigned short int><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops8(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    signed char *input = (signed char *)vecmap[r2];
    signed char *output = (signed char *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<signed char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}




extern "C"

void gpuVVops8u(int r1, int r2, int operation) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuvvop %d %d %d \n",r1,r2,operation);
#endif

    unsigned char *input = (unsigned char *)vecmap[r2];
    unsigned char *output = (unsigned char *)vecmap[r1];

	//launch correct kernel
	switch(operation)
	{
		case 0:
		{
			addvv<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 1:
		{
			subvv<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 2:
		{
			mulvv<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 3:
		{
			divvv<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 4:
		{
			andbw<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 5:
		{
			orbw<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		case 6:
		{
			xorbw<unsigned char><<<BLOCKS, THREADS>>>(output, input);
			break;
		}
		default:
		{
			fprintf(stderr,"Invalid gpu operation %d \n", operation);
			exit(1);
		}
	}
	//wait till kernel is finished
	cudaThreadSynchronize();
}








/***************************************
*
* gpu Not operation
*
* works on a single vector
* bitwise operation on both signed and unsigned
* one function of each supported type
****************************************/

extern "C"

void gpuNOT(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	int *output = (int *)vecmap[v1];

	notbw<int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOTu(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	unsigned int *output = (unsigned int *)vecmap[v1];

	notbw<unsigned int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT64(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	long long int *output = (long long int *)vecmap[v1];

	notbw<long long int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT64u(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT64 %d \n", v1);
#endif

	unsigned long long int *output = (unsigned long long int *)vecmap[v1];

	notbw<unsigned long long int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT16(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	short int *output = (short int *)vecmap[v1];

	notbw<short int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT16u(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	unsigned short int *output = (unsigned short int *)vecmap[v1];

	notbw<unsigned short int><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT8(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	signed char *output = (signed char *)vecmap[v1];

	notbw<signed char><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuNOT8u(int v1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuNOT %d \n", v1);
#endif

	unsigned char *output = (unsigned char *)vecmap[v1];

	notbw<unsigned char><<<BLOCKS, THREADS>>>(output);

	//wait till kernel is finished
	cudaThreadSynchronize();
}





/****************************************
*
* gpu Trigonomic functions
*
* Takes one single floating point register
* SIN, COS and TAN supported
*****************************************/
extern "C"

void gpuSIN(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuSIN %d \n",r1);
#endif

    float *output = (float *)vecmap[r1];

	gpusin<float><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuSIN64(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuSIN %d \n",r1);
#endif

    double *output = (double *)vecmap[r1];

	gpusin<double><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuCOS(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuCOS %d \n",r1n);
#endif

    float *output = (float *)vecmap[r1];

	gpucos<float><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuCOS64(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuCOS %d \n",r1n);
#endif

    double *output = (double *)vecmap[r1];

	gpucos<double><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuTAN(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuTAN %d \n",r1);
#endif

    float *output = (float *)vecmap[r1];

	gputan<float><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuTAN64(int r1) {

#ifdef VERVBOSE
    fprintf(stderr,"gpuTAN %d \n",r1);
#endif

    double *output = (double *)vecmap[r1];

	gputan<double><<<BLOCKS, THREADS>>>(output);
	
	//wait till kernel is finished
	cudaThreadSynchronize();
}




/*******************************************
*
* gpu Multiply Accumulate operation
*
* takes 3 registers, result in first passed register
* One function for each supported type
********************************************/
extern "C"

void gpuMulAcc(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	int *output = (int *)vecmap[r1];
	int *input1 = (int *)vecmap[r2];
	int *input2 = (int *)vecmap[r3];

	mulacc<int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAccu(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	unsigned int *output = (unsigned int *)vecmap[r1];
	unsigned int *input1 = (unsigned int *)vecmap[r2];
	unsigned int *input2 = (unsigned int *)vecmap[r3];

	mulacc<unsigned int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAccfp(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	float *output = (float *)vecmap[r1];
	float *input1 = (float *)vecmap[r2];
	float *input2 = (float *)vecmap[r3];

	mulacc<float><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc64(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	long long int *output = (long long int *)vecmap[r1];
	long long int *input1 = (long long int *)vecmap[r2];
	long long int *input2 = (long long int *)vecmap[r3];

	mulacc<long long int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc64u(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	unsigned long long int *output = (unsigned long long int *)vecmap[r1];
	unsigned long long int *input1 = (unsigned long long int *)vecmap[r2];
	unsigned long long int *input2 = (unsigned long long int *)vecmap[r3];

	mulacc<unsigned long long int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc64fp(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	double *output = (double *)vecmap[r1];
	double *input1 = (double *)vecmap[r2];
	double *input2 = (double *)vecmap[r3];

	mulacc<double><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc16(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	short int *output = (short int *)vecmap[r1];
	short int *input1 = (short int *)vecmap[r2];
	short int *input2 = (short int *)vecmap[r3];

	mulacc<short int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc16u(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	unsigned short int *output = (unsigned short int *)vecmap[r1];
	unsigned short int *input1 = (unsigned short int *)vecmap[r2];
	unsigned short int *input2 = (unsigned short int *)vecmap[r3];

	mulacc<unsigned short int><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc8(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	signed char *output = (signed char *)vecmap[r1];
	signed char *input1 = (signed char *)vecmap[r2];
	signed char *input2 = (signed char *)vecmap[r3];

	mulacc<signed char><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuMulAcc8u(int r1, int r2, int r3)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuMulAcc %d %d %d \n",r1, r2, r3);
#endif

	unsigned char *output = (unsigned char *)vecmap[r1];
	unsigned char *input1 = (unsigned char *)vecmap[r2];
	unsigned char *input2 = (unsigned char *)vecmap[r3];

	mulacc<unsigned char><<<BLOCKS, THREADS>>>(output, input1, input2);

	//wait till kernel is finished
	cudaThreadSynchronize();
}






/*******************************************
*
* gpu AND-NOT operation
*
* Takes two non-floating point registers
* result in first passed register
* One fucntion for each supported type
*******************************************/
extern "C"

void gpuAndNot(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	int *output = (int *)vecmap[r1];
	int *input = (int *)vecmap[r2];

	andnot<int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNotu(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	unsigned int *output = (unsigned int *)vecmap[r1];
	unsigned int *input = (unsigned int *)vecmap[r2];

	andnot<unsigned int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot64(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	long long int *output = (long long int *)vecmap[r1];
	long long int *input = (long long int *)vecmap[r2];

	andnot<long long int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot64u(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	unsigned long long int *output = (unsigned long long int *)vecmap[r1];
	unsigned long long int *input = (unsigned long long int *)vecmap[r2];

	andnot<unsigned long long int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot16(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	short int *output = (short int *)vecmap[r1];
	short int *input = (short int *)vecmap[r2];

	andnot<short int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot16u(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	unsigned short int *output = (unsigned short int *)vecmap[r1];
	unsigned short int *input = (unsigned short int *)vecmap[r2];

	andnot<unsigned short int><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot8(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	signed char *output = (signed char *)vecmap[r1];
	signed char *input = (signed char *)vecmap[r2];

	andnot<signed char><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



extern "C"

void gpuAndNot8u(int r1, int r2)  {

#ifdef VERVBOSE
    fprintf(stderr,"gpuAndNot %d %d \n",r1, r2);
#endif

	unsigned char *output = (unsigned char *)vecmap[r1];
	unsigned char *input = (unsigned char *)vecmap[r2];

	andnot<unsigned char><<<BLOCKS, THREADS>>>(output, input);

	//wait till kernel is finished
	cudaThreadSynchronize();
}



