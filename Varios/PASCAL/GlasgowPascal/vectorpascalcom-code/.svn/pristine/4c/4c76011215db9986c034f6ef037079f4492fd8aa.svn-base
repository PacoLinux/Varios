/************************************************************
* Program:		VM (SPE) interpater	without using pthread	*
* Purpose:		To estimate the cost of data transfers		*
*				and other activities that associated with	*
*				operation using VM routine					* 
*															*
* Written by:	Youssef Gdura								*
* Date:			06/2009										*
* Insititue:	Glagsow University							*
************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include </opt/cell/sdk/usr/include/libsync.h>
#include <spu_intrinsics.h>
#include <spu_mfcio.h>
#include <massv.h>
#include "sys/time.h"
#include <time.h>
#include "Param.h"
#include <simdmath.h>

char VSM_REG[NO_REG][SIZE] __attribute__((aligned(128)));
char ctmp[SIZE+128] __attribute__((aligned(128)));  
char tmpBuffer[128] __attribute__((aligned(128)));  
char Lbuffer[128] __attribute__((aligned(128)));  

uint32 srcReg, destReg, opcode, newStart;
#define UNROLL_BY_8(X) {X}{X}{X}{X}{X}{X}{X}{X}
unsigned int mem_ea __attribute__((aligned(128)));;
unsigned int al;
spesids  IDs __attribute__((aligned(128)));//=(spesids *)&argp;
unsigned int s=0,e=0;
unsigned int t=0,op;
uint32 msg[2] __attribute__((aligned(128)));
int main(uint64 spe_id, uint64 argp,uint64 envp)
{
	while(1)
	{
//		printf("\n SPE waiting");
		opcode=0;
		// The "spu_readch()" function is a blocking operation, 
		// and so the SPE will wait till it receives a message from the PPE
		msg[0]=spu_readch(SPU_RdInMbox);
		opcode=(msg[0]>>24);		
		destReg=((msg[0]<<24)>>24);
		if ( opcode < 8 )		// For load & Store and Replicate which takes value instead of memory adddress
			mem_ea=spu_readch(SPU_RdInMbox);
		else
			srcReg=((msg[0]<<16)>>24);
		switch(opcode)	
		{
	
			case LOAD:
				{
					unsigned int al=mem_ea%128;
					if ( al > 0 )
					{
						// Read additional 128 bytes if data is unaligned					
						mfc_get(ctmp,mem_ea-al, SIZE+128,destReg,0,0); 
						mfc_write_tag_mask(1<<destReg);
						mfc_read_tag_status_all(); 
						void *newStart=(void *)((uint32)ctmp + al);
						memmove((void *) VSM_REG[destReg],newStart, SIZE);
					}
					else
					{
						mfc_get(VSM_REG[destReg],mem_ea, SIZE,destReg,0,0); 
						mfc_write_tag_mask(1<<destReg);
						mfc_read_tag_status_all(); 
					}
					spu_sync();
					break;
				}
			case STORE:
				{
					uint32 al=mem_ea%128;
					if ( al > 0 )
					{
						
						uint32 EA_start,LS_start;
						// Get first 128 bytes using Automic DMA
						uint32 status;
						do 
						{	
							EA_start=(uint32)(mem_ea-al);						
							LS_start=(uint32)&VSM_REG[destReg][0];
							mfc_getllar((void *)tmpBuffer,EA_start,0,0); 
							(void)spu_readch(MFC_RdAtomicStat);     
							memmove((void *)((uint32)tmpBuffer+al),(void *)LS_start, 128-al);
							mfc_putllc((void *)tmpBuffer,EA_start,0,0); 
							status = mfc_read_atomic_status() & MFC_PUTLLC_STATUS;
						} while (status); // loop till the atomic operation succeeds
						// transfer the midle part of VSM register
						EA_start=EA_start+128;
						LS_start=LS_start+128-al;
						mfc_put((void *)LS_start,EA_start,SIZE-128,destReg,0,0); 
						mfc_write_tag_mask(1<<destReg);
						mfc_read_tag_status_all(); 
						// Get last 128 bytes using Automic DMA
						do
						{
							EA_start=EA_start+SIZE-al;
							LS_start=LS_start+SIZE-al;
							mfc_getllar((void *)tmpBuffer,EA_start,0,0); 
							(void)spu_readch(MFC_RdAtomicStat);
							memmove((void *)tmpBuffer,(void *)LS_start, al);
							mfc_putllc((void *)tmpBuffer,EA_start,0,0); 
							status = mfc_read_atomic_status() & MFC_PUTLLC_STATUS;
						}while (status); // loop till the atomic operation succeeds
					}
					else
					{
						mfc_put(VSM_REG[destReg],mem_ea,SIZE,destReg,0,0); 
						mfc_write_tag_mask(1<<destReg);
						mfc_read_tag_status_all(); 
					}
					spu_sync();
					do{}while(!spu_readchcnt(SPU_WrOutMbox));
					spu_writech(SPU_WrOutMbox,12);	//Acknowlege
					break;
				}
			case ADDF: 
				{
					// ADD OPERATION (FLOAT)
					vector float *aptr=(vector float *)VSM_REG[destReg];
					vector float *bptr=(vector float *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(float);
					int i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_add( aptr[j] , bptr[j]);
					spu_sync();
					break;

				}
			case MULF: 
				{
					// ADD OPERATION (FLOAT)
					vector float *aptr=(vector float *)VSM_REG[destReg];
					vector float *bptr=(vector float *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(float);
					int i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_mul( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_mul( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_mul( aptr[i] , bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_mul( aptr[j] , bptr[j]);
					spu_sync();
					break;
				}
			case REPF: 
				{
					// mem_ea here is exception because to holds the value to be replicated
					vector float *aptr=(vector float *)VSM_REG[destReg];
					float *bptr=(float *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(float),i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_splats(*bptr);
					spu_sync();
					break;

				}
			case ADDI: 
				{
					// ADD OPERATION (INTEGER)
					vector signed int *aptr=(vector signed int *)VSM_REG[destReg];
					vector signed int *bptr=(vector signed int *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(int),i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_add( aptr[j] , bptr[j]);
					spu_sync();
					break;
				}
			case REPI: 
				{
					// mem_ea here is exception because to holds the value to be replicated
					vector signed int *aptr=(vector signed int *)VSM_REG[destReg];
					signed int *bptr=(signed int *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(signed int),i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
						UNROLL_BY_8 (aptr[i]=spu_splats(*bptr);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_splats(*bptr);
					spu_sync();
					break;
				}
			case ADDB: 
				{
					// ADD OPERATION (FLOAT)
					vector signed short *aptr=(vector signed short *)VSM_REG[destReg];
					vector signed short *bptr=(vector signed short *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(short);
					int i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_add( aptr[i] , bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_add( aptr[j] , bptr[j]);
					spu_sync();
					break;
				}
			case SUBB: 
				{
					// ADD OPERATION (INTEGER)
					vector signed short *aptr=(vector signed short *)VSM_REG[destReg];
					vector signed short *bptr=(vector signed short *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(short),i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=spu_sub( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_sub( aptr[i] , bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=spu_sub( aptr[i] , bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=spu_add( aptr[j] , bptr[j]);
					spu_sync();
					break;
				}
			case SQRTF: 
				{
					// ADD OPERATION (FLOAT)
					vector float *aptr=(vector float *)VSM_REG[destReg];
					vector float *bptr=(vector float *)VSM_REG[srcReg];
					int nv=BUFFER/sizeof(float);
					int i=0;
					for (int j=0; j < nv/24 ; j++)
					{
						UNROLL_BY_8 (aptr[i]=sqrtf4(bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=sqrtf4(bptr[i]);i++;);
						UNROLL_BY_8 (aptr[i]=sqrtf4(bptr[i]);i++;);
					}
					for (int j=(nv/24)*24; j < nv ; j++)
						aptr[j]=sqrtf4(bptr[j]);
					spu_sync();	
					break;
				}
			case 99:
				{
					spu_writech(SPU_WrOutMbox,9289);	//Acknowlege
					return 0;
					break;
				}

			default:{}
		}
		//__syncc();
	}
	return 0;
}
