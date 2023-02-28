/*
Kernels for the Nvidia back end
of the Glasgow Vector Pascal compiler

Scott McCorkell - 2014
*/

//replicate function
template<typename T>
__global__ void rep(T* v1, const T val)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = val;
}



//vector - vector
template<typename T>
__global__ void addvv(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] + v2[i];
}


template<typename T>
__global__ void subvv(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] - v2[i];
}


template<typename T>
__global__ void mulvv(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] * v2[i];
}


template<typename T>
__global__ void divvv(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] / v2[i];
}





// bitwise operations (v-v)

template<typename T>
__global__ void andbw(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] & v2[i];
}



template<typename T>
__global__ void orbw(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] | v2[i];
}


template<typename T>
__global__ void xorbw(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] ^ v2[i];
}


template<typename T>
__global__ void notbw(T* v1)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = ~v1[i];
}





// trig operations

template<typename T>
__global__ void gpusin(T* v1)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = sinf(v1[i]);
}


template<typename T>
__global__ void gpucos(T* v1)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = cosf(v1[i]);
}


template<typename T>
__global__ void gputan(T* v1)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = tanf(v1[i]);
}




//special ops
//multiply accumulate
template<typename T>
__global__ void mulacc(T* v1, T* v2, T* v3)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] + (v2[i] * v3[i]);

}

//AND - NOT
template<typename T>
__global__ void andnot(T* v1, T* v2)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	v1[i] = v1[i] & (~v2[i]);
}


