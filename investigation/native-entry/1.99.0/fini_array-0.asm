
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027aa40 <.text>:
  27aab0: f3 0f 1e fa                  	endbr64
  27aab4: 80 3d 25 78 87 00 00         	cmpb	$0x0, 0x877825(%rip)    # 0xaf22e0
  27aabb: 75 2b                        	jne	0x27aae8 <.text+0xa8>
  27aabd: 55                           	pushq	%rbp
  27aabe: 48 83 3d 8a 44 87 00 00      	cmpq	$0x0, 0x87448a(%rip)    # 0xaeef50
  27aac6: 48 89 e5                     	movq	%rsp, %rbp
  27aac9: 74 0c                        	je	0x27aad7 <.text+0x97>
  27aacb: 48 8d 3d ae bf 83 00         	leaq	0x83bfae(%rip), %rdi    # 0xab6a80
  27aad2: e8 89 ab 83 00               	callq	0xab5660 <__cxa_finalize@plt>
  27aad7: e8 64 ff ff ff               	callq	0x27aa40 <.text>
  27aadc: c6 05 fd 77 87 00 01         	movb	$0x1, 0x8777fd(%rip)    # 0xaf22e0
  27aae3: 5d                           	popq	%rbp
  27aae4: c3                           	retq
  27aae5: 0f 1f 00                     	nopl	(%rax)
  27aae8: c3                           	retq
  27aae9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27aaf0: f3 0f 1e fa                  	endbr64
  27aaf4: e9 77 ff ff ff               	jmp	0x27aa70 <.text+0x30>
  27aaf9: cc                           	int3
  27aafa: cc                           	int3
  27aafb: cc                           	int3
  27aafc: cc                           	int3
  27aafd: cc                           	int3
  27aafe: cc                           	int3
  27aaff: cc                           	int3

000000000027ab00 <PyInit__native>:
  27ab00: 48 8d 3d 91 64 87 00         	leaq	0x876491(%rip), %rdi    # 0xaf0f98
  27ab07: ff 25 4b 44 87 00            	jmpq	*0x87444b(%rip)         # 0xaeef58
  27ab0d: cc                           	int3
  27ab0e: cc                           	int3
  27ab0f: cc                           	int3
  27ab10: 55                           	pushq	%rbp
  27ab11: 41 57                        	pushq	%r15
  27ab13: 41 56                        	pushq	%r14
  27ab15: 41 55                        	pushq	%r13
  27ab17: 41 54                        	pushq	%r12
  27ab19: 53                           	pushq	%rbx
  27ab1a: 48 81 ec 98 00 00 00         	subq	$0x98, %rsp
  27ab21: 89 f5                        	movl	%esi, %ebp
  27ab23: 49 89 fc                     	movq	%rdi, %r12
  27ab26: 0f b7 1f                     	movzwl	(%rdi), %ebx
  27ab29: 48 8b 47 08                  	movq	0x8(%rdi), %rax
  27ab2d: 48 89 04 24                  	movq	%rax, (%rsp)
  27ab31: 4c 8b 7f 10                  	movq	0x10(%rdi), %r15
  27ab35: 4c 8b 77 18                  	movq	0x18(%rdi), %r14
  27ab39: 4c 8b 6f 20                  	movq	0x20(%rdi), %r13
  27ab3d: bf 02 00 00 00               	movl	$0x2, %edi
  27ab42: ff 15 18 44 87 00            	callq	*0x874418(%rip)         # 0xaeef60
  27ab48: 48 85 c0                     	testq	%rax, %rax
  27ab4b: 0f 84 92 00 00 00            	je	0x27abe3 <PyInit__native+0xe3>
  27ab51: 40 88 28                     	movb	%bpl, (%rax)
  27ab54: 66 89 5c 24 60               	movw	%bx, 0x60(%rsp)
  27ab59: 41 8b 4c 24 02               	movl	0x2(%r12), %ecx
  27ab5e: 89 4c 24 62                  	movl	%ecx, 0x62(%rsp)
  27ab62: 41 0f b7 4c 24 06            	movzwl	0x6(%r12), %ecx
  27ab68: 66 89 4c 24 66               	movw	%cx, 0x66(%rsp)
  27ab6d: 48 8b 0c 24                  	movq	(%rsp), %rcx
  27ab71: 48 89 4c 24 68               	movq	%rcx, 0x68(%rsp)
  27ab76: 4c 89 7c 24 70               	movq	%r15, 0x70(%rsp)
  27ab7b: 4c 89 74 24 78               	movq	%r14, 0x78(%rsp)
  27ab80: 4c 89 ac 24 80 00 00 00      	movq	%r13, 0x80(%rsp)
  27ab88: 48 89 84 24 88 00 00 00      	movq	%rax, 0x88(%rsp)
  27ab90: 48 8d 05 01 ea 83 00         	leaq	0x83ea01(%rip), %rax    # 0xab9598
  27ab97: 48 89 84 24 90 00 00 00      	movq	%rax, 0x90(%rsp)
  27ab9f: 48 c7 44 24 08 ff ff ff ff   	movq	$-0x1, 0x8(%rsp)
  27aba8: bf 90 00 00 00               	movl	$0x90, %edi
  27abad: ff 15 ad 43 87 00            	callq	*0x8743ad(%rip)         # 0xaeef60
  27abb3: 48 85 c0                     	testq	%rax, %rax
  27abb6: 74 42                        	je	0x27abfa <PyInit__native+0xfa>
  27abb8: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  27abbd: ba 90 00 00 00               	movl	$0x90, %edx
  27abc2: 48 89 c7                     	movq	%rax, %rdi
  27abc5: 48 89 c3                     	movq	%rax, %rbx
  27abc8: ff 15 9a 43 87 00            	callq	*0x87439a(%rip)         # 0xaeef68
  27abce: 48 89 d8                     	movq	%rbx, %rax
  27abd1: 48 81 c4 98 00 00 00         	addq	$0x98, %rsp
  27abd8: 5b                           	popq	%rbx
  27abd9: 41 5c                        	popq	%r12
  27abdb: 41 5d                        	popq	%r13
  27abdd: 41 5e                        	popq	%r14
  27abdf: 41 5f                        	popq	%r15
  27abe1: 5d                           	popq	%rbp
  27abe2: c3                           	retq
  27abe3: 89 dd                        	movl	%ebx, %ebp
  27abe5: 48 8b 1c 24                  	movq	(%rsp), %rbx
  27abe9: bf 01 00 00 00               	movl	$0x1, %edi
  27abee: be 02 00 00 00               	movl	$0x2, %esi
  27abf3: e8 4a 0d 0c 00               	callq	0x33b942 <PyInit__native+0xc0e42>
  27abf8: eb 0f                        	jmp	0x27ac09 <PyInit__native+0x109>
  27abfa: bf 08 00 00 00               	movl	$0x8, %edi
  27abff: be 90 00 00 00               	movl	$0x90, %esi
  27ac04: e8 39 0d 0c 00               	callq	0x33b942 <PyInit__native+0xc0e42>
  27ac09: 0f 0b                        	ud2
  27ac0b: 49 89 c4                     	movq	%rax, %r12
  27ac0e: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  27ac13: e8 58 12 43 00               	callq	0x6abe70 <PyInit_pyo3_async_runtimes+0x12810>
  27ac18: eb 25                        	jmp	0x27ac3f <PyInit__native+0x13f>
  27ac1a: e8 8d fb 2d 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  27ac1f: 49 89 c4                     	movq	%rax, %r12
  27ac22: 66 83 fd 03                  	cmpw	$0x3, %bp
  27ac26: 0f 95 c0                     	setne	%al
  27ac29: 48 85 db                     	testq	%rbx, %rbx
  27ac2c: 0f 94 c1                     	sete	%cl
  27ac2f: 08 c1                        	orb	%al, %cl
  27ac31: 75 0c                        	jne	0x27ac3f <PyInit__native+0x13f>
  27ac33: 4c 89 ef                     	movq	%r13, %rdi
  27ac36: 4c 89 fe                     	movq	%r15, %rsi
  27ac39: 4c 89 f2                     	movq	%r14, %rdx
  27ac3c: ff 53 20                     	callq	*0x20(%rbx)
  27ac3f: 4c 89 e7                     	movq	%r12, %rdi
  27ac42: e8 49 aa 83 00               	callq	0xab5690 <_Unwind_Resume@plt>
  27ac47: e8 60 fb 2d 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  27ac4c: cc                           	int3
  27ac4d: cc                           	int3
  27ac4e: cc                           	int3
  27ac4f: cc                           	int3
  27ac50: 41 56                        	pushq	%r14
  27ac52: 53                           	pushq	%rbx
  27ac53: 50                           	pushq	%rax
  27ac54: 48 85 f6                     	testq	%rsi, %rsi
  27ac57: 74 15                        	je	0x27ac6e <PyInit__native+0x16e>
  27ac59: 48 89 77 08                  	movq	%rsi, 0x8(%rdi)
  27ac5d: 48 89 57 10                  	movq	%rdx, 0x10(%rdi)
  27ac61: 66 c7 07 ff ff               	movw	$0xffff, (%rdi)         # imm = 0xFFFF
  27ac66: 48 83 c4 08                  	addq	$0x8, %rsp
  27ac6a: 5b                           	popq	%rbx
  27ac6b: 41 5e                        	popq	%r14
  27ac6d: c3                           	retq
  27ac6e: 49 89 fe                     	movq	%rdi, %r14
  27ac71: bf 8b 00 00 00               	movl	$0x8b, %edi
  27ac76: ff 15 e4 42 87 00            	callq	*0x8742e4(%rip)         # 0xaeef60
  27ac7c: 48 85 c0                     	testq	%rax, %rax
  27ac7f: 74 69                        	je	0x27acea <PyInit__native+0x1ea>
  27ac81: 48 89 c3                     	movq	%rax, %rbx
  27ac84: 48 8d 35 36 d0 e9 ff         	leaq	-0x162fca(%rip), %rsi   # 0x117cc1
  27ac8b: ba 8b 00 00 00               	movl	$0x8b, %edx
  27ac90: 48 89 c7                     	movq	%rax, %rdi
  27ac93: ff 15 cf 42 87 00            	callq	*0x8742cf(%rip)         # 0xaeef68
  27ac99: bf 18 00 00 00               	movl	$0x18, %edi
  27ac9e: ff 15 bc 42 87 00            	callq	*0x8742bc(%rip)         # 0xaeef60
  27aca4: 48 85 c0                     	testq	%rax, %rax
  27aca7: 74 30                        	je	0x27acd9 <PyInit__native+0x1d9>
  27aca9: 48 c7 00 8b 00 00 00         	movq	$0x8b, (%rax)
