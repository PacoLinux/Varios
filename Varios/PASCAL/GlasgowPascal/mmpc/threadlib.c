/* threadlib.c library for multi thresded vector pascal */
#include <stdlib.h>
#include <pthread.h>

#include <stdio.h> 

#define MAXT 32
struct mysem{pthread_mutex_t lock; pthread_cond_t cond;int flag;};
struct threadblock{
                        char * savedframepointer;
                        char *  savedcodepointer;
                        int threadnumber;
			pthread_t thread_id;
			int initialised;
                        struct mysem ready;
			struct mysem done  ;
			pthread_attr_t att ;
                        };

struct threadblock t_blocks [MAXT];
void msig(struct mysem *sem) {
  pthread_mutex_lock(&sem->lock);
  sem->flag=1;
  pthread_cond_signal(&sem->cond);
  pthread_mutex_unlock(&sem->lock);
}
void mwait(struct mysem *sem) {
  pthread_mutex_lock(&sem->lock);
  if(sem->flag ==0 )
  pthread_cond_wait(&sem->cond,&sem->lock);
  sem->flag=0;
  pthread_mutex_unlock(&sem->lock);
}
void minit(struct mysem *sem)
{ sem->flag=0;
  pthread_mutex_init(&sem->lock,NULL);
  pthread_cond_init(&sem->cond,NULL);
}
int t_go_on=1;
char threads_uninitialised = 1;
void taskloop(struct threadblock *mine );
void initialise_thread(int i){
/* set up both semaphores to wait condition */
		minit ( & (t_blocks[i].ready));
		minit ( & (t_blocks[i].done));
		pthread_attr_init(& (t_blocks[i].att));
		if( pthread_create(& (t_blocks[i].thread_id),NULL,( void *(*)(void *))taskloop,(void *)&t_blocks[i])){};
		t_blocks[i].initialised = 1;
}
void initialise_all_threads()
{
	int i;
 
	for (i=0;i<MAXT;i++)
	{
		t_blocks[i].threadnumber=i;
		t_blocks[i].initialised =0;
               
	}
	threads_uninitialised = 0;
}
void taskexecute(struct threadblock *mine );
void taskloop(struct threadblock *mine )
{
   pthread_attr_setscope(& mine -> att , PTHREAD_SCOPE_SYSTEM);
    while( t_go_on)
    {
          mwait( &( mine -> ready ) );
	  pthread_yield();
          taskexecute(mine);
          msig( &( mine -> done ) );
     }
}

void wait_on_done(int i){ mwait( & (t_blocks[i].done));}
void thread_exceeded_error(){perror( " Exiting : too many threads requested ");exit(1);}

void post_job(char * job, char * frame_pointer, int servernumber)
/* put a pascal job on the  input buffer of the specified server
   the job is the address of a pascal parameterless procedure */
{
    if( servernumber >= MAXT) thread_exceeded_error();
    struct threadblock * mine = & t_blocks[ servernumber ];
    if(threads_uninitialised ) initialise_all_threads();
    if(mine -> initialised == 0)initialise_thread(servernumber); 
    mine -> savedframepointer =   frame_pointer;
    mine -> savedcodepointer  =   job;
    msig( & (mine -> ready) );

}
