	movq %mm0,(%esp)
	xchgl %esi ,(%esp)
	xchg (%esp),%esi
	addsd %xmm1,%xmm2
	pi2fw %mm0,%mm1
	mov %esi,%edi
        shl $3,%edx
        jnc 0f
	movl 5(%esp), %ebp
	movsbl (%esp),%eax
	lea  5(%esp) ,%eax
	imul %bl
	shl %cl,%esi 
	imull  $4,%eax,%edx
	0:movl %esi,%edi
	bound %eax,(%esp)
    	bt %eax,(%edx)
	rep movsl
	faddp %st(1)
        fcomi %st(1)
	fcom %st(1)
	fcmovnb  %st(1)
	fstp %st(1)
