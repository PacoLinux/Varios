
section .text  ;0
GLOBAL pcounter; 
pcounter: ; called with pointer to 1024 bit bit vector on stack
          ; return cardinality in set
	mov esi,[esp+4]
	mov ecx, [esp+8]
	mov edx,0
Pcount1:
	popcnt eax,dword [esi]
	add edx,eax
	add esi ,4
	loop Pcount1
	mov eax, edx
	ret
GLOBAL findfirst
findfirst : ; called with pointer to bit vector on stack, then a count
	
	mov esi,[esp+4]
	mov ecx, [esp+8]
	mov edx,0
fcount1:
	bsf eax,dword [esi]
	;cmp eax,0
	jz again
	add eax,edx
	ret
again:
	add esi ,4
	add edx,32
	loop fcount1
	mov eax, edx
	ret
