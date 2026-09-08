
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  32b4b0: 41 57                        	pushq	%r15
  32b4b2: 41 56                        	pushq	%r14
  32b4b4: 41 54                        	pushq	%r12
  32b4b6: 53                           	pushq	%rbx
  32b4b7: 48 81 ec f8 00 00 00         	subq	$0xf8, %rsp
  32b4be: 48 89 fb                     	movq	%rdi, %rbx
  32b4c1: 48 8d 05 5a fe de ff         	leaq	-0x2101a6(%rip), %rax   # 0x11b322 ; rodata: 'uncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previously been poisonedUnable to build Tokio runtimeFailed to initialize new exception type.RustPan'
  32b4c8: 48 89 84 24 a8 00 00 00      	movq	%rax, 0xa8(%rsp)
  32b4d0: 48 c7 84 24 b0 00 00 00 1e 00 00 00  	movq	$0x1e, 0xb0(%rsp)
  32b4dc: 48 8d 3d 45 3a 7c 00         	leaq	0x7c3a45(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  32b4e3: e8 d8 a1 78 00               	callq	0xab56c0 <__tls_get_addr@plt>
  32b4e8: 48 8b b8 d8 00 00 00         	movq	0xd8(%rax), %rdi
  32b4ef: 48 85 ff                     	testq	%rdi, %rdi
  32b4f2: 0f 88 d4 03 00 00            	js	0x32b8cc <PyInit__native+0xb0dcc>
  32b4f8: 4c 8d b8 d8 00 00 00         	leaq	0xd8(%rax), %r15
  32b4ff: 48 ff c7                     	incq	%rdi
  32b502: 49 89 3f                     	movq	%rdi, (%r15)
  32b505: 8b 05 e5 5e 7c 00            	movl	0x7c5ee5(%rip), %eax    # 0xaf13f0
  32b50b: 85 c0                        	testl	%eax, %eax
  32b50d: 75 05                        	jne	0x32b514 <PyInit__native+0xb0a14>
  32b50f: e8 1c 10 36 00               	callq	0x68c530 <PyInit__native+0x411a30>
  32b514: 48 85 db                     	testq	%rbx, %rbx
  32b517: 74 73                        	je	0x32b58c <PyInit__native+0xb0a8c>
  32b519: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  32b51d: 48 3b 3d 9c 3b 7c 00         	cmpq	0x7c3b9c(%rip), %rdi    # 0xaef0c0 ; ELF relocation: PyModule_Type
  32b524: 74 18                        	je	0x32b53e <PyInit__native+0xb0a3e>
  32b526: 4c 8b 35 93 3b 7c 00         	movq	0x7c3b93(%rip), %r14    # 0xaef0c0 ; ELF relocation: PyModule_Type
  32b52d: 4c 89 f6                     	movq	%r14, %rsi
  32b530: ff 15 92 3b 7c 00            	callq	*0x7c3b92(%rip)         # 0xaef0c8 ; ELF relocation: PyType_IsSubtype
  32b536: 85 c0                        	testl	%eax, %eax
  32b538: 0f 84 11 01 00 00            	je	0x32b64f <PyInit__native+0xb0b4f>
  32b53e: 48 89 5c 24 10               	movq	%rbx, 0x10(%rsp)
  32b543: 48 8d 15 fe 59 7c 00         	leaq	0x7c59fe(%rip), %rdx    # 0xaf0f48 ; ELF relocation: local pointer 0xc8379
  32b54a: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b54f: 48 89 de                     	movq	%rbx, %rsi
  32b552: e8 29 bb 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b557: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b55c: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b561: 0f 85 9b 00 00 00            	jne	0x32b602 <PyInit__native+0xb0b02>
  32b567: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  32b56c: f3 0f 6f 4c 24 38            	movdqu	0x38(%rsp), %xmm1
  32b572: 48 8b 44 24 48               	movq	0x48(%rsp), %rax
  32b577: 48 8b 4c 24 50               	movq	0x50(%rsp), %rcx
  32b57c: f3 0f 7e 54 24 58            	movq	0x58(%rsp), %xmm2
  32b582: be 01 00 00 00               	movl	$0x1, %esi
  32b587: e9 23 01 00 00               	jmp	0x32b6af <PyInit__native+0xb0baf>
  32b58c: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b591: e8 da fc 35 00               	callq	0x68b270 <PyInit__native+0x410770>
  32b596: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b59b: 0f 85 35 03 00 00            	jne	0x32b8d6 <PyInit__native+0xb0dd6>
  32b5a1: 0f 10 44 24 20               	movups	0x20(%rsp), %xmm0
  32b5a6: 0f 10 4c 24 30               	movups	0x30(%rsp), %xmm1
  32b5ab: 0f 10 54 24 40               	movups	0x40(%rsp), %xmm2
  32b5b0: 0f 10 5c 24 50               	movups	0x50(%rsp), %xmm3
  32b5b5: 0f 29 9c 24 90 00 00 00      	movaps	%xmm3, 0x90(%rsp)
  32b5bd: 0f 29 94 24 80 00 00 00      	movaps	%xmm2, 0x80(%rsp)
  32b5c5: 0f 29 4c 24 70               	movaps	%xmm1, 0x70(%rsp)
  32b5ca: 0f 29 44 24 60               	movaps	%xmm0, 0x60(%rsp)
  32b5cf: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  32b5d4: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  32b5d9: f3 0f 6f 4c 24 78            	movdqu	0x78(%rsp), %xmm1
  32b5df: 48 8b 84 24 88 00 00 00      	movq	0x88(%rsp), %rax
  32b5e7: 48 8b 8c 24 90 00 00 00      	movq	0x90(%rsp), %rcx
  32b5ef: f3 0f 7e 94 24 98 00 00 00   	movq	0x98(%rsp), %xmm2
  32b5f8: be 01 00 00 00               	movl	$0x1, %esi
  32b5fd: e9 ad 00 00 00               	jmp	0x32b6af <PyInit__native+0xb0baf>
  32b602: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b607: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b60c: e8 3f bc 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b611: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b616: 0f 85 e4 00 00 00            	jne	0x32b700 <PyInit__native+0xb0c00>
  32b61c: 48 8b 54 24 68               	movq	0x68(%rsp), %rdx
  32b621: 0f 10 44 24 70               	movups	0x70(%rsp), %xmm0
  32b626: f3 0f 6f 8c 24 80 00 00 00   	movdqu	0x80(%rsp), %xmm1
  32b62f: 48 8b 84 24 90 00 00 00      	movq	0x90(%rsp), %rax
  32b637: 48 8b 8c 24 98 00 00 00      	movq	0x98(%rsp), %rcx
  32b63f: f3 0f 7e 94 24 a0 00 00 00   	movq	0xa0(%rsp), %xmm2
  32b648: be 01 00 00 00               	movl	$0x1, %esi
  32b64d: eb 60                        	jmp	0x32b6af <PyInit__native+0xb0baf>
  32b64f: 4c 8b 25 72 39 7c 00         	movq	0x7c3972(%rip), %r12    # 0xaeefc8 ; ELF relocation: _Py_IncRef
  32b656: 4c 89 f7                     	movq	%r14, %rdi
  32b659: 41 ff d4                     	callq	*%r12
  32b65c: 48 89 df                     	movq	%rbx, %rdi
  32b65f: 41 ff d4                     	callq	*%r12
  32b662: 48 89 5c 24 18               	movq	%rbx, 0x18(%rsp)
  32b667: 4c 89 74 24 20               	movq	%r14, 0x20(%rsp)
  32b66c: bf 10 00 00 00               	movl	$0x10, %edi
  32b671: ff 15 e9 38 7c 00            	callq	*0x7c38e9(%rip)         # 0xaeef60 ; ELF relocation: malloc
  32b677: 48 85 c0                     	testq	%rax, %rax
  32b67a: 0f 84 65 02 00 00            	je	0x32b8e5 <PyInit__native+0xb0de5>
  32b680: 48 89 18                     	movq	%rbx, (%rax)
  32b683: 4c 89 70 08                  	movq	%r14, 0x8(%rax)
  32b687: b9 03 00 00 00               	movl	$0x3, %ecx
  32b68c: 66 0f 6e d1                  	movd	%ecx, %xmm2
  32b690: 66 48 0f 6e c8               	movq	%rax, %xmm1
  32b695: 66 0f 73 f9 08               	pslldq	$0x8, %xmm1             # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  32b69a: 0f 28 05 3f 07 d8 ff         	movaps	-0x27f8c1(%rip), %xmm0  # 0xabde0
  32b6a1: be 01 00 00 00               	movl	$0x1, %esi
  32b6a6: 48 8d 05 ab 51 7a 00         	leaq	0x7a51ab(%rip), %rax    # 0xad0858 ; ELF relocation: local pointer 0x68d050
  32b6ad: 31 d2                        	xorl	%edx, %edx
  32b6af: 31 ff                        	xorl	%edi, %edi
  32b6b1: 0f 11 44 24 28               	movups	%xmm0, 0x28(%rsp)
  32b6b6: f3 0f 7f 4c 24 38            	movdqu	%xmm1, 0x38(%rsp)
  32b6bc: 48 89 44 24 48               	movq	%rax, 0x48(%rsp)
  32b6c1: 48 89 4c 24 50               	movq	%rcx, 0x50(%rsp)
  32b6c6: 66 0f d6 54 24 58            	movq	%xmm2, 0x58(%rsp)
  32b6cc: 48 89 74 24 18               	movq	%rsi, 0x18(%rsp)
  32b6d1: 48 89 54 24 20               	movq	%rdx, 0x20(%rsp)
  32b6d6: 31 db                        	xorl	%ebx, %ebx
  32b6d8: 40 84 ff                     	testb	%dil, %dil
  32b6db: 75 0f                        	jne	0x32b6ec <PyInit__native+0xb0bec>
  32b6dd: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  32b6e2: bb ff ff ff ff               	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
  32b6e7: e8 34 01 36 00               	callq	0x68b820 <PyInit__native+0x410d20>
  32b6ec: 49 ff 0f                     	decq	(%r15)
  32b6ef: 89 d8                        	movl	%ebx, %eax
  32b6f1: 48 81 c4 f8 00 00 00         	addq	$0xf8, %rsp
  32b6f8: 5b                           	popq	%rbx
  32b6f9: 41 5c                        	popq	%r12
  32b6fb: 41 5e                        	popq	%r14
  32b6fd: 41 5f                        	popq	%r15
  32b6ff: c3                           	retq
  32b700: 48 8d 15 61 58 7c 00         	leaq	0x7c5861(%rip), %rdx    # 0xaf0f68 ; ELF relocation: local pointer 0xc39d1
  32b707: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b70c: 48 89 de                     	movq	%rbx, %rsi
  32b70f: e8 6c b9 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b714: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b719: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b71e: 0f 84 43 fe ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b724: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b729: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b72e: e8 1d bb 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b733: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b738: 0f 84 de fe ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b73e: 48 8d 15 63 57 7c 00         	leaq	0x7c5763(%rip), %rdx    # 0xaf0ea8 ; ELF relocation: local pointer 0xd1e64
  32b745: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b74a: 48 89 de                     	movq	%rbx, %rsi
  32b74d: e8 2e b9 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b752: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b757: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b75c: 0f 84 05 fe ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b762: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b767: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b76c: e8 df ba 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b771: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b776: 0f 84 a0 fe ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b77c: 48 8d 15 45 57 7c 00         	leaq	0x7c5745(%rip), %rdx    # 0xaf0ec8 ; ELF relocation: local pointer 0xcb6bc
  32b783: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b788: 48 89 de                     	movq	%rbx, %rsi
  32b78b: e8 f0 b8 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b790: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b795: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b79a: 0f 84 c7 fd ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b7a0: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b7a5: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b7aa: e8 a1 ba 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b7af: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b7b4: 0f 84 62 fe ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b7ba: 48 8d 15 47 58 7c 00         	leaq	0x7c5847(%rip), %rdx    # 0xaf1008 ; ELF relocation: local pointer 0xc39d6
  32b7c1: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b7c6: 48 89 de                     	movq	%rbx, %rsi
  32b7c9: e8 b2 b8 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b7ce: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b7d3: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b7d8: 0f 84 89 fd ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b7de: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b7e3: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b7e8: e8 63 ba 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b7ed: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b7f2: 0f 84 24 fe ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b7f8: 48 8d 15 29 58 7c 00         	leaq	0x7c5829(%rip), %rdx    # 0xaf1028 ; ELF relocation: local pointer 0xd101f
  32b7ff: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b804: 48 89 de                     	movq	%rbx, %rsi
  32b807: e8 74 b8 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b80c: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b811: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b816: 0f 84 4b fd ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b81c: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b821: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b826: e8 25 ba 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b82b: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b830: 0f 84 e6 fd ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b836: 48 8b 05 b3 6a 7c 00         	movq	0x7c6ab3(%rip), %rax    # 0xaf22f0
  32b83d: 48 83 f8 02                  	cmpq	$0x2, %rax
  32b841: 0f 85 ce 01 00 00            	jne	0x32ba15 <PyInit__native+0xb0f15>
  32b847: 4c 8b 35 aa 6a 7c 00         	movq	0x7c6aaa(%rip), %r14    # 0xaf22f8
  32b84e: 4c 89 f7                     	movq	%r14, %rdi
  32b851: ff 15 71 37 7c 00            	callq	*0x7c3771(%rip)         # 0xaeefc8 ; ELF relocation: _Py_IncRef
  32b857: 48 8d 15 65 cd da ff         	leaq	-0x25329b(%rip), %rdx   # 0xd85c3 ; rodata: 'RustBridgeDeclinedRustUpstreamErrorconnectsend_text'
  32b85e: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b863: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b868: b9 12 00 00 00               	movl	$0x12, %ecx
  32b86d: 4d 89 f0                     	movq	%r14, %r8
  32b870: e8 fb 45 f8 ff               	callq	0x2afe70 <PyInit__native+0x35370>
  32b875: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b87a: 74 46                        	je	0x32b8c2 <PyInit__native+0xb0dc2>
  32b87c: 48 8b 05 7d 6a 7c 00         	movq	0x7c6a7d(%rip), %rax    # 0xaf2300
  32b883: 48 83 f8 02                  	cmpq	$0x2, %rax
  32b887: 0f 85 97 01 00 00            	jne	0x32ba24 <PyInit__native+0xb0f24>
  32b88d: 4c 8b 35 74 6a 7c 00         	movq	0x7c6a74(%rip), %r14    # 0xaf2308
  32b894: 4c 89 f7                     	movq	%r14, %rdi
  32b897: ff 15 2b 37 7c 00            	callq	*0x7c372b(%rip)         # 0xaeefc8 ; ELF relocation: _Py_IncRef
  32b89d: 48 8d 15 31 cd da ff         	leaq	-0x2532cf(%rip), %rdx   # 0xd85d5 ; rodata: 'RustUpstreamErrorconnectsend_text'
  32b8a4: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b8a9: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b8ae: b9 11 00 00 00               	movl	$0x11, %ecx
  32b8b3: 4d 89 f0                     	movq	%r14, %r8
  32b8b6: e8 b5 45 f8 ff               	callq	0x2afe70 <PyInit__native+0x35370>
  32b8bb: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b8c0: 75 37                        	jne	0x32b8f9 <PyInit__native+0xb0df9>
  32b8c2: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b8c7: e9 9b fc ff ff               	jmp	0x32b567 <PyInit__native+0xb0a67>
  32b8cc: e8 cf 27 36 00               	callq	0x68e0a0 <PyInit__native+0x4135a0>
  32b8d1: e9 a9 01 00 00               	jmp	0x32ba7f <PyInit__native+0xb0f7f>
  32b8d6: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b8db: e8 d0 fb 35 00               	callq	0x68b4b0 <PyInit__native+0x4109b0>
  32b8e0: e9 ea fc ff ff               	jmp	0x32b5cf <PyInit__native+0xb0acf>
  32b8e5: bf 08 00 00 00               	movl	$0x8, %edi
  32b8ea: be 10 00 00 00               	movl	$0x10, %esi
  32b8ef: e8 4e 00 01 00               	callq	0x33b942 <PyInit__native+0xc0e42>
  32b8f4: e9 86 01 00 00               	jmp	0x32ba7f <PyInit__native+0xb0f7f>
  32b8f9: 48 8d 15 28 56 7c 00         	leaq	0x7c5628(%rip), %rdx    # 0xaf0f28 ; ELF relocation: local pointer 0xcd797
  32b900: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b905: 48 89 de                     	movq	%rbx, %rsi
  32b908: e8 73 b7 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b90d: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b912: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b917: 0f 84 4a fc ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b91d: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b922: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b927: e8 24 b9 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b92c: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b931: 0f 84 e5 fc ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b937: 48 8d 15 aa 55 7c 00         	leaq	0x7c55aa(%rip), %rdx    # 0xaf0ee8 ; ELF relocation: local pointer 0xc5fd2
  32b93e: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b943: 48 89 de                     	movq	%rbx, %rsi
  32b946: e8 35 b7 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b94b: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b950: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b955: 0f 84 0c fc ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b95b: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b960: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b965: e8 e6 b8 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b96a: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b96f: 0f 84 a7 fc ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b975: 48 8d 15 8c 55 7c 00         	leaq	0x7c558c(%rip), %rdx    # 0xaf0f08 ; ELF relocation: local pointer 0xc2ab8
  32b97c: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b981: 48 89 de                     	movq	%rbx, %rsi
  32b984: e8 f7 b6 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b989: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b98e: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b993: 0f 84 ce fb ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b999: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b99e: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b9a3: e8 a8 b8 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32b9a8: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32b9ad: 0f 84 69 fc ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32b9b3: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b9b8: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b9bd: e8 4e 45 f8 ff               	callq	0x2aff10 <PyInit__native+0x35410>
  32b9c2: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b9c7: 0f 84 f5 fe ff ff            	je	0x32b8c2 <PyInit__native+0xb0dc2>
  32b9cd: 48 8d 15 74 56 7c 00         	leaq	0x7c5674(%rip), %rdx    # 0xaf1048 ; ELF relocation: local pointer 0xc2b5c
  32b9d4: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32b9d9: 48 89 de                     	movq	%rbx, %rsi
  32b9dc: e8 9f b6 36 00               	callq	0x697080 <PyInit__native+0x41c580>
  32b9e1: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  32b9e6: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  32b9eb: 0f 84 76 fb ff ff            	je	0x32b567 <PyInit__native+0xb0a67>
  32b9f1: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  32b9f6: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  32b9fb: e8 50 b8 36 00               	callq	0x697250 <PyInit__native+0x41c750>
  32ba00: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  32ba05: 0f 84 11 fc ff ff            	je	0x32b61c <PyInit__native+0xb0b1c>
  32ba0b: 40 b7 01                     	movb	$0x1, %dil
  32ba0e: 31 f6                        	xorl	%esi, %esi
  32ba10: e9 9c fc ff ff               	jmp	0x32b6b1 <PyInit__native+0xb0bb1>
  32ba15: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  32ba1a: e8 31 44 f6 ff               	callq	0x28fe50 <PyInit__native+0x15350>
  32ba1f: e9 23 fe ff ff               	jmp	0x32b847 <PyInit__native+0xb0d47>
  32ba24: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  32ba29: e8 62 45 f6 ff               	callq	0x28ff90 <PyInit__native+0x15490>
  32ba2e: e9 5a fe ff ff               	jmp	0x32b88d <PyInit__native+0xb0d8d>
  32ba33: 48 89 c3                     	movq	%rax, %rbx
  32ba36: eb 0d                        	jmp	0x32ba45 <PyInit__native+0xb0f45>
  32ba38: 48 89 c3                     	movq	%rax, %rbx
  32ba3b: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  32ba40: e8 0b 16 36 00               	callq	0x68d050 <PyInit__native+0x412550>
  32ba45: 48 89 df                     	movq	%rbx, %rdi
  32ba48: e8 99 34 50 00               	callq	0x82eee6 <PyInit_pyo3_async_runtimes+0x195886>
  32ba4d: 48 8d 9c 24 b8 00 00 00      	leaq	0xb8(%rsp), %rbx
  32ba55: 48 89 df                     	movq	%rbx, %rdi
  32ba58: 48 89 c6                     	movq	%rax, %rsi
  32ba5b: e8 30 34 36 00               	callq	0x68ee90 <PyInit__native+0x414390>
  32ba60: 48 89 df                     	movq	%rbx, %rdi
  32ba63: e9 7a fc ff ff               	jmp	0x32b6e2 <PyInit__native+0xb0be2>
  32ba68: e8 3f ed 22 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  32ba6d: 49 ff 0f                     	decq	(%r15)
  32ba70: eb 00                        	jmp	0x32ba72 <PyInit__native+0xb0f72>
  32ba72: 48 8d bc 24 a8 00 00 00      	leaq	0xa8(%rsp), %rdi
  32ba7a: e8 71 bb 36 00               	callq	0x6975f0 <PyInit__native+0x41caf0>
  32ba7f: 0f 0b                        	ud2
  32ba81: e8 26 ed 22 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
