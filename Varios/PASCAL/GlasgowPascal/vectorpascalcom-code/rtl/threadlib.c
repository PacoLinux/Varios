/* threadlib.c library for multi thresded vector pascal */

#define _GNU_SOURCE
#include <stdlib.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <unistd.h>
#define MAXT 256
struct mysem {
    pthread_mutex_t lock;
    pthread_cond_t cond;
    int flag;
};
struct threadblock {
    char * savedframepointer;
    char *  savedcodepointer;
    int threadnumber;
    pthread_t thread_id;
    int initialised,busy,ok;
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
{   sem->flag=0;
    pthread_mutex_init(&sem->lock,NULL);
    pthread_cond_init(&sem->cond,NULL);
}
int t_go_on=1;
char threads_uninitialised = 1;
void taskloop(struct threadblock *mine );
void initialise_thread(int i) {
   
    pthread_t thread;
 
    thread = pthread_self();

    /* Set affinity mask to include CPUs i */

#ifdef AFFINITY
 cpu_set_t cpuset;   int NUM_PROCS = sysconf(_SC_NPROCESSORS_CONF);
    CPU_ZERO(&cpuset);

    CPU_SET(i% NUM_PROCS, &cpuset);
    int s = pthread_setaffinity_np(thread, sizeof(cpu_set_t), &cpuset);
#endif
    /* set up both semaphores to wait condition */
    minit ( & (t_blocks[i].ready));
    minit ( & (t_blocks[i].done));
    pthread_attr_init(& (t_blocks[i].att));

    if( pthread_create(& (t_blocks[i].thread_id),NULL,( void *(*)(void *))taskloop,(void *)&t_blocks[i])) {};

    t_blocks[i].initialised = 1;
}
void initialise_all_threads()
{
    int i;

    for (i=0; i<MAXT; i++)
    {
        t_blocks[i].threadnumber=i;
        t_blocks[i].initialised =0;
        t_blocks[i].busy=0;
        t_blocks[i].ok=0;/* used for busy waits */
    }
    threads_uninitialised = 0;
}
void taskexecute(struct threadblock *mine );
#ifdef CCG
/* OTHERWISE THIS IS IN AN ASSEMBLY LIBRARY */
void taskexecute(struct threadblock *mine ){
	void (*fnp)(char *fp, int n);
	fnp = mine->savedcodepointer;
	(*fnp)(mine ->savedframepointer,mine->threadnumber);
}

#endif
void taskloop(struct threadblock *mine )
{
    pthread_attr_setscope(& mine -> att , PTHREAD_SCOPE_SYSTEM);
    while( t_go_on)
    {
#ifndef BUSYWAIT
        mwait( &( mine -> ready ) );
#ifndef PTW32

        pthread_yield();
#endif
#ifdef PTW32
/* the pthread for windows 32 lacks the thread_yield call */
		sched_yield();
#endif
#endif
#ifdef BUSYWAIT
        while(mine->busy==0) {
            if(t_go_on) {} else return;
        }
#endif
        //  printf("thread %d executing\n",mine->threadnumber);
        taskexecute(mine);
        //  printf("thread %d finished\n",mine->threadnumber);
        mine -> busy =0;
#ifndef BUSYWAIT
        msig( &( mine -> done ) );
#endif
#ifdef BUSYWAIT
        mine ->ok =11;
#endif
    }
}

void wait_on_done(int i) {
//  printf("wait_on_done(%d)\n",i);
#ifndef BUSYWAIT
    mwait( & (t_blocks[i].done));
#endif
#ifdef BUSYWAIT
    while(t_blocks[i].ok==0) {};
    t_blocks[i].ok=0;
#endif
}
void thread_exceeded_error() {
    perror( " Exiting : too many threads requested ");
    exit(1);
}

void post_job(char * job, char * frame_pointer, int servernumber)
/* put a pascal job on the  input buffer of the specified server
   the job is the address of a pascal parameterless procedure */
{
//   printf("post_job(%d)\n",servernumber);
    if( servernumber >= MAXT) thread_exceeded_error();
    struct threadblock * mine = & t_blocks[ servernumber ];
    if(threads_uninitialised ) initialise_all_threads();
    if(mine -> initialised == 0)initialise_thread(servernumber);
    if(mine -> busy == 0) {
        mine -> savedframepointer =   frame_pointer;
        mine -> savedcodepointer  =   job;

        mine -> busy=1;
#ifndef BUSYWAIT
        msig( & (mine -> ready) );
#endif
    }
    else {
        /* recursive call case must not attempt to pass task to processor must call in situ */
//	printf("local version of job %d \n",servernumber);
        struct threadblock local;
        local . savedframepointer = frame_pointer;
        local . savedcodepointer = job ;
        taskexecute ( & local );
    }

}
