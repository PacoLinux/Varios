program cltest;
uses cl;
const VECTOR_SIZE= 128;alpha:real=2.0;
type myvec=array[1..VECTOR_SIZE] of real;
     pmv=^myvec;
     Procedure reporterr(Var p1:char;p2:pointer;p3:size_t; p4:pointer);
	begin
	end;
	procedure notify(theProgram : cl_program ;user_data:pointer);
	begin{ dummy notification }
	end;
procedure test;
var A,B,C:pmv;
	platforms:cl_platform_id_array ;
	device_list:cl_device_id_array;
	num_platforms,num_devices:cl_uint;
	cl_status:cl_int;
	context:cl_context;
	command_queue:cl_command_queue;
	A_clmem,B_clmem,C_clmem:cl_mem;
	prog:cl_program;
	 kernel: cl_kernel;
	 global_size,local_size:size_t ;
	asciibuffer:array[1..50] of ascii;
	kernel_status:cl_event;
	i:integer;
	procedure init;
	begin
		new(A);new(B);new(C);
		 A^ := iota[0];
		 B^ := Vector_size - iota[0];
		 C^ :=0;
	 end;
      type bytevector(n:integer)=array[1..n] of byte;
	  pbytevector=^bytevector;
	 function readfiletobuf(filename:textline):pbytevector;
	 var f:file of byte;
	  len,lenread:integer;
	  buf:pbytevector;
	 
	 begin
		assign(f,filename);
		reset(f); 
		len:=filesize(f); 
		new(buf,len); 
		blockread ( f, buf^[1],len, lenread);
		close(f);
		readfiletobuf:=buf;
	 end;
	 function createprogram(context:cl_context;filename:textline):cl_program;
	 var buf:pbytevector;
	     bufstart:^byte;
	     len:int64;
	 begin
	  buf:=readfiletobuf(filename);
	  len:=buf^.n;
	  bufstart:=@buf^[1];
	 { Create a program from the kernel source}
      createprogram := clCreateProgramWithSource(context, 1,bufstart, len, cl_Status);
      if cl_status <>0 then
        writeln('error creating program ',cl_status);
    end;


begin
 init;
 
 cl_Status :=clGetPlatformIDs(cl_maxplatform, @platforms, num_platforms);
 
   (*Get the devices list and choose the device you want to run on*)
 
  cl_Status := clGetDeviceIDs(   platforms[1],  CL_DEVICE_TYPE_GPU,   1, @device_list, num_devices);
  // Create one OpenCL context for each device in the platform
 
  context:=clCreateContext( NIL, num_devices, device_list[1],  reporterr,NIL, cl_Status);
 writeln('after create context',cl_status);
  // Create a command queue
   command_queue:=clCreateCommandQueueWithProperties(context, device_list[1], NIL, cl_Status);
 
  // Create memory buffers on the device for each vector
  A_clmem:=clCreateBuffer(context, CL_MEM_READ_ONLY+CL_MEM_USE_HOST_PTR,  VECTOR_SIZE * sizeof(real), A, cl_Status);
   
  B_clmem:=clCreateBuffer(context, CL_MEM_READ_ONLY+CL_MEM_USE_HOST_PTR,VECTOR_SIZE * sizeof(real), B, cl_Status);
  C_clmem:=clCreateBuffer(context, CL_MEM_WRITE_ONLY+CL_MEM_USE_HOST_PTR ,VECTOR_SIZE * sizeof(real), C, cl_Status);
  prog:=createprogram(context,'saxpy.cl');
  

  {Build the program}
  cl_Status := clBuildProgram(prog , 1, device_list[1], NIL, notify, NIL);
  writeln(cl_status);
{
   Create the OpenCL kernel}
   unicodestring2ascii('saxpy_kernel',asciibuffer[1]);
   kernel := clCreateKernel(prog,asciibuffer[1] , cl_Status);
   writeln(' after create kernel',cl_status);
{
  // Set the arguments of the kernel}
  cl_Status := clSetKernelArg(kernel, 0, sizeof(real),  alpha);
  cl_Status := clSetKernelArg(kernel, 1, sizeof(cl_mem),  A_clmem);
  cl_Status := clSetKernelArg(kernel, 2, sizeof(cl_mem),  B_clmem);
  cl_Status := clSetKernelArg(kernel, 3, sizeof(cl_mem),  C_clmem);
 writeln(' after setting args',cl_status);
 
  {Execute the OpenCL kernel on the list}
    global_size := VECTOR_SIZE; { Process the entire lists}
  local_size := 64;            
  cl_Status := clEnqueueNDRangeKernel(command_queue, kernel, 1, NIL, global_size, local_size, 0, NIL,kernel_status);
  writeln(' launched kernel',cl_status);
 cl_status:=clWaitForEvents(     1,    Kernel_status);
{
    Read the cl memory C_clmem on device to the host variable C}
    writeln('Read the cl memory C_clmem on device to the host variable C');
  cl_Status := clEnqueueReadBuffer(command_queue, C_clmem, CL_TRUE, 0, VECTOR_SIZE * sizeof(real), C, 0,NIL,NIL);

  { Clean up and wait for all the comands to complete.}
  cl_Status := clFlush(command_queue);
  cl_Status := clFinish(command_queue);

  { Display the result to the screen}
  for i := 1 to  VECTOR_SIZE do
    writeln( alpha,' * ', A^[i], ' + ', B^[i],' := ', C^[i]);
 {Finally release all OpenCL allocated objects and host buffers.}
  cl_Status := clReleaseKernel(kernel);
  prog := clReleaseProgram(prog);
  cl_Status := clReleaseMemObject(A_clmem);
  cl_Status := clReleaseMemObject(B_clmem);
  cl_Status := clReleaseMemObject(C_clmem);
  cl_Status := clReleaseCommandQueue(command_queue);
  cl_Status := clReleaseContext(context);
  dispose(A);
  dispose(B);
  dispose(C);
  
end;
begin 
test; 
end.
