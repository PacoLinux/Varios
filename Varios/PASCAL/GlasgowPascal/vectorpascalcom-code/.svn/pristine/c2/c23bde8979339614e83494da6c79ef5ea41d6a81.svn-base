
unit clvecmat(RT);
{
   clvecmat.pas
   
   Copyright 2021 Paul Cockshott <wpc@wpc-HP-Z620-Workstation>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}
interface
uses CL,pvecs(RT){,pmats(RT)} ;
(*! This is a unit to provide matrix and vector operations that 
will be executed on a GPU.

It introduces two new types cl_vec and cl_mat that are surrogates for
 the vectors and matrices on the gpu.
 The surrogates contain information about the sizes of the vectors or
 matrices. 
 The basic arithmetic operations are supported, and all operations are
performed on the GPU.


 If a,b are cl_vecs then a+b creates a new vector on the gpu. 

GPU HEAP MANAGEMENT


 This gives rise to possible storage leak problems. An assignment like 
  x:=(a+b)*c will  create a temporary array for (a+b) which no named
  variable exists. In the absence of a gpu garbage collector this will 
  cause a buildup of temporary data structures in gpu memory.
  
   The technique provided to avoid this is based on the mark and
   release calls originally supplied in Turbo Pascal. 
     
 
 Two new prodcedures CL_MARK and CL_RELEASE are provided to manage
 allocation of gpu store.
  
 A call of CL_MARK(marker) initialises marker to record a starting
 point for gpu store allocation. A subsequent call CL_RELEASE(marker)
 frees up all store reserved by cl_vecs or cl_mats created since the
 call to CL_MARK.
 
 ASSIGNMENT
 
 a:=b where a,b are both cl_vec assigns the pascal variable a the GPU surrogate in variable b
 it does not copy between the arrays on the GPU heap.
 
COPYING BETWEEN GPU AND CPU
 
 a:=b where a:cl_vec, b:cl_vec copies the contents of the vector
 b on the CPU heap to the GPU memory space, creates a surrogate for this
 and stores the surrogate in the Pascal variable a.

 Conversely, b:=a  where a:cl_vec, b:cl_vec will create a vector
 on the CPU heap, copy the contents of the GPU vector into it and then
 assign a pointer to that heap vector to b.
 
 SUBRANGES
 
 A subrange of a cl_vec can be constructed using the
  clv_subrange function and a subrange of a matrix can be
  constructed using the clm_subrange function. The resulting
  surrogates refer to a subrange withing the original cl_vec or 
  cl_mat.
 
 
 
*)
type 
    gpuVectorSurrogate = record 
    len:integer;
    case is_scalar:boolean of
	false:(gpudatabuffer:cl_mem;
	 offset: integer;);
	true:(scalar:RT;);
	end;
	cl_vec=^gpuVectorSurrogate;
	gpuMatrixSurrogate = record
	gpudatabuffer:cl_mem;
	row, cols, offset,rowstride:integer;
	end;
	cl_mat=^gpuMatrixSurrogate;
	(*! the following are needed to ensure that the algebra of the basic operations 
	 is consistent *)
	var additiveIdentitycl_vec,multiplicativeIdentitycl_vec:cl_vec;
(*!
 First we give specifications of the functions that operate on cl_vecs *)
 function cl2pvector(cl:cl_vec):pvector;
 function cl_newvector(  len:integer):cl_vec;{new vector  of specified length}
 function cl_vecadd(a,b:cl_vec):cl_vec;
 function cl_vecsub(a,b:cl_vec):cl_vec;
 function cl_vecmult(a,b:cl_vec):cl_vec;
 function cl_vecdiv(a,b:cl_vec):cl_vec;
 function scalar2cl_vec(a:RT):cl_vec;
 function vector2cl( v:pvector):cl_vec;
 procedure cleanupgpu;
 procedure setupgpu;
{ function cl_vecprod(a,b:cl_vec):RT;}
 (*! Next we specify the operations that work on cl_vecs.
 
 For this we must specify the symbol of the operator, the function that
 will perform it, and the identity element of the operator 
 
 		symbol		function		identity element  *)
 
 	
 operator +     =   cl_vecadd,        additiveIdentitycl_vec;
 operator -     =   cl_vecsub,        additiveIdentitycl_vec;
 operator *		=	cl_vecmult,		 multiplicativeIdentitycl_vec;
 operator /    =    cl_vecdiv,       multiplicativeIdentitycl_vec; 
{ operator .    =    cl_vecprod;}
 operator cast = 	vector2cl ;
 operator cast = cl2pvector;
	
	
implementation
type kernel=(vnegate,vrecip,
					svadd,vsadd,vadd,vsmult,svmult,vmult,
                     svdiv,vsdiv,vdiv ,svsub,vssub,vsub     );
      bytevector(n:integer)=array[1..n] of byte;
	  pbytevector=^bytevector;
const knames:array[kernel] of string[12]=('vnegate','vrecip',
											'svadd','vsadd','vadd','vsmult','svmult','vmult',
                                            'svdiv','vsdiv','vdiv','svsub','vssub','vsub' );
     firstkernel=vnegate;
     lastkernel=vsub;
     
var  
    kernels:array[kernel] of cl_kernel;
     progbuf:pbytevector;
	platforms:cl_platform_id_array ;
	device_list:cl_device_id_array;
	num_platforms,num_devices:cl_uint;
	cl_status:cl_int;
	context:cl_context;
	command_queue:cl_command_queue;
	 
	prog:cl_program;
	
procedure check;{checks for any openCL errors}
begin
	if cl_status <0 then
	begin
		write('OpenCL error ' );
		case cl_status of
			CL_DEVICE_NOT_FOUND:writeln('CL_DEVICE_NOT_FOUND');
			CL_DEVICE_NOT_AVAILABLE:writeln('CL_DEVICE_NOT_AVAILABLE');
			CL_COMPILER_NOT_AVAILABLE:writeln('CL_COMPILER_NOT_AVAILABLE');
			CL_MEM_OBJECT_ALLOCATION_FAILURE:writeln('CL_MEM_OBJECT_ALLOCATION_FAILURE');
			CL_OUT_OF_RESOURCES:writeln('CL_OUT_OF_RESOURCES');
			CL_OUT_OF_HOST_MEMORY:writeln('CL_OUT_OF_HOST_MEMORY');
			CL_PROFILING_INFO_NOT_AVAILABLE:writeln('CL_PROFILING_INFO_NOT_AVAILABLE');
			CL_MEM_COPY_OVERLAP:writeln('CL_MEM_COPY_OVERLAP');
			CL_IMAGE_FORMAT_MISMATCH:writeln('CL_IMAGE_FORMAT_MISMATCH');
			CL_IMAGE_FORMAT_NOT_SUPPORTED:writeln('CL_IMAGE_FORMAT_NOT_SUPPORTED');
			CL_BUILD_PROGRAM_FAILURE:writeln('CL_BUILD_PROGRAM_FAILURE');
			CL_MAP_FAILURE:writeln('CL_MAP_FAILURE');
			CL_MISALIGNED_SUB_BUFFER_OFFSET:writeln('CL_MISALIGNED_SUB_BUFFER_OFFSET');
			CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST:writeln('CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST');
			CL_COMPILE_PROGRAM_FAILURE:writeln('CL_COMPILE_PROGRAM_FAILURE');
			CL_LINKER_NOT_AVAILABLE:writeln('CL_LINKER_NOT_AVAILABLE');
			CL_LINK_PROGRAM_FAILURE:writeln('CL_LINK_PROGRAM_FAILURE');
			CL_DEVICE_PARTITION_FAILED:writeln('CL_DEVICE_PARTITION_FAILED');
			CL_KERNEL_ARG_INFO_NOT_AVAILABLE:writeln('CL_KERNEL_ARG_INFO_NOT_AVAILABLE');
			CL_INVALID_VALUE:writeln('CL_INVALID_VALUE');
			CL_INVALID_DEVICE_TYPE:writeln('CL_INVALID_DEVICE_TYPE');
			CL_INVALID_PLATFORM:writeln('CL_INVALID_PLATFORM');
			CL_INVALID_DEVICE:writeln('CL_INVALID_DEVICE');
			CL_INVALID_CONTEXT:writeln('CL_INVALID_CONTEXT');
			CL_INVALID_QUEUE_PROPERTIES:writeln('CL_INVALID_QUEUE_PROPERTIES');
			CL_INVALID_COMMAND_QUEUE:writeln('CL_INVALID_COMMAND_QUEUE');
			CL_INVALID_HOST_PTR:writeln('CL_INVALID_HOST_PTR');
			CL_INVALID_MEM_OBJECT:writeln('CL_INVALID_MEM_OBJECT');
			CL_INVALID_IMAGE_FORMAT_DESCRIPTOR:writeln('CL_INVALID_IMAGE_FORMAT_DESCRIPTOR');
			CL_INVALID_IMAGE_SIZE:writeln('CL_INVALID_IMAGE_SIZE');
			CL_INVALID_SAMPLER:writeln('CL_INVALID_SAMPLER');
			CL_INVALID_BINARY:writeln('CL_INVALID_BINARY');
			CL_INVALID_BUILD_OPTIONS:writeln('CL_INVALID_BUILD_OPTIONS');
			CL_INVALID_PROGRAM:writeln('CL_INVALID_PROGRAM');
			CL_INVALID_PROGRAM_EXECUTABLE:writeln('CL_INVALID_PROGRAM_EXECUTABLE');
			CL_INVALID_KERNEL_NAME:writeln('CL_INVALID_KERNEL_NAME');
			CL_INVALID_KERNEL_DEFINITION:writeln('CL_INVALID_KERNEL_DEFINITION');
			CL_INVALID_KERNEL:writeln('CL_INVALID_KERNEL');
			CL_INVALID_ARG_INDEX:writeln('CL_INVALID_ARG_INDEX');
			CL_INVALID_ARG_VALUE:writeln('CL_INVALID_ARG_VALUE');
			CL_INVALID_ARG_SIZE:writeln('CL_INVALID_ARG_SIZE');
			CL_INVALID_KERNEL_ARGS:writeln('CL_INVALID_KERNEL_ARGS');
			CL_INVALID_WORK_DIMENSION:writeln('CL_INVALID_WORK_DIMENSION');
			CL_INVALID_WORK_GROUP_SIZE:writeln('CL_INVALID_WORK_GROUP_SIZE');
			CL_INVALID_WORK_ITEM_SIZE:writeln('CL_INVALID_WORK_ITEM_SIZE');
			CL_INVALID_GLOBAL_OFFSET:writeln('CL_INVALID_GLOBAL_OFFSET');
			CL_INVALID_EVENT_WAIT_LIST:writeln('CL_INVALID_EVENT_WAIT_LIST');
			CL_INVALID_EVENT:writeln('CL_INVALID_EVENT');
			CL_INVALID_OPERATION:writeln('CL_INVALID_OPERATION');
			CL_INVALID_GL_OBJECT:writeln('CL_INVALID_GL_OBJECT');
			CL_INVALID_BUFFER_SIZE:writeln('CL_INVALID_BUFFER_SIZE');
			CL_INVALID_MIP_LEVEL:writeln('CL_INVALID_MIP_LEVEL');
			CL_INVALID_GLOBAL_WORK_SIZE:writeln('CL_INVALID_GLOBAL_WORK_SIZE');
			CL_INVALID_PROPERTY:writeln('CL_INVALID_PROPERTY');
			CL_INVALID_IMAGE_DESCRIPTOR:writeln('CL_INVALID_IMAGE_DESCRIPTOR');
			CL_INVALID_COMPILER_OPTIONS:writeln('CL_INVALID_COMPILER_OPTIONS');
			CL_INVALID_LINKER_OPTIONS:writeln('CL_INVALID_LINKER_OPTIONS');
			CL_INVALID_DEVICE_PARTITION_COUNT:writeln('CL_INVALID_DEVICE_PARTITION_COUNT');
			CL_INVALID_PIPE_SIZE:writeln('CL_INVALID_PIPE_SIZE');
			CL_INVALID_DEVICE_QUEUE:writeln('CL_INVALID_DEVICE_QUEUE');
			CL_INVALID_SPEC_ID:writeln('CL_INVALID_SPEC_ID');
			CL_MAX_SIZE_RESTRICTION_EXCEEDED:writeln('CL_MAX_SIZE_RESTRICTION_EXCEEDED');

		end;
		halt(cl_status);
	end;
end;
Procedure reporterr(Var p1:char;p2:pointer;p3:size_t; p4:pointer);
begin
end;
procedure notify(theProgram : cl_program ;user_data:pointer);
begin{ dummy notification }
writeln('notify called ');
end;
	
procedure cleanupgpu;
var 	 k:kernel;
begin
 { release all opencl resources }
  for k:=firstkernel to lastkernel do
   begin    
      cl_Status := clReleaseKernel(kernels[k]);
      check;
     
    end;
      writeln('released kernels');
      
   prog := clReleaseProgram(prog);
    dispose(progbuf);
  writeln('released program');
  cl_Status := clReleaseCommandQueue(command_queue);check;
  writeln('released queue');
  cl_Status := clReleaseContext(context);check;
  writeln('released context');
end;
procedure setupgpu;

var	  	asciibuffer:array[1..50] of ascii;
	 k:kernel;
	
	 function readfiletobuf(filename:textline):pbytevector;
	 var f:file of byte;
	  len,lenread,res:integer;
	  buf:pbytevector;	 
	 begin
		assign(f,filename);
		reset(f); 
		res:=ioresult;
		if res <>0 then
		begin
			writeln('open opencl file ',filename,' failed with ioresult ',res);
			halt(res);
		end;
		len:=filesize(f); 
		new(buf,len); 
		blockread ( f, buf^[1],len, lenread);
		res:=ioresult;
		if res <>0 then
		begin
			writeln('read opencl file ',filename,' failed with ioresult ',res);
			halt(res);
		end;
		close(f);
		readfiletobuf:=buf;
	 end;
     function createprogram(context:cl_context;filename:textline; var buf:pbytevector):cl_program;
	 var  
	     bufstart:^byte;
	     len:int64;
	 begin
	  buf:=readfiletobuf(filename);
	  writeln('read in ',filename);
	  len:=buf^.n;
	  bufstart:=@buf^[1];
	 { Create a program from the kernel source}
      createprogram := clCreateProgramWithSource(context, 1,bufstart, len, cl_Status);check;       
    end;
    const clprog ='vecmat.cl';
begin    
 
  cl_Status :=clGetPlatformIDs(cl_maxplatform, @platforms, num_platforms); check; 
 
   (*Get the devices list and choose the device you want to run on*) 
  cl_Status := clGetDeviceIDs(   platforms[1],  CL_DEVICE_TYPE_GPU,   1, @device_list, num_devices); check;
 
    {Create one OpenCL context  } 
  context:=clCreateContext( NIL, num_devices, device_list[1],  reporterr,NIL, cl_Status);  check;
 
  { Create a command queue}
    command_queue:=clCreateCommandQueueWithProperties(context, device_list[1], NIL, cl_Status); check;
    prog:=createprogram(context,clprog,progbuf); 
   
//    cl_Status := clBuildProgram(prog , 1, device_list[1], NIL, NIL, NIL);   check;{}
    
    
  //   prog:=createprogram(context,'saxpy.cl');
  

  {Build the program}
  cl_Status := clBuildProgram(prog , 1, device_list[1], NIL, notify, NIL);
  
  check;
    for k:=firstkernel to lastkernel do
   begin 
     
      unicodestring2ascii(knames[k],asciibuffer[1]);
      kernels[k] := clCreateKernel(prog,asciibuffer[1] , cl_Status);
      if(cl_Status<>0) then writeln(  'Unable to find or to link to kernel "',knames[k],'" in the file ',clprog);
      check;
    end;{}
  
    writeln('gpu initialised');
end;


 function scalar2cl_vec(a:RT):cl_vec;
 var p:cl_vec;
 begin
    new(p);
	with p^ do begin
	is_scalar:=true;
	scalar:=a;
	scalar2cl_vec:=p
	end
 end;
 function createbuffer(leninbytes:integer):cl_mem;
 begin 
	createbuffer:=clCreateBuffer(context, CL_MEM_READ_WRITE ,  leninbytes, NIL, cl_Status);check;
 end;
 function cl_newvector(  len:integer):cl_vec;
 var p:cl_vec;
 begin
	new(p );
	p^.is_scalar := false;
	p^.len :=len;
	with P^ do  
	  begin
	p^.gpudatabuffer := createbuffer(len * sizeof(RT));
	p^.offset:=0;
	end;
	cl_newvector:=p
 end;
  function vector2cl(  v:pvector):cl_vec;
  var t:cl_vec; p:pointer;
  begin
	t:=cl_newvector(v^.cols);
	p:=@v^[1];
	 
	cl_status:=clEnqueueWriteBuffer ( command_queue ,
		t^.gpudatabuffer,
	    CL_TRUE, // blocking_write : cl_bool ;
		t^.offset,
		v^.cols*sizeof(RT) ,
		p,
		0,nil,nil);
	 check;
	 vector2cl:=t;
	 end;
function cl2pvector(cl:cl_vec):pvector;
	  var t:pvector;  l:integer;p:pointer;
	   
begin
    
    t:=newvector( cl^.len);
    l:=cl^.len*sizeof(RT) ;
    p:=@t^[1];
    cl_status:=clEnqueueReadBuffer ( command_queue ,
		cl^.gpudatabuffer,
	    CL_TRUE, // blocking_read : cl_bool ;
		cl^.offset,
		l,
		p,
		 0,nil,nil);
		 
	 check;
	 writeln('cl_status ',cl_status);
	 cl2pvector:=t;
end;
 function longestnew(var a,b:gpuVectorSurrogate):cl_vec;
 (*! return new vector the size of the longest of a or b *)
 begin
	longestnew:=cl_newvector( a.len max b.len);
 end;	
 function shortestnew(var a,b:gpuVectorSurrogate):cl_vec;
 (*! return new vector the size of the shortest of a or b *)
 begin
	shortestnew:=cl_newvector( a.len min b.len);
 end;
 function clone(var v:gpuVectorSurrogate):cl_vec;
 var p:cl_vec;
 begin
	p:=cl_newvector(v.len);
	cl_status:=clEnqueueCopyBuffer ( command_queue , v.gpudatabuffer,p^.gpudatabuffer, 0,0,v.len*sizeof(RT),0,nil,nil);
 check;
    clone:=p
 end;
 {kernel launch procedures}
 procedure unarykernel(k:kernel; dest,src:cl_mem; len:integer);
 var 	kernel_status:cl_event;global_size,local_size:size_t ;
 begin
  cl_Status := clSetKernelArg(kernels[k ], 0, sizeof(cl_mem),  dest);check;
  cl_Status := clSetKernelArg(kernels[k ], 1, sizeof(cl_mem),  src);check;
   cl_Status := clSetKernelArg(kernels[k ], 3, sizeof(integer),  len);check;
  global_size := 64; { Process the entire lists}
  local_size := 64;            
  cl_Status := clEnqueueNDRangeKernel(command_queue, kernels[k ], 1, NIL, global_size, local_size, 0, NIL,kernel_status);check;
  cl_status:=clWaitForEvents(     1,    Kernel_status);check;
 end;
 procedure binarysvkernel(k:kernel;dest:cl_mem;a:RT;b:cl_mem;len:integer);
 var 	kernel_status:cl_event;global_size,local_size:size_t ;
 begin
  cl_Status := clSetKernelArg(kernels[k ], 0, sizeof(cl_mem),  dest);check;
  cl_Status := clSetKernelArg(kernels[k ], 1, sizeof(RT),  a);check;
  cl_Status := clSetKernelArg(kernels[k ], 2, sizeof(cl_mem),  b);check;
   cl_Status := clSetKernelArg(kernels[k ], 3, sizeof(integer),  len);check;
  global_size := 64; { Process the entire lists}
  local_size := 64;            
  cl_Status := clEnqueueNDRangeKernel(command_queue, kernels[k ], 1, NIL, global_size, local_size, 0, NIL,kernel_status);check;
  cl_status:=clWaitForEvents(     1,    Kernel_status);check;
 end;
 procedure binaryvskernel(k:kernel;dest,a:cl_mem; b:RT;len:integer);
 var 	kernel_status:cl_event;global_size,local_size:size_t ;
 begin
  cl_Status := clSetKernelArg(kernels[k ], 0, sizeof(cl_mem),  dest);check;
  cl_Status := clSetKernelArg(kernels[k ], 1, sizeof(cl_mem),  a);check;
  cl_Status := clSetKernelArg(kernels[k ], 2, sizeof(RT),  b);check;
   cl_Status := clSetKernelArg(kernels[k ], 3, sizeof(integer),  len);check;
  global_size := 64; { Process the entire lists}
  local_size := 64;            
  cl_Status := clEnqueueNDRangeKernel(command_queue, kernels[k ], 1, NIL, global_size, local_size, 0, NIL,kernel_status);check;
  cl_status:=clWaitForEvents(     1,    Kernel_status);check;
 end;
 procedure binaryvkernel(k:kernel;dest,a,b:cl_mem;  len:integer);
 var 	kernel_status:cl_event;global_size,local_size:size_t ;
 begin
  cl_Status := clSetKernelArg(kernels[k ], 0, sizeof(cl_mem),  dest);check;
  cl_Status := clSetKernelArg(kernels[k ], 1, sizeof(cl_mem),  a);check;
  cl_Status := clSetKernelArg(kernels[k ], 2, sizeof(cl_mem),  b);check;
  cl_Status := clSetKernelArg(kernels[k ], 3, sizeof(integer),  len);check;
  global_size := 512; { Process the entire lists}   
  local_size := 64;              
  cl_Status := clEnqueueNDRangeKernel(command_queue, kernels[k ], 1, NIL, global_size, local_size, 0, NIL,kernel_status);check;
  cl_status:=clWaitForEvents(     1,    Kernel_status);check;
 end;
 function negate(var v:gpuVectorSurrogate):cl_vec;
 var p:cl_vec;
 begin
	p:=cl_newvector(v.len);
	unarykernel(vnegate ,p^.gpudatabuffer,v.gpudatabuffer,v.len);
    negate:=p
 end;
 function recip(var v:cl_vec):cl_vec;
 var p:cl_vec;
 begin
	p:=cl_newvector(v^.len);
	unarykernel(vrecip ,p^.gpudatabuffer,v.gpudatabuffer,v.len);
    recip:=p
 end;
 function genbinary(k:kernel;var a,b:gpuVectorSurrogate):cl_vec;
 var p:cl_vec;
 begin
        if a.is_scalar or b.is_scalar then p:=longestnew(a,b)
        else p:=shortestnew(a,b);
	    
	    if a.is_scalar then
	    binarysvkernel(k,p^.gpudatabuffer,a.scalar,b.gpudatabuffer,b.len)
	    else if(b.is_scalar)then
	    binaryvskernel(succ(k),p^.gpudatabuffer,a.gpudatabuffer,b.scalar,a.len)
	    else     binaryvkernel(succ(succ(k)),p^.gpudatabuffer,a.gpudatabuffer, b.gpudatabuffer,p.len);
	    genbinary:=p
 end;
 function vecadd(var a,b:gpuVectorSurrogate):cl_vec;
 begin
	    vecadd:=genbinary(svadd,a,b);
 end;
 
 
 function vecmult(var a,b:gpuVectorSurrogate):cl_vec;
  begin	 
	    vecmult:=genbinary(svmult,a,b);
 end;
 function vecdiv(var a,b:gpuVectorSurrogate):cl_vec;
  begin	     
	    vecdiv:=genbinary(svdiv,a,b);
 end;
 function vecsub(var a,b:gpuVectorSurrogate):cl_vec;
   begin
	    vecsub:= genbinary(svsub,a,b);
 end;
 function cl_vecadd(a,b:cl_vec):cl_vec;
 begin
    if a=additiveIdentitycl_vec then cl_vecadd:=clone(b^)
    else if b=additiveIdentitycl_vec then cl_vecadd:=clone(a^)
    else cl_vecadd:=vecadd(a^,b^)
 end;
 function cl_vecmult(a,b:cl_vec):cl_vec;
 begin
    if a=multiplicativeIdentitycl_vec then cl_vecmult:=clone(b^)
    else if b=multiplicativeIdentitycl_vec then cl_vecmult:=clone(a^)
    else cl_vecmult:=vecmult(a^,b^)
 end;
 function cl_vecdiv(a,b:cl_vec):cl_vec;
 begin
    if a=multiplicativeIdentitycl_vec then cl_vecdiv:=clone(b^)
    else if b=multiplicativeIdentitycl_vec then cl_vecdiv:=recip(a)
    else cl_vecdiv:=vecdiv(a^,b^)
 end;
function cl_vecsub(a,b:cl_vec):cl_vec;
 begin
    if a=additiveIdentitycl_vec then cl_vecsub:=negate(b^)
    else if b=additiveIdentitycl_vec then cl_vecsub:=clone(a^)
    else 
    cl_vecsub:=vecsub(a^,b^)
 end;	(*
function cl_vecprod(  a,b:cl_vec):RT;
 begin
	cl_vecprod:= \+ (a^ * b^);
 end;
*)
begin
 
setupGPU;
end.
