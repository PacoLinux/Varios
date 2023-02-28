# Based on OpteronCGtaskexecute.s
# need to make it Pentium/gas compliant
.globl taskexecute
.globl _taskexecute
_taskexecute:
taskexecute: 
# on entry we have a pointer in %esp to the task block
# this task block has the C definition
#struct threadblock{
#                       char * savedframepointer;
#                       char *  savedcodepointer;int threadnumber;}
# the first thing we do is save the framepointer on entry
	push %ebp
# next get the frame pointer from the task block
	mov 8(%esp) , %eax
        mov 0(%eax),  %ebp
	
 
# get the task number 
	push 8(%eax)
# make the call
	call * 4(%eax)
# unwind stack pointer
	add $4,%esp
# restore fp
	pop %ebp
	ret
.globl getframepointer
getframepointer: mov %ebp,%eax
	ret
