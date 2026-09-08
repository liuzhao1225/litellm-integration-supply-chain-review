
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  691380: 55                           	pushq	%rbp
  691381: 41 57                        	pushq	%r15
  691383: 41 56                        	pushq	%r14
  691385: 41 55                        	pushq	%r13
  691387: 41 54                        	pushq	%r12
  691389: 53                           	pushq	%rbx
  69138a: 48 81 ec 58 01 00 00         	subq	$0x158, %rsp            # imm = 0x158
  691391: 49 89 cc                     	movq	%rcx, %r12
  691394: 48 89 94 24 f8 00 00 00      	movq	%rdx, 0xf8(%rsp)
  69139c: 48 89 fb                     	movq	%rdi, %rbx
  69139f: 0f 10 05 aa 57 46 00         	movups	0x4657aa(%rip), %xmm0   # 0xaf6b50 ; ELF relocation: local pointer 0x11aefe
  6913a6: 48 8d 44 24 0f               	leaq	0xf(%rsp), %rax
  6913ab: 48 89 44 24 60               	movq	%rax, 0x60(%rsp)
  6913b0: 0f 11 44 24 68               	movups	%xmm0, 0x68(%rsp)
  6913b5: 48 8b 05 a4 57 46 00         	movq	0x4657a4(%rip), %rax    # 0xaf6b60
  6913bc: 48 83 f8 02                  	cmpq	$0x2, %rax
  6913c0: 0f 85 6f 04 00 00            	jne	0x691835 <PyInit__native+0x412cf5>
  6913c6: 4c 8d 2d 9b 57 46 00         	leaq	0x46579b(%rip), %r13    # 0xaf6b68
  6913cd: 48 89 b4 24 50 01 00 00      	movq	%rsi, 0x150(%rsp)
  6913d5: 48 8b 2e                     	movq	(%rsi), %rbp
  6913d8: 49 8b 75 00                  	movq	(%r13), %rsi
  6913dc: 48 89 ef                     	movq	%rbp, %rdi
  6913df: ff 15 b3 32 46 00            	callq	*0x4632b3(%rip)         # 0xaf4698 ; ELF relocation: PyObject_GetAttr
  6913e5: 48 85 c0                     	testq	%rax, %rax
  6913e8: 74 42                        	je	0x69142c <PyInit__native+0x4128ec>
  6913ea: 49 89 c6                     	movq	%rax, %r14
  6913ed: 48 8b 78 08                  	movq	0x8(%rax), %rdi
  6913f1: ff 15 c1 31 46 00            	callq	*0x4631c1(%rip)         # 0xaf45b8 ; ELF relocation: PyType_GetFlags
  6913f7: a9 00 00 00 02               	testl	$0x2000000, %eax        # imm = 0x2000000
  6913fc: 0f 85 cc 01 00 00            	jne	0x6915ce <PyInit__native+0x412a8e>
  691402: 4c 8b 3d e7 37 46 00         	movq	0x4637e7(%rip), %r15    # 0xaf4bf0 ; ELF relocation: PyList_Type
  691409: 4c 89 ff                     	movq	%r15, %rdi
  69140c: ff 15 ae 31 46 00            	callq	*0x4631ae(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  691412: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  691417: 4c 89 f6                     	movq	%r14, %rsi
  69141a: 4c 89 fa                     	movq	%r15, %rdx
  69141d: e8 2e 64 ff ff               	callq	0x687850 <PyInit__native+0x408d10>
  691422: 48 8b 44 24 18               	movq	0x18(%rsp), %rax
  691427: e9 9f 02 00 00               	jmp	0x6916cb <PyInit__native+0x412b8b>
  69142c: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  691431: e8 ea 46 ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  691436: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  69143b: 0f 85 30 04 00 00            	jne	0x691871 <PyInit__native+0x412d31>
  691441: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  691446: 0f 10 4c 24 78               	movups	0x78(%rsp), %xmm1
  69144b: 0f 10 94 24 88 00 00 00      	movups	0x88(%rsp), %xmm2
  691453: 0f 10 9c 24 98 00 00 00      	movups	0x98(%rsp), %xmm3
  69145b: 0f 29 9c 24 30 01 00 00      	movaps	%xmm3, 0x130(%rsp)
  691463: 0f 29 94 24 20 01 00 00      	movaps	%xmm2, 0x120(%rsp)
  69146b: 0f 29 8c 24 10 01 00 00      	movaps	%xmm1, 0x110(%rsp)
  691473: 0f 29 84 24 00 01 00 00      	movaps	%xmm0, 0x100(%rsp)
  69147b: 48 8b 84 24 00 01 00 00      	movq	0x100(%rsp), %rax
  691483: 48 8b 8c 24 38 01 00 00      	movq	0x138(%rsp), %rcx
  69148b: 48 89 8c 24 e8 00 00 00      	movq	%rcx, 0xe8(%rsp)
  691493: 0f 10 84 24 28 01 00 00      	movups	0x128(%rsp), %xmm0
  69149b: 0f 11 84 24 d8 00 00 00      	movups	%xmm0, 0xd8(%rsp)
  6914a3: 0f 10 84 24 18 01 00 00      	movups	0x118(%rsp), %xmm0
  6914ab: 0f 11 84 24 c8 00 00 00      	movups	%xmm0, 0xc8(%rsp)
  6914b3: 0f 10 84 24 08 01 00 00      	movups	0x108(%rsp), %xmm0
  6914bb: 0f 11 84 24 b8 00 00 00      	movups	%xmm0, 0xb8(%rsp)
  6914c3: 48 89 84 24 b0 00 00 00      	movq	%rax, 0xb0(%rsp)
  6914cb: 48 8b 05 ce 31 46 00         	movq	0x4631ce(%rip), %rax    # 0xaf46a0 ; ELF relocation: PyExc_AttributeError
  6914d2: 4c 8b 30                     	movq	(%rax), %r14
  6914d5: 4c 89 f7                     	movq	%r14, %rdi
  6914d8: ff 15 e2 30 46 00            	callq	*0x4630e2(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  6914de: 8b 84 24 e8 00 00 00         	movl	0xe8(%rsp), %eax
  6914e5: 85 c0                        	testl	%eax, %eax
  6914e7: 48 89 9c 24 f0 00 00 00      	movq	%rbx, 0xf0(%rsp)
  6914ef: 4c 89 a4 24 48 01 00 00      	movq	%r12, 0x148(%rsp)
  6914f7: 0f 85 86 03 00 00            	jne	0x691883 <PyInit__native+0x412d43>
  6914fd: 83 bc 24 c0 00 00 00 01      	cmpl	$0x1, 0xc0(%rsp)
  691505: 0f 85 49 03 00 00            	jne	0x691854 <PyInit__native+0x412d14>
  69150b: 48 8b bc 24 c8 00 00 00      	movq	0xc8(%rsp), %rdi
  691513: 48 85 ff                     	testq	%rdi, %rdi
  691516: 0f 84 38 03 00 00            	je	0x691854 <PyInit__native+0x412d14>
  69151c: 4c 8d bc 24 c8 00 00 00      	leaq	0xc8(%rsp), %r15
  691524: ff 15 96 30 46 00            	callq	*0x463096(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  69152a: 4d 8b 3f                     	movq	(%r15), %r15
  69152d: 4c 89 ff                     	movq	%r15, %rdi
  691530: 4c 89 f6                     	movq	%r14, %rsi
  691533: ff 15 bf 36 46 00            	callq	*0x4636bf(%rip)         # 0xaf4bf8 ; ELF relocation: PyErr_GivenExceptionMatches
  691539: 41 89 c4                     	movl	%eax, %r12d
  69153c: 48 8b 1d 3d 30 46 00         	movq	0x46303d(%rip), %rbx    # 0xaf4580 ; ELF relocation: _Py_DecRef
  691543: 4c 89 ff                     	movq	%r15, %rdi
  691546: ff d3                        	callq	*%rbx
  691548: 4c 89 f7                     	movq	%r14, %rdi
  69154b: ff d3                        	callq	*%rbx
  69154d: 45 85 e4                     	testl	%r12d, %r12d
  691550: 0f 84 34 01 00 00            	je	0x69168a <PyInit__native+0x412b4a>
  691556: 31 ff                        	xorl	%edi, %edi
  691558: ff 15 8a 32 46 00            	callq	*0x46328a(%rip)         # 0xaf47e8 ; ELF relocation: PyList_New
  69155e: 48 85 c0                     	testq	%rax, %rax
  691561: 48 8b 9c 24 f0 00 00 00      	movq	0xf0(%rsp), %rbx
  691569: 0f 84 2c 03 00 00            	je	0x69189b <PyInit__native+0x412d5b>
  69156f: 49 89 c6                     	movq	%rax, %r14
  691572: 49 8b 75 00                  	movq	(%r13), %rsi
  691576: 48 89 ef                     	movq	%rbp, %rdi
  691579: 48 89 c2                     	movq	%rax, %rdx
  69157c: ff 15 7e 36 46 00            	callq	*0x46367e(%rip)         # 0xaf4c00 ; ELF relocation: PyObject_SetAttr
  691582: 83 f8 ff                     	cmpl	$-0x1, %eax
  691585: 4c 8b a4 24 48 01 00 00      	movq	0x148(%rsp), %r12
  69158d: 0f 84 79 01 00 00            	je	0x69170c <PyInit__native+0x412bcc>
  691593: 4c 89 74 24 18               	movq	%r14, 0x18(%rsp)
  691598: 48 83 bc 24 c0 00 00 00 00   	cmpq	$0x0, 0xc0(%rsp)
  6915a1: 4c 8b ac 24 f8 00 00 00      	movq	0xf8(%rsp), %r13
  6915a9: 74 1c                        	je	0x6915c7 <PyInit__native+0x412a87>
  6915ab: 48 83 bc 24 c8 00 00 00 00   	cmpq	$0x0, 0xc8(%rsp)
  6915b4: 0f 84 0a 02 00 00            	je	0x6917c4 <PyInit__native+0x412c84>
  6915ba: 48 8d bc 24 c8 00 00 00      	leaq	0xc8(%rsp), %rdi
  6915c2: e8 d9 43 ff ff               	callq	0x6859a0 <PyInit__native+0x406e60>
  6915c7: 4c 8b 74 24 18               	movq	0x18(%rsp), %r14
  6915cc: eb 0d                        	jmp	0x6915db <PyInit__native+0x412a9b>
  6915ce: 4c 89 74 24 18               	movq	%r14, 0x18(%rsp)
  6915d3: 4c 8b ac 24 f8 00 00 00      	movq	0xf8(%rsp), %r13
  6915db: 4c 89 f7                     	movq	%r14, %rdi
  6915de: 4c 89 ee                     	movq	%r13, %rsi
  6915e1: ff 15 11 32 46 00            	callq	*0x463211(%rip)         # 0xaf47f8 ; ELF relocation: PyList_Append
  6915e7: 83 f8 ff                     	cmpl	$-0x1, %eax
  6915ea: 0f 84 dd 02 00 00            	je	0x6918cd <PyInit__native+0x412d8d>
  6915f0: 4c 89 f7                     	movq	%r14, %rdi
  6915f3: ff 15 87 2f 46 00            	callq	*0x462f87(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  6915f9: 48 8b 84 24 50 01 00 00      	movq	0x150(%rsp), %rax
  691601: 48 8b 38                     	movq	(%rax), %rdi
  691604: 4c 89 ee                     	movq	%r13, %rsi
  691607: 4c 89 e2                     	movq	%r12, %rdx
  69160a: ff 15 f0 35 46 00            	callq	*0x4635f0(%rip)         # 0xaf4c00 ; ELF relocation: PyObject_SetAttr
  691610: 83 f8 ff                     	cmpl	$-0x1, %eax
  691613: 74 0c                        	je	0x691621 <PyInit__native+0x412ae1>
  691615: 48 c7 03 00 00 00 00         	movq	$0x0, (%rbx)
  69161c: e9 d9 00 00 00               	jmp	0x6916fa <PyInit__native+0x412bba>
  691621: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  691626: e8 f5 44 ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  69162b: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  691630: 0f 85 76 02 00 00            	jne	0x6918ac <PyInit__native+0x412d6c>
  691636: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  69163b: 0f 10 4c 24 78               	movups	0x78(%rsp), %xmm1
  691640: 0f 10 94 24 88 00 00 00      	movups	0x88(%rsp), %xmm2
  691648: 0f 10 9c 24 98 00 00 00      	movups	0x98(%rsp), %xmm3
  691650: 0f 29 5c 24 40               	movaps	%xmm3, 0x40(%rsp)
  691655: 0f 29 54 24 30               	movaps	%xmm2, 0x30(%rsp)
  69165a: 0f 29 4c 24 20               	movaps	%xmm1, 0x20(%rsp)
  69165f: 0f 29 44 24 10               	movaps	%xmm0, 0x10(%rsp)
  691664: 0f 28 44 24 10               	movaps	0x10(%rsp), %xmm0
  691669: 0f 28 4c 24 20               	movaps	0x20(%rsp), %xmm1
  69166e: 0f 28 54 24 30               	movaps	0x30(%rsp), %xmm2
  691673: 0f 28 5c 24 40               	movaps	0x40(%rsp), %xmm3
  691678: 0f 11 5b 38                  	movups	%xmm3, 0x38(%rbx)
  69167c: 0f 11 53 28                  	movups	%xmm2, 0x28(%rbx)
  691680: 0f 11 4b 18                  	movups	%xmm1, 0x18(%rbx)
  691684: 0f 11 43 08                  	movups	%xmm0, 0x8(%rbx)
  691688: eb 69                        	jmp	0x6916f3 <PyInit__native+0x412bb3>
  69168a: 0f 10 84 24 b0 00 00 00      	movups	0xb0(%rsp), %xmm0
  691692: 0f 10 8c 24 c0 00 00 00      	movups	0xc0(%rsp), %xmm1
  69169a: 0f 10 94 24 d0 00 00 00      	movups	0xd0(%rsp), %xmm2
  6916a2: 0f 10 9c 24 e0 00 00 00      	movups	0xe0(%rsp), %xmm3
  6916aa: 0f 11 5c 24 48               	movups	%xmm3, 0x48(%rsp)
  6916af: 0f 11 54 24 38               	movups	%xmm2, 0x38(%rsp)
  6916b4: 0f 11 4c 24 28               	movups	%xmm1, 0x28(%rsp)
  6916b9: 0f 11 44 24 18               	movups	%xmm0, 0x18(%rsp)
  6916be: 48 8b 44 24 18               	movq	0x18(%rsp), %rax
  6916c3: 48 8b 9c 24 f0 00 00 00      	movq	0xf0(%rsp), %rbx
  6916cb: 48 8b 4c 24 50               	movq	0x50(%rsp), %rcx
  6916d0: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  6916d4: 0f 10 44 24 20               	movups	0x20(%rsp), %xmm0
  6916d9: 0f 10 4c 24 30               	movups	0x30(%rsp), %xmm1
  6916de: 0f 10 54 24 40               	movups	0x40(%rsp), %xmm2
  6916e3: 0f 11 53 30                  	movups	%xmm2, 0x30(%rbx)
  6916e7: 0f 11 4b 20                  	movups	%xmm1, 0x20(%rbx)
  6916eb: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  6916ef: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  6916f3: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  6916fa: 48 81 c4 58 01 00 00         	addq	$0x158, %rsp            # imm = 0x158
  691701: 5b                           	popq	%rbx
  691702: 41 5c                        	popq	%r12
  691704: 41 5d                        	popq	%r13
  691706: 41 5e                        	popq	%r14
  691708: 41 5f                        	popq	%r15
  69170a: 5d                           	popq	%rbp
  69170b: c3                           	retq
  69170c: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  691711: e8 0a 44 ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  691716: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  69171b: 0f 85 9a 01 00 00            	jne	0x6918bb <PyInit__native+0x412d7b>
  691721: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  691726: 0f 10 4c 24 78               	movups	0x78(%rsp), %xmm1
  69172b: 0f 10 94 24 88 00 00 00      	movups	0x88(%rsp), %xmm2
  691733: 0f 10 9c 24 98 00 00 00      	movups	0x98(%rsp), %xmm3
  69173b: 0f 29 9c 24 30 01 00 00      	movaps	%xmm3, 0x130(%rsp)
  691743: 0f 29 94 24 20 01 00 00      	movaps	%xmm2, 0x120(%rsp)
  69174b: 0f 29 8c 24 10 01 00 00      	movaps	%xmm1, 0x110(%rsp)
  691753: 0f 29 84 24 00 01 00 00      	movaps	%xmm0, 0x100(%rsp)
  69175b: 0f 28 84 24 00 01 00 00      	movaps	0x100(%rsp), %xmm0
  691763: 0f 28 8c 24 10 01 00 00      	movaps	0x110(%rsp), %xmm1
  69176b: 0f 28 94 24 20 01 00 00      	movaps	0x120(%rsp), %xmm2
  691773: 0f 28 9c 24 30 01 00 00      	movaps	0x130(%rsp), %xmm3
  69177b: 0f 11 44 24 18               	movups	%xmm0, 0x18(%rsp)
  691780: 0f 11 4c 24 28               	movups	%xmm1, 0x28(%rsp)
  691785: 0f 11 54 24 38               	movups	%xmm2, 0x38(%rsp)
  69178a: 0f 11 5c 24 48               	movups	%xmm3, 0x48(%rsp)
  69178f: 4c 89 f7                     	movq	%r14, %rdi
  691792: ff 15 e8 2d 46 00            	callq	*0x462de8(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691798: 48 83 bc 24 c0 00 00 00 00   	cmpq	$0x0, 0xc0(%rsp)
  6917a1: 0f 84 7b fc ff ff            	je	0x691422 <PyInit__native+0x4128e2>
  6917a7: 48 83 bc 24 c8 00 00 00 00   	cmpq	$0x0, 0xc8(%rsp)
  6917b0: 74 4d                        	je	0x6917ff <PyInit__native+0x412cbf>
  6917b2: 48 8d bc 24 c8 00 00 00      	leaq	0xc8(%rsp), %rdi
  6917ba: e8 e1 41 ff ff               	callq	0x6859a0 <PyInit__native+0x406e60>
  6917bf: e9 5e fc ff ff               	jmp	0x691422 <PyInit__native+0x4128e2>
  6917c4: 4c 8b b4 24 d0 00 00 00      	movq	0xd0(%rsp), %r14
  6917cc: 4c 8b bc 24 d8 00 00 00      	movq	0xd8(%rsp), %r15
  6917d4: 49 8b 07                     	movq	(%r15), %rax
  6917d7: 48 85 c0                     	testq	%rax, %rax
  6917da: 74 05                        	je	0x6917e1 <PyInit__native+0x412ca1>
  6917dc: 4c 89 f7                     	movq	%r14, %rdi
  6917df: ff d0                        	callq	*%rax
  6917e1: 49 83 7f 08 00               	cmpq	$0x0, 0x8(%r15)
  6917e6: 0f 84 db fd ff ff            	je	0x6915c7 <PyInit__native+0x412a87>
  6917ec: 4c 89 f7                     	movq	%r14, %rdi
  6917ef: ff 15 7b 2d 46 00            	callq	*0x462d7b(%rip)         # 0xaf4570 ; ELF relocation: free
  6917f5: 4c 8b 74 24 18               	movq	0x18(%rsp), %r14
  6917fa: e9 dc fd ff ff               	jmp	0x6915db <PyInit__native+0x412a9b>
  6917ff: 4c 8b b4 24 d0 00 00 00      	movq	0xd0(%rsp), %r14
  691807: 4c 8b bc 24 d8 00 00 00      	movq	0xd8(%rsp), %r15
  69180f: 49 8b 07                     	movq	(%r15), %rax
  691812: 48 85 c0                     	testq	%rax, %rax
  691815: 74 05                        	je	0x69181c <PyInit__native+0x412cdc>
  691817: 4c 89 f7                     	movq	%r14, %rdi
  69181a: ff d0                        	callq	*%rax
  69181c: 49 83 7f 08 00               	cmpq	$0x0, 0x8(%r15)
  691821: 0f 84 fb fb ff ff            	je	0x691422 <PyInit__native+0x4128e2>
  691827: 4c 89 f7                     	movq	%r14, %rdi
  69182a: ff 15 40 2d 46 00            	callq	*0x462d40(%rip)         # 0xaf4570 ; ELF relocation: free
  691830: e9 ed fb ff ff               	jmp	0x691422 <PyInit__native+0x4128e2>
  691835: 48 8d 3d 24 53 46 00         	leaq	0x465324(%rip), %rdi    # 0xaf6b60
  69183c: 49 89 f6                     	movq	%rsi, %r14
  69183f: 48 8d 74 24 60               	leaq	0x60(%rsp), %rsi
  691844: e8 57 5f ff ff               	callq	0x6877a0 <PyInit__native+0x408c60>
  691849: 4c 89 f6                     	movq	%r14, %rsi
  69184c: 49 89 c5                     	movq	%rax, %r13
  69184f: e9 79 fb ff ff               	jmp	0x6913cd <PyInit__native+0x41288d>
  691854: 48 8d 3d c7 50 aa ff         	leaq	-0x55af39(%rip), %rdi   # 0x136922
  69185b: 48 8d 15 86 40 44 00         	leaq	0x444086(%rip), %rdx    # 0xad58e8 ; ELF relocation: local pointer 0xcfcb7
  691862: be 28 00 00 00               	movl	$0x28, %esi
  691867: e8 74 13 f0 ff               	callq	0x592be0 <PyInit__native+0x3140a0>
  69186c: e9 f1 00 00 00               	jmp	0x691962 <PyInit__native+0x412e22>
  691871: 48 8d bc 24 00 01 00 00      	leaq	0x100(%rsp), %rdi
  691879: e8 e2 44 ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  69187e: e9 f8 fb ff ff               	jmp	0x69147b <PyInit__native+0x41293b>
  691883: 48 8d bc 24 b0 00 00 00      	leaq	0xb0(%rsp), %rdi
  69188b: e8 20 3d ff ff               	callq	0x6855b0 <PyInit__native+0x406a70>
  691890: 49 89 c7                     	movq	%rax, %r15
  691893: 48 8b 38                     	movq	(%rax), %rdi
  691896: e9 89 fc ff ff               	jmp	0x691524 <PyInit__native+0x4129e4>
  69189b: 48 8d 3d 0e 45 44 00         	leaq	0x44450e(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  6918a2: e8 e9 47 ff ff               	callq	0x686090 <PyInit__native+0x407550>
  6918a7: e9 b6 00 00 00               	jmp	0x691962 <PyInit__native+0x412e22>
  6918ac: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  6918b1: e8 aa 44 ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  6918b6: e9 a9 fd ff ff               	jmp	0x691664 <PyInit__native+0x412b24>
  6918bb: 48 8d bc 24 00 01 00 00      	leaq	0x100(%rsp), %rdi
  6918c3: e8 98 44 ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  6918c8: e9 8e fe ff ff               	jmp	0x69175b <PyInit__native+0x412c1b>
  6918cd: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  6918d2: e8 49 42 ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  6918d7: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  6918dc: 0f 85 82 00 00 00            	jne	0x691964 <PyInit__native+0x412e24>
  6918e2: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  6918e7: 0f 10 4c 24 78               	movups	0x78(%rsp), %xmm1
  6918ec: 0f 10 94 24 88 00 00 00      	movups	0x88(%rsp), %xmm2
  6918f4: 0f 10 9c 24 98 00 00 00      	movups	0x98(%rsp), %xmm3
  6918fc: 0f 29 5c 24 40               	movaps	%xmm3, 0x40(%rsp)
  691901: 0f 29 54 24 30               	movaps	%xmm2, 0x30(%rsp)
  691906: 0f 29 4c 24 20               	movaps	%xmm1, 0x20(%rsp)
  69190b: 0f 29 44 24 10               	movaps	%xmm0, 0x10(%rsp)
  691910: 0f 28 44 24 10               	movaps	0x10(%rsp), %xmm0
  691915: 0f 28 4c 24 20               	movaps	0x20(%rsp), %xmm1
  69191a: 0f 28 54 24 30               	movaps	0x30(%rsp), %xmm2
  69191f: 0f 28 5c 24 40               	movaps	0x40(%rsp), %xmm3
  691924: 0f 29 9c 24 90 00 00 00      	movaps	%xmm3, 0x90(%rsp)
  69192c: 0f 29 94 24 80 00 00 00      	movaps	%xmm2, 0x80(%rsp)
  691934: 0f 29 4c 24 70               	movaps	%xmm1, 0x70(%rsp)
  691939: 0f 29 44 24 60               	movaps	%xmm0, 0x60(%rsp)
  69193e: 48 8d 3d e4 95 a8 ff         	leaq	-0x576a1c(%rip), %rdi   # 0x11af29 ; rodata: 'could not append __name__ to __all__io<failed to extract type name>Already mutably borroweduncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previousl'
  691945: 48 8d 0d d4 3d 44 00         	leaq	0x443dd4(%rip), %rcx    # 0xad5720 ; ELF relocation: local pointer 0x684920
  69194c: 4c 8d 05 55 42 44 00         	leaq	0x444255(%rip), %r8     # 0xad5ba8 ; ELF relocation: local pointer 0xd467d
  691953: 48 8d 54 24 60               	leaq	0x60(%rsp), %rdx
  691958: be 24 00 00 00               	movl	$0x24, %esi
  69195d: e8 ee 43 f0 ff               	callq	0x595d50 <PyInit__native+0x317210>
  691962: 0f 0b                        	ud2
  691964: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  691969: e8 f2 43 ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  69196e: eb a0                        	jmp	0x691910 <PyInit__native+0x412dd0>
  691970: eb 00                        	jmp	0x691972 <PyInit__native+0x412e32>
  691972: 48 89 c3                     	movq	%rax, %rbx
  691975: 49 83 7f 08 00               	cmpq	$0x0, 0x8(%r15)
  69197a: 74 59                        	je	0x6919d5 <PyInit__native+0x412e95>
  69197c: 4c 89 f7                     	movq	%r14, %rdi
  69197f: ff 15 eb 2b 46 00            	callq	*0x462beb(%rip)         # 0xaf4570 ; ELF relocation: free
  691985: 48 89 df                     	movq	%rbx, %rdi
  691988: e8 43 98 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  69198d: eb 2d                        	jmp	0x6919bc <PyInit__native+0x412e7c>
  69198f: 48 89 c3                     	movq	%rax, %rbx
  691992: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  691997: e8 84 2f ff ff               	callq	0x684920 <PyInit__native+0x405de0>
  69199c: eb 08                        	jmp	0x6919a6 <PyInit__native+0x412e66>
  69199e: e8 69 44 f0 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
  6919a3: 48 89 c3                     	movq	%rax, %rbx
  6919a6: 4c 89 f7                     	movq	%r14, %rdi
  6919a9: ff 15 d1 2b 46 00            	callq	*0x462bd1(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  6919af: 48 89 df                     	movq	%rbx, %rdi
  6919b2: e8 19 98 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  6919b7: 48 89 c3                     	movq	%rax, %rbx
  6919ba: eb 0c                        	jmp	0x6919c8 <PyInit__native+0x412e88>
  6919bc: 48 89 c3                     	movq	%rax, %rbx
  6919bf: 4c 89 f7                     	movq	%r14, %rdi
  6919c2: ff 15 b8 2b 46 00            	callq	*0x462bb8(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  6919c8: 48 8d bc 24 b0 00 00 00      	leaq	0xb0(%rsp), %rdi
  6919d0: e8 4b 2f ff ff               	callq	0x684920 <PyInit__native+0x405de0>
  6919d5: 48 89 df                     	movq	%rbx, %rdi
  6919d8: e8 f3 97 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  6919dd: e8 2a 44 f0 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
