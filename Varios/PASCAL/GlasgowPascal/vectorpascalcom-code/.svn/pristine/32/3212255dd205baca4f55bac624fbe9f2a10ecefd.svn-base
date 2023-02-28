.globl taskexecute
taskexecute: 
# on entry we have a pointer in %rdi to the task block
# this task block has the C definition
#struct threadblock{
#                       char * savedframepointer;
#                       char *  savedcodepointer;int threadnumber;}
# the first thing we do is save the framepointer on entry
	push %rbp
# next get the frame pointer from the task block
	movd 0(%rdi) , %rbp
# get  the task address
	movd 8(%rdi), %rsi
# get the task number 
	movw 16(%rdi),%edi
# make the call
	call %rsi
# restore fp
	pop %rbp
	ret
