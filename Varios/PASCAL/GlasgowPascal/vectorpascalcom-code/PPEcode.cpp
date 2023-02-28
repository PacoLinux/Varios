/************************************************************
* Program:		VM (PPE) interface without using pthread	    *
* Purpose:		To estimate the cost of data transfers		*
*				and other activities that associated with	*
*				operation using VM routine					* 
*															*
* Written by:	Youssef Gdura								*
* Date:			06/2009										*
* Insititue:	Glagsow University							*
************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <libspe2.h>
#include <pthread.h> 
#include <time.h>
#include "sys/time.h"
#include <ppu_intrinsics.h>
#include "Param.h"
#define algn128 __attribute__((aligned(128)));
void *spe_thread_function(void *);
//void speEnd();
void *speInitialize();
void END();
unsigned int pload[3] __attribute__((aligned(128)))={0,0,0};
unsigned int pstore=0;
unsigned int pop=0;
int initilize=0;
struct timeval t1, t2;
double loadt=0, storet=0,opert=0,initt=0,s,e;
struct timeval t;
const uint32 size=(REG_SIZE/MAX_SPU_THREADS)*sizeof(float);
extern spe_program_handle_t speInterpreter;
//unsigned int msgs __attribute__((aligned(128)));
unsigned int msg __attribute__((aligned(128)));
unsigned int msgs[2] __attribute__((aligned(128)));
typedef struct {
   spe_context_ptr_t  speContext;
   
   unsigned int       rSize;
   unsigned int       dSize;
   unsigned int       speID;
 } thread_arg;
//spe_context_ptr_t context[MAX_SPU_THREADS];
pthread_t threads[MAX_SPU_THREADS];
thread_arg T_arg[MAX_SPU_THREADS] __attribute__((aligned(128)));
spesids  IDs __attribute__((aligned(128)));
inline void broadCast2Msg(uint32 mem_EA)
{
	unsigned int st,nw;
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		msgs[1]=mem_EA+i*SIZE; 
		do {
			// Must check the number of Inbound mailbox entries avialable because the
			// PPE won't stall even if the Inbound is full. It overwrites the last message. 	
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st & 0x0000FF00)>>8;
		} while ( nw < 2 );
		//	Send two messages using MMIO registers
		*((volatile unsigned int *)(IDs.p_s_area[i]+SPU_IN_MBOX))=msgs[0];
		*((volatile unsigned int *)(IDs.p_s_area[i]+SPU_IN_MBOX))=msgs[1];
		__lwsync();
	}
}
inline void broadCast1Msg()
{
	unsigned int st,nw;
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		do {
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st & 0x0000FF00)>>8;
		} while ( nw == 0 );
		*((volatile unsigned int *)(IDs.p_s_area[i]+SPU_IN_MBOX))=msgs[0];
	}
}
extern "C"
void   speLoadIntVec(unsigned int reg,unsigned int mem )
{
	msgs[0]=(LOAD<<24)+((reg<<24)>>24);   // Opcode bits(31-24) & RegNo bits(7-0)
	broadCast2Msg(mem);
} 
extern "C"
void  speStoreIntVec(unsigned int reg, unsigned int mem)
{

	msgs[0]=(STORE<<24)+((reg<<24)>>24);   // Opcode bits(31-24) & RegNo bits(7-0)
	broadCast2Msg(mem);
	unsigned int st,nw;
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		do {
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st&0x000000FF);  // Extract the SPU_Out_Mbox_Count
		} while ( nw == 0 );
		unsigned int ss = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_OUT_MBOX));
		if ( ss != 12 )
			printf("\n Store =%d ",ss);
		
	}
}
extern "C"
void speAddIntVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(ADDI<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speRepIntVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(REPI<<24)+((reg1<<24)>>24);
	broadCast2Msg(reg2);
}

extern "C"
void speSubIntVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(SUBI<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void   speLoadVec(unsigned int reg,unsigned int mem )
{
//	printf("\n mem=%d",mem);
//	printf("\n LOad ");
	msgs[0]=(LOAD<<24)+((reg<<24)>>24);   // Opcode bits(31-24) & RegNo bits(7-0)
	broadCast2Msg(mem);
} 
extern "C"
void  speStoreVec(unsigned int reg, unsigned int mem)
{
//	printf("\n Store ");
	msgs[0]=(STORE<<24)+((reg<<24)>>24);   // Opcode bits(31-24) & RegNo bits(7-0)
	unsigned int st,nw;
	broadCast2Msg(mem);
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		do {
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st&0x000000FF);  // Extract the SPU_Out_Mbox_Count
		} while ( nw == 0 );
		unsigned int ss = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_OUT_MBOX));
		if ( ss != 12 )
			printf("\n Store =%d ",ss);
		
	}
}
extern "C"
void speAddVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(ADDF<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speSubVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(SUBF<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speRepVec(unsigned int reg1,float sv)
{ 
	msgs[0]=(REPF<<24)+((reg1<<24)>>24);   // Opcode bits(31-24) & RegNo bits(7-0)
	int *p=(int *) &sv;
	unsigned long long p1=(unsigned long long) p;
	broadCast2Msg((unsigned int) p1);
}

extern "C"
void speMulVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(MULF<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speSQRTFVec(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(SQRTF<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speByteAdd(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(ADDB<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speByteSub(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(SUBB<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speByteMul(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(MULB<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
extern "C"
void speByteDiv(unsigned int reg1,unsigned int reg2)
{ 
	msgs[0]=(DIVB<<24)+((reg2<<24)>>16)+((reg1<<24)>>24);
	broadCast1Msg();
}
void *speInitialize()
{
//	gettimeofday(&t,NULL);
//  double s=t.tv_usec * 1000 + t.tv_sec * 1000000000;
	printf("\n Virtual Reg Size=%d \t No SPEs=%d \t",REG_SIZE,MAX_SPU_THREADS);
	
	if (spe_cpu_info_get(SPE_COUNT_USABLE_SPES, -1) < MAX_SPU_THREADS)
	{ 
		printf("\n Threads avialable aren't enough \n");
		exit(1);
	}
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		T_arg[i].speContext= spe_context_create( SPE_MAP_PS,NULL);
		if (T_arg[i].speContext == NULL){
			printf("context_create error\n");
			exit(1);
		}
		// load executable into the SPE's local store
		if (spe_program_load(T_arg[i].speContext,&speInterpreter)!=0){
			printf("program_load error\n");
			exit(1);
		}
		T_arg[i].speID=i;
	}
	for(int j=0; j<MAX_SPU_THREADS; j++) 
	{
		IDs.sID[j]=(unsigned long long)T_arg[j].speContext;
		IDs.ls_ea[j]=(unsigned long long)spe_ls_area_get(T_arg[j].speContext);//spe_ls_area.get(T_arg[j].speContext);//T_arg[j].speContext;
		IDs.p_s_area[j]=(unsigned long long) spe_ps_area_get(T_arg[j].speContext,SPE_CONTROL_AREA);
		//printf("\n thread %d created",j);
	}
	for(int i=0; i<MAX_SPU_THREADS; i++) 
		if (pthread_create (&threads[i], NULL, &spe_thread_function, &T_arg[i]))  {
			printf("\n\t Error : Failed creating thread\n");
			exit (1);
		}
//	gettimeofday(&t,NULL);
//  double e=t.tv_usec * 1000 + t.tv_sec * 1000000000;
//	initt+=e-s;
	return NULL;
}

extern "C"
void *speEnd()
{
	unsigned int msg __attribute__((aligned(128)));;
	msg=(99<<24)+((0<<24)>>16)+((0<<24)>>24);
	unsigned int st,nw;
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		do {
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st & 0x0000FF00)>>8;
		} while ( nw == 0 );
		*((volatile unsigned int *)(IDs.p_s_area[i]+SPU_IN_MBOX))=msg;
	}
	for(int i=0; i<MAX_SPU_THREADS; i++) 
	{
		do {
			st = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_MBOX_STAT));
			nw = (st&0x000000ff);  // Extract the SPU_Out_Mbox_Count
		} while ( nw == 0 );
		unsigned ss = *((volatile unsigned int *)(IDs.p_s_area[i] + SPU_OUT_MBOX));
	}
	for (int i=0; i<MAX_SPU_THREADS; i++) 
		pthread_join(threads[i], NULL);
	for (int i=0; i<MAX_SPU_THREADS; i++) 
		spe_context_destroy(T_arg[i].speContext);
	pthread_exit(NULL);
	return NULL;
}
void END()
{ 
	

 
}

void *spe_thread_function(void *t_arg) 
{ 
	unsigned int entry;
	entry = SPE_DEFAULT_ENTRY;
	thread_arg *T=(thread_arg *) t_arg;
	if ( spe_context_run(T->speContext, &entry, 0,(void *)&IDs,(void *)&pload, 0) < 0 )
	{
		perror("Spe_context_run - Could run context");
		exit(1);
	}	
	pthread_exit(NULL);
	return NULL;
}

extern "C"
void ThreadsInitial()
{
	//printf("\n ThreadsInitial Before calling SPeInitailize");
	speInitialize();
//	printf("\n ThreadsInitial After calling SPeInitailize");
	
}	
