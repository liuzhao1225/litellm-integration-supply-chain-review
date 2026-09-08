
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  3582e0: 41 57                        	pushq	%r15
  3582e2: 41 56                        	pushq	%r14
  3582e4: 41 55                        	pushq	%r13
  3582e6: 41 54                        	pushq	%r12
  3582e8: 53                           	pushq	%rbx
  3582e9: 48 81 ec f0 00 00 00         	subq	$0xf0, %rsp
  3582f0: 48 89 fb                     	movq	%rdi, %rbx
  3582f3: 48 8d 05 8a 2c dc ff         	leaq	-0x23d376(%rip), %rax   # 0x11af84 ; rodata: 'uncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previously been poisonedUnable to build Tokio runtimeFailed to initialize new exception type.RustPan'
  3582fa: 48 89 84 24 a0 00 00 00      	movq	%rax, 0xa0(%rsp)
  358302: 48 c7 84 24 a8 00 00 00 1e 00 00 00  	movq	$0x1e, 0xa8(%rsp)
  35830e: 48 8d 3d 13 c2 79 00         	leaq	0x79c213(%rip), %rdi    # 0xaf4528 ; ELF relocation: local pointer 0x0
  358315: e8 e6 2e 76 00               	callq	0xabb200 <__tls_get_addr@plt>
  35831a: 48 8b b8 d8 00 00 00         	movq	0xd8(%rax), %rdi
  358321: 48 85 ff                     	testq	%rdi, %rdi
  358324: 0f 88 9b 05 00 00            	js	0x3588c5 <PyInit__native+0xd9d85>
  35832a: 4c 8d a0 d8 00 00 00         	leaq	0xd8(%rax), %r12
  358331: 48 ff c7                     	incq	%rdi
  358334: 49 89 3c 24                  	movq	%rdi, (%r12)
  358338: 8b 05 d2 e7 79 00            	movl	0x79e7d2(%rip), %eax    # 0xaf6b10
  35833e: 85 c0                        	testl	%eax, %eax
  358340: 75 05                        	jne	0x358347 <PyInit__native+0xd9807>
  358342: e8 99 ea 32 00               	callq	0x686de0 <PyInit__native+0x4082a0>
  358347: 48 85 db                     	testq	%rbx, %rbx
  35834a: 0f 84 cf 00 00 00            	je	0x35841f <PyInit__native+0xd98df>
  358350: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  358354: 48 3b 3d 85 c4 79 00         	cmpq	0x79c485(%rip), %rdi    # 0xaf47e0 ; ELF relocation: PyModule_Type
  35835b: 74 18                        	je	0x358375 <PyInit__native+0xd9835>
  35835d: 4c 8b 35 7c c4 79 00         	movq	0x79c47c(%rip), %r14    # 0xaf47e0 ; ELF relocation: PyModule_Type
  358364: 4c 89 f6                     	movq	%r14, %rsi
  358367: ff 15 d3 c2 79 00            	callq	*0x79c2d3(%rip)         # 0xaf4640 ; ELF relocation: PyType_IsSubtype
  35836d: 85 c0                        	testl	%eax, %eax
  35836f: 0f 84 ff 01 00 00            	je	0x358574 <PyInit__native+0xd9a34>
  358375: 48 89 5c 24 08               	movq	%rbx, 0x8(%rsp)
  35837a: 48 8b 05 c7 f6 79 00         	movq	0x79f6c7(%rip), %rax    # 0xaf7a48
  358381: 48 83 f8 02                  	cmpq	$0x2, %rax
  358385: 0f 85 44 05 00 00            	jne	0x3588cf <PyInit__native+0xd9d8f>
  35838b: 4c 8b 3d be f6 79 00         	movq	0x79f6be(%rip), %r15    # 0xaf7a50
  358392: 4c 89 ff                     	movq	%r15, %rdi
  358395: ff 15 25 c2 79 00            	callq	*0x79c225(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  35839b: 48 8d 3d 41 fd d7 ff         	leaq	-0x2802bf(%rip), %rdi   # 0xd80e3
  3583a2: be 12 00 00 00               	movl	$0x12, %esi
  3583a7: ff 15 73 c2 79 00            	callq	*0x79c273(%rip)         # 0xaf4620 ; ELF relocation: PyUnicode_FromStringAndSize
  3583ad: 48 85 c0                     	testq	%rax, %rax
  3583b0: 0f 84 28 05 00 00            	je	0x3588de <PyInit__native+0xd9d9e>
  3583b6: 49 89 c6                     	movq	%rax, %r14
  3583b9: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3583be: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3583c3: 48 89 c2                     	movq	%rax, %rdx
  3583c6: 4c 89 f9                     	movq	%r15, %rcx
  3583c9: e8 b2 8f 33 00               	callq	0x691380 <PyInit__native+0x412840>
  3583ce: 4c 8b 2d ab c1 79 00         	movq	0x79c1ab(%rip), %r13    # 0xaf4580 ; ELF relocation: _Py_DecRef
  3583d5: 4c 89 ff                     	movq	%r15, %rdi
  3583d8: 41 ff d5                     	callq	*%r13
  3583db: 4c 89 f7                     	movq	%r14, %rdi
  3583de: 41 ff d5                     	callq	*%r13
  3583e1: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  3583e6: 0f 85 9b 00 00 00            	jne	0x358487 <PyInit__native+0xd9947>
  3583ec: 0f 10 44 24 60               	movups	0x60(%rsp), %xmm0
  3583f1: 0f 10 4c 24 70               	movups	0x70(%rsp), %xmm1
  3583f6: 0f 10 94 24 80 00 00 00      	movups	0x80(%rsp), %xmm2
  3583fe: 0f 10 9c 24 90 00 00 00      	movups	0x90(%rsp), %xmm3
  358406: 0f 11 5c 24 48               	movups	%xmm3, 0x48(%rsp)
  35840b: 0f 11 54 24 38               	movups	%xmm2, 0x38(%rsp)
  358410: 0f 11 4c 24 28               	movups	%xmm1, 0x28(%rsp)
  358415: 0f 11 44 24 18               	movups	%xmm0, 0x18(%rsp)
  35841a: e9 d3 00 00 00               	jmp	0x3584f2 <PyInit__native+0xd99b2>
  35841f: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  358424: e8 f7 d6 32 00               	callq	0x685b20 <PyInit__native+0x406fe0>
  358429: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  35842e: 0f 85 bb 04 00 00            	jne	0x3588ef <PyInit__native+0xd9daf>
  358434: 0f 10 44 24 60               	movups	0x60(%rsp), %xmm0
  358439: 0f 10 4c 24 70               	movups	0x70(%rsp), %xmm1
  35843e: 0f 10 94 24 80 00 00 00      	movups	0x80(%rsp), %xmm2
  358446: 0f 10 9c 24 90 00 00 00      	movups	0x90(%rsp), %xmm3
  35844e: 0f 29 5c 24 40               	movaps	%xmm3, 0x40(%rsp)
  358453: 0f 29 54 24 30               	movaps	%xmm2, 0x30(%rsp)
  358458: 0f 29 4c 24 20               	movaps	%xmm1, 0x20(%rsp)
  35845d: 0f 29 44 24 10               	movaps	%xmm0, 0x10(%rsp)
  358462: 48 8b 54 24 10               	movq	0x10(%rsp), %rdx
  358467: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  35846c: f3 0f 6f 4c 24 28            	movdqu	0x28(%rsp), %xmm1
  358472: 48 8b 44 24 38               	movq	0x38(%rsp), %rax
  358477: 48 8b 4c 24 40               	movq	0x40(%rsp), %rcx
  35847c: f3 0f 7e 54 24 48            	movq	0x48(%rsp), %xmm2
  358482: e9 8b 00 00 00               	jmp	0x358512 <PyInit__native+0xd99d2>
  358487: 48 8b 05 ca f5 79 00         	movq	0x79f5ca(%rip), %rax    # 0xaf7a58
  35848e: 48 83 f8 02                  	cmpq	$0x2, %rax
  358492: 0f 85 66 04 00 00            	jne	0x3588fe <PyInit__native+0xd9dbe>
  358498: 4c 8b 3d c1 f5 79 00         	movq	0x79f5c1(%rip), %r15    # 0xaf7a60
  35849f: 4c 89 ff                     	movq	%r15, %rdi
  3584a2: ff 15 18 c1 79 00            	callq	*0x79c118(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  3584a8: 48 8d 3d 46 fc d7 ff         	leaq	-0x2803ba(%rip), %rdi   # 0xd80f5
  3584af: be 11 00 00 00               	movl	$0x11, %esi
  3584b4: ff 15 66 c1 79 00            	callq	*0x79c166(%rip)         # 0xaf4620 ; ELF relocation: PyUnicode_FromStringAndSize
  3584ba: 48 85 c0                     	testq	%rax, %rax
  3584bd: 0f 84 4a 04 00 00            	je	0x35890d <PyInit__native+0xd9dcd>
  3584c3: 49 89 c6                     	movq	%rax, %r14
  3584c6: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  3584cb: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3584d0: 48 89 c2                     	movq	%rax, %rdx
  3584d3: 4c 89 f9                     	movq	%r15, %rcx
  3584d6: e8 a5 8e 33 00               	callq	0x691380 <PyInit__native+0x412840>
  3584db: 4c 89 ff                     	movq	%r15, %rdi
  3584de: 41 ff d5                     	callq	*%r13
  3584e1: 4c 89 f7                     	movq	%r14, %rdi
  3584e4: 41 ff d5                     	callq	*%r13
  3584e7: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3584ec: 0f 85 e7 00 00 00            	jne	0x3585d9 <PyInit__native+0xd9a99>
  3584f2: 48 8b 54 24 18               	movq	0x18(%rsp), %rdx
  3584f7: 0f 10 44 24 20               	movups	0x20(%rsp), %xmm0
  3584fc: f3 0f 6f 4c 24 30            	movdqu	0x30(%rsp), %xmm1
  358502: 48 8b 44 24 40               	movq	0x40(%rsp), %rax
  358507: 48 8b 4c 24 48               	movq	0x48(%rsp), %rcx
  35850c: f3 0f 7e 54 24 50            	movq	0x50(%rsp), %xmm2
  358512: be 01 00 00 00               	movl	$0x1, %esi
  358517: 31 ff                        	xorl	%edi, %edi
  358519: 0f 11 44 24 68               	movups	%xmm0, 0x68(%rsp)
  35851e: f3 0f 7f 4c 24 78            	movdqu	%xmm1, 0x78(%rsp)
  358524: 48 89 84 24 88 00 00 00      	movq	%rax, 0x88(%rsp)
  35852c: 48 89 8c 24 90 00 00 00      	movq	%rcx, 0x90(%rsp)
  358534: 66 0f d6 94 24 98 00 00 00   	movq	%xmm2, 0x98(%rsp)
  35853d: 48 89 74 24 58               	movq	%rsi, 0x58(%rsp)
  358542: 48 89 54 24 60               	movq	%rdx, 0x60(%rsp)
  358547: 31 db                        	xorl	%ebx, %ebx
  358549: 40 84 ff                     	testb	%dil, %dil
  35854c: 75 0f                        	jne	0x35855d <PyInit__native+0xd9a1d>
  35854e: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  358553: bb ff ff ff ff               	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
  358558: e8 73 db 32 00               	callq	0x6860d0 <PyInit__native+0x407590>
  35855d: 49 ff 0c 24                  	decq	(%r12)
  358561: 89 d8                        	movl	%ebx, %eax
  358563: 48 81 c4 f0 00 00 00         	addq	$0xf0, %rsp
  35856a: 5b                           	popq	%rbx
  35856b: 41 5c                        	popq	%r12
  35856d: 41 5d                        	popq	%r13
  35856f: 41 5e                        	popq	%r14
  358571: 41 5f                        	popq	%r15
  358573: c3                           	retq
  358574: 4c 8b 3d 45 c0 79 00         	movq	0x79c045(%rip), %r15    # 0xaf45c0 ; ELF relocation: _Py_IncRef
  35857b: 4c 89 f7                     	movq	%r14, %rdi
  35857e: 41 ff d7                     	callq	*%r15
  358581: 48 89 df                     	movq	%rbx, %rdi
  358584: 41 ff d7                     	callq	*%r15
  358587: 48 89 5c 24 58               	movq	%rbx, 0x58(%rsp)
  35858c: 4c 89 74 24 60               	movq	%r14, 0x60(%rsp)
  358591: bf 10 00 00 00               	movl	$0x10, %edi
  358596: ff 15 c4 bf 79 00            	callq	*0x79bfc4(%rip)         # 0xaf4560 ; ELF relocation: malloc
  35859c: 48 85 c0                     	testq	%rax, %rax
  35859f: 0f 84 79 03 00 00            	je	0x35891e <PyInit__native+0xd9dde>
  3585a5: 48 89 18                     	movq	%rbx, (%rax)
  3585a8: 4c 89 70 08                  	movq	%r14, 0x8(%rax)
  3585ac: b9 03 00 00 00               	movl	$0x3, %ecx
  3585b1: 66 0f 6e d1                  	movd	%ecx, %xmm2
  3585b5: 66 48 0f 6e c8               	movq	%rax, %xmm1
  3585ba: 66 0f 73 f9 08               	pslldq	$0x8, %xmm1             # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  3585bf: 0f 28 05 9a 19 d5 ff         	movaps	-0x2ae666(%rip), %xmm0  # 0xa9f60
  3585c6: be 01 00 00 00               	movl	$0x1, %esi
  3585cb: 48 8d 05 06 d6 77 00         	leaq	0x77d606(%rip), %rax    # 0xad5bd8 ; ELF relocation: local pointer 0x687900
  3585d2: 31 d2                        	xorl	%edx, %edx
  3585d4: e9 3e ff ff ff               	jmp	0x358517 <PyInit__native+0xd99d7>
  3585d9: 48 8d 15 20 e1 79 00         	leaq	0x79e120(%rip), %rdx    # 0xaf6700 ; ELF relocation: local pointer 0xc75f1
  3585e0: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3585e5: 48 89 de                     	movq	%rbx, %rsi
  3585e8: e8 23 96 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  3585ed: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  3585f2: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  3585f7: 75 29                        	jne	0x358622 <PyInit__native+0xd9ae2>
  3585f9: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  3585fe: f3 0f 6f 4c 24 78            	movdqu	0x78(%rsp), %xmm1
  358604: 48 8b 84 24 88 00 00 00      	movq	0x88(%rsp), %rax
  35860c: 48 8b 8c 24 90 00 00 00      	movq	0x90(%rsp), %rcx
  358614: f3 0f 7e 94 24 98 00 00 00   	movq	0x98(%rsp), %xmm2
  35861d: e9 f0 fe ff ff               	jmp	0x358512 <PyInit__native+0xd99d2>
  358622: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358627: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  35862c: e8 2f b6 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  358631: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  358636: 0f 84 b6 fe ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  35863c: 48 8d 15 dd e0 79 00         	leaq	0x79e0dd(%rip), %rdx    # 0xaf6720 ; ELF relocation: local pointer 0xc2b85
  358643: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  358648: 48 89 de                     	movq	%rbx, %rsi
  35864b: e8 c0 95 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  358650: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358655: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  35865a: 74 9d                        	je	0x3585f9 <PyInit__native+0xd9ab9>
  35865c: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358661: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  358666: e8 f5 b5 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  35866b: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  358670: 0f 84 7c fe ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  358676: 48 8d 15 43 e0 79 00         	leaq	0x79e043(%rip), %rdx    # 0xaf66c0 ; ELF relocation: local pointer 0xd12cd
  35867d: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  358682: 48 89 de                     	movq	%rbx, %rsi
  358685: e8 86 95 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  35868a: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  35868f: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  358694: 0f 84 5f ff ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  35869a: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  35869f: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3586a4: e8 b7 b5 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  3586a9: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3586ae: 0f 84 3e fe ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  3586b4: 48 8d 15 25 e0 79 00         	leaq	0x79e025(%rip), %rdx    # 0xaf66e0 ; ELF relocation: local pointer 0xcab6e
  3586bb: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3586c0: 48 89 de                     	movq	%rbx, %rsi
  3586c3: e8 48 95 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  3586c8: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  3586cd: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  3586d2: 0f 84 21 ff ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  3586d8: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  3586dd: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3586e2: e8 79 b5 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  3586e7: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3586ec: 0f 84 00 fe ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  3586f2: 48 8d 15 47 e0 79 00         	leaq	0x79e047(%rip), %rdx    # 0xaf6740 ; ELF relocation: local pointer 0xc2b8a
  3586f9: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3586fe: 48 89 de                     	movq	%rbx, %rsi
  358701: e8 0a 95 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  358706: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  35870b: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  358710: 0f 84 e3 fe ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  358716: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  35871b: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  358720: e8 3b b5 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  358725: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  35872a: 0f 84 c2 fd ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  358730: 48 8d 15 29 e0 79 00         	leaq	0x79e029(%rip), %rdx    # 0xaf6760 ; ELF relocation: local pointer 0xd0488
  358737: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  35873c: 48 89 de                     	movq	%rbx, %rsi
  35873f: e8 cc 94 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  358744: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358749: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  35874e: 0f 84 a5 fe ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  358754: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358759: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  35875e: e8 fd b4 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  358763: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  358768: 0f 84 84 fd ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  35876e: 48 8d 15 2b df 79 00         	leaq	0x79df2b(%rip), %rdx    # 0xaf66a0 ; ELF relocation: local pointer 0xccd3c
  358775: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  35877a: 48 89 de                     	movq	%rbx, %rsi
  35877d: e8 8e 94 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  358782: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358787: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  35878c: 0f 84 67 fe ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  358792: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358797: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  35879c: e8 bf b4 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  3587a1: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3587a6: 0f 84 46 fd ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  3587ac: 48 8d 15 ad de 79 00         	leaq	0x79dead(%rip), %rdx    # 0xaf6660 ; ELF relocation: local pointer 0xc521b
  3587b3: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3587b8: 48 89 de                     	movq	%rbx, %rsi
  3587bb: e8 50 94 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  3587c0: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  3587c5: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  3587ca: 0f 84 29 fe ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  3587d0: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  3587d5: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3587da: e8 81 b4 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  3587df: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3587e4: 0f 84 08 fd ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  3587ea: 48 8d 15 8f de 79 00         	leaq	0x79de8f(%rip), %rdx    # 0xaf6680 ; ELF relocation: local pointer 0xc1d81
  3587f1: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3587f6: 48 89 de                     	movq	%rbx, %rsi
  3587f9: e8 12 94 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  3587fe: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358803: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  358808: 0f 84 eb fd ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  35880e: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358813: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  358818: e8 43 b4 fe ff               	callq	0x343c60 <PyInit__native+0xc5120>
  35881d: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  358822: 0f 84 ca fc ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  358828: 8b 05 ca df 79 00            	movl	0x79dfca(%rip), %eax    # 0xaf67f8
  35882e: 85 c0                        	testl	%eax, %eax
  358830: 0f 85 fc 00 00 00            	jne	0x358932 <PyInit__native+0xd9df2>
  358836: 48 8d 15 b3 df 79 00         	leaq	0x79dfb3(%rip), %rdx    # 0xaf67f0
  35883d: 4c 8b 3a                     	movq	(%rdx), %r15
  358840: 48 8d 3d a9 f2 d7 ff         	leaq	-0x280d57(%rip), %rdi   # 0xd7af0 ; rodata: 'ResponsesWebSocketConnectionInvalid UTF8cached_tokenscache_creation_tokenstext_tokensprompt_tokenscompletion_tokenstotal_tokensprompt_tokens_detailsfinish_reasoncreatedJSON number '
  358847: be 1c 00 00 00               	movl	$0x1c, %esi
  35884c: e8 4f 14 33 00               	callq	0x689ca0 <PyInit__native+0x40b160>
  358851: 49 89 c6                     	movq	%rax, %r14
  358854: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  358859: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  35885e: 48 89 c2                     	movq	%rax, %rdx
  358861: 4c 89 f9                     	movq	%r15, %rcx
  358864: e8 17 8b 33 00               	callq	0x691380 <PyInit__native+0x412840>
  358869: 4c 89 f7                     	movq	%r14, %rdi
  35886c: ff 15 0e bd 79 00            	callq	*0x79bd0e(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  358872: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  358877: 0f 84 75 fc ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  35887d: 48 8d 15 bc dd 79 00         	leaq	0x79ddbc(%rip), %rdx    # 0xaf6640 ; ELF relocation: local pointer 0xc1d77
  358884: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  358889: 48 89 de                     	movq	%rbx, %rsi
  35888c: e8 7f 93 33 00               	callq	0x691c10 <PyInit__native+0x4130d0>
  358891: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358896: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  35889b: 0f 84 58 fd ff ff            	je	0x3585f9 <PyInit__native+0xd9ab9>
  3588a1: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  3588a6: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  3588ab: e8 30 95 33 00               	callq	0x691de0 <PyInit__native+0x4132a0>
  3588b0: 83 7c 24 10 01               	cmpl	$0x1, 0x10(%rsp)
  3588b5: 0f 84 37 fc ff ff            	je	0x3584f2 <PyInit__native+0xd99b2>
  3588bb: 40 b7 01                     	movb	$0x1, %dil
  3588be: 31 f6                        	xorl	%esi, %esi
  3588c0: e9 54 fc ff ff               	jmp	0x358519 <PyInit__native+0xd99d9>
  3588c5: e8 86 00 33 00               	callq	0x688950 <PyInit__native+0x409e10>
  3588ca: e9 25 01 00 00               	jmp	0x3589f4 <PyInit__native+0xd9eb4>
  3588cf: 48 8d 7c 24 07               	leaq	0x7(%rsp), %rdi
  3588d4: e8 e7 8e f4 ff               	callq	0x2a17c0 <PyInit__native+0x22c80>
  3588d9: e9 ad fa ff ff               	jmp	0x35838b <PyInit__native+0xd984b>
  3588de: 48 8d 3d cb d4 77 00         	leaq	0x77d4cb(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  3588e5: e8 a6 d7 32 00               	callq	0x686090 <PyInit__native+0x407550>
  3588ea: e9 05 01 00 00               	jmp	0x3589f4 <PyInit__native+0xd9eb4>
  3588ef: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  3588f4: e8 67 d4 32 00               	callq	0x685d60 <PyInit__native+0x407220>
  3588f9: e9 64 fb ff ff               	jmp	0x358462 <PyInit__native+0xd9922>
  3588fe: 48 8d 7c 24 07               	leaq	0x7(%rsp), %rdi
  358903: e8 f8 8f f4 ff               	callq	0x2a1900 <PyInit__native+0x22dc0>
  358908: e9 8b fb ff ff               	jmp	0x358498 <PyInit__native+0xd9958>
  35890d: 48 8d 3d 9c d4 77 00         	leaq	0x77d49c(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  358914: e8 77 d7 32 00               	callq	0x686090 <PyInit__native+0x407550>
  358919: e9 d6 00 00 00               	jmp	0x3589f4 <PyInit__native+0xd9eb4>
  35891e: bf 08 00 00 00               	movl	$0x8, %edi
  358923: be 10 00 00 00               	movl	$0x10, %esi
  358928: e8 65 de 01 00               	callq	0x376792 <PyInit__native+0xf7c52>
  35892d: e9 c2 00 00 00               	jmp	0x3589f4 <PyInit__native+0xd9eb4>
  358932: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  358937: e8 04 91 fe ff               	callq	0x341a40 <PyInit__native+0xc2f00>
  35893c: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  358941: 83 7c 24 58 01               	cmpl	$0x1, 0x58(%rsp)
  358946: 0f 85 f1 fe ff ff            	jne	0x35883d <PyInit__native+0xd9cfd>
  35894c: 48 8b 84 24 98 00 00 00      	movq	0x98(%rsp), %rax
  358954: 48 89 44 24 50               	movq	%rax, 0x50(%rsp)
  358959: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  35895e: 0f 10 4c 24 78               	movups	0x78(%rsp), %xmm1
  358963: 0f 10 94 24 88 00 00 00      	movups	0x88(%rsp), %xmm2
  35896b: 0f 11 54 24 40               	movups	%xmm2, 0x40(%rsp)
  358970: 0f 11 4c 24 30               	movups	%xmm1, 0x30(%rsp)
  358975: 0f 11 44 24 20               	movups	%xmm0, 0x20(%rsp)
  35897a: e9 78 fb ff ff               	jmp	0x3584f7 <PyInit__native+0xd99b7>
  35897f: 48 89 c3                     	movq	%rax, %rbx
  358982: eb 31                        	jmp	0x3589b5 <PyInit__native+0xd9e75>
  358984: eb 00                        	jmp	0x358986 <PyInit__native+0xd9e46>
  358986: 48 89 c3                     	movq	%rax, %rbx
  358989: 4c 89 ff                     	movq	%r15, %rdi
  35898c: ff 15 ee bb 79 00            	callq	*0x79bbee(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  358992: eb 21                        	jmp	0x3589b5 <PyInit__native+0xd9e75>
  358994: 48 89 c3                     	movq	%rax, %rbx
  358997: eb 25                        	jmp	0x3589be <PyInit__native+0xd9e7e>
  358999: 48 89 c3                     	movq	%rax, %rbx
  35899c: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  3589a1: e8 5a ef 32 00               	callq	0x687900 <PyInit__native+0x408dc0>
  3589a6: eb 16                        	jmp	0x3589be <PyInit__native+0xd9e7e>
  3589a8: e8 5f d4 23 00               	callq	0x595e0c <PyInit__native+0x3172cc>
  3589ad: eb 00                        	jmp	0x3589af <PyInit__native+0xd9e6f>
  3589af: 48 89 c3                     	movq	%rax, %rbx
  3589b2: 4d 89 fe                     	movq	%r15, %r14
  3589b5: 4c 89 f7                     	movq	%r14, %rdi
  3589b8: ff 15 c2 bb 79 00            	callq	*0x79bbc2(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  3589be: 48 89 df                     	movq	%rbx, %rdi
  3589c1: e8 70 b7 4d 00               	callq	0x834136 <PyInit_pyo3_async_runtimes+0x19feb6>
  3589c6: 48 8d 9c 24 b0 00 00 00      	leaq	0xb0(%rsp), %rbx
  3589ce: 48 89 df                     	movq	%rbx, %rdi
  3589d1: 48 89 c6                     	movq	%rax, %rsi
  3589d4: e8 97 0e 33 00               	callq	0x689870 <PyInit__native+0x40ad30>
  3589d9: 48 89 df                     	movq	%rbx, %rdi
  3589dc: e9 72 fb ff ff               	jmp	0x358553 <PyInit__native+0xd9a13>
  3589e1: 49 ff 0c 24                  	decq	(%r12)
  3589e5: eb 00                        	jmp	0x3589e7 <PyInit__native+0xd9ea7>
  3589e7: 48 8d bc 24 a0 00 00 00      	leaq	0xa0(%rsp), %rdi
  3589ef: e8 8c 97 33 00               	callq	0x692180 <PyInit__native+0x413640>
  3589f4: 0f 0b                        	ud2
  3589f6: e8 11 d4 23 00               	callq	0x595e0c <PyInit__native+0x3172cc>
