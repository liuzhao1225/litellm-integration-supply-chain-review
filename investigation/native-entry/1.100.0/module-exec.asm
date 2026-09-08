
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  33d910: 41 57                        	pushq	%r15
  33d912: 41 56                        	pushq	%r14
  33d914: 41 54                        	pushq	%r12
  33d916: 53                           	pushq	%rbx
  33d917: 48 81 ec f8 00 00 00         	subq	$0xf8, %rsp
  33d91e: 48 89 fb                     	movq	%rdi, %rbx
  33d921: 48 8d 05 3c ed dd ff         	leaq	-0x2212c4(%rip), %rax   # 0x11c664 ; rodata: 'uncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previously been poisonedUnable to build Tokio runtimeFailed to initialize new exception type.RustPan'
  33d928: 48 89 84 24 a8 00 00 00      	movq	%rax, 0xa8(%rsp)
  33d930: 48 c7 84 24 b0 00 00 00 1e 00 00 00  	movq	$0x1e, 0xb0(%rsp)
  33d93c: 48 8d 3d 05 9f 7b 00         	leaq	0x7b9f05(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  33d943: e8 b8 04 78 00               	callq	0xabde00 <__tls_get_addr@plt>
  33d948: 48 8b b8 d8 00 00 00         	movq	0xd8(%rax), %rdi
  33d94f: 48 85 ff                     	testq	%rdi, %rdi
  33d952: 0f 88 d4 03 00 00            	js	0x33dd2c <PyInit__native+0xc162c>
  33d958: 4c 8d b8 d8 00 00 00         	leaq	0xd8(%rax), %r15
  33d95f: 48 ff c7                     	incq	%rdi
  33d962: 49 89 3f                     	movq	%rdi, (%r15)
  33d965: 8b 05 b5 c4 7b 00            	movl	0x7bc4b5(%rip), %eax    # 0xaf9e20
  33d96b: 85 c0                        	testl	%eax, %eax
  33d96d: 75 05                        	jne	0x33d974 <PyInit__native+0xc1274>
  33d96f: e8 9c 4b 35 00               	callq	0x692510 <PyInit__native+0x415e10>
  33d974: 48 85 db                     	testq	%rbx, %rbx
  33d977: 74 73                        	je	0x33d9ec <PyInit__native+0xc12ec>
  33d979: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  33d97d: 48 3b 3d 74 a1 7b 00         	cmpq	0x7ba174(%rip), %rdi    # 0xaf7af8 ; ELF relocation: PyModule_Type
  33d984: 74 18                        	je	0x33d99e <PyInit__native+0xc129e>
  33d986: 4c 8b 35 6b a1 7b 00         	movq	0x7ba16b(%rip), %r14    # 0xaf7af8 ; ELF relocation: PyModule_Type
  33d98d: 4c 89 f6                     	movq	%r14, %rsi
  33d990: ff 15 ca 9f 7b 00            	callq	*0x7b9fca(%rip)         # 0xaf7960 ; ELF relocation: PyType_IsSubtype
  33d996: 85 c0                        	testl	%eax, %eax
  33d998: 0f 84 11 01 00 00            	je	0x33daaf <PyInit__native+0xc13af>
  33d99e: 48 89 5c 24 10               	movq	%rbx, 0x10(%rsp)
  33d9a3: 48 8d 15 ce bf 7b 00         	leaq	0x7bbfce(%rip), %rdx    # 0xaf9978 ; ELF relocation: local pointer 0xc935c
  33d9aa: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33d9af: 48 89 de                     	movq	%rbx, %rsi
  33d9b2: e8 49 fa 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33d9b7: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33d9bc: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33d9c1: 0f 85 9b 00 00 00            	jne	0x33da62 <PyInit__native+0xc1362>
  33d9c7: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  33d9cc: f3 0f 6f 4c 24 38            	movdqu	0x38(%rsp), %xmm1
  33d9d2: 48 8b 44 24 48               	movq	0x48(%rsp), %rax
  33d9d7: 48 8b 4c 24 50               	movq	0x50(%rsp), %rcx
  33d9dc: f3 0f 7e 54 24 58            	movq	0x58(%rsp), %xmm2
  33d9e2: be 01 00 00 00               	movl	$0x1, %esi
  33d9e7: e9 23 01 00 00               	jmp	0x33db0f <PyInit__native+0xc140f>
  33d9ec: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33d9f1: e8 5a 38 35 00               	callq	0x691250 <PyInit__native+0x414b50>
  33d9f6: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33d9fb: 0f 85 35 03 00 00            	jne	0x33dd36 <PyInit__native+0xc1636>
  33da01: 0f 10 44 24 20               	movups	0x20(%rsp), %xmm0
  33da06: 0f 10 4c 24 30               	movups	0x30(%rsp), %xmm1
  33da0b: 0f 10 54 24 40               	movups	0x40(%rsp), %xmm2
  33da10: 0f 10 5c 24 50               	movups	0x50(%rsp), %xmm3
  33da15: 0f 29 9c 24 90 00 00 00      	movaps	%xmm3, 0x90(%rsp)
  33da1d: 0f 29 94 24 80 00 00 00      	movaps	%xmm2, 0x80(%rsp)
  33da25: 0f 29 4c 24 70               	movaps	%xmm1, 0x70(%rsp)
  33da2a: 0f 29 44 24 60               	movaps	%xmm0, 0x60(%rsp)
  33da2f: 48 8b 54 24 60               	movq	0x60(%rsp), %rdx
  33da34: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  33da39: f3 0f 6f 4c 24 78            	movdqu	0x78(%rsp), %xmm1
  33da3f: 48 8b 84 24 88 00 00 00      	movq	0x88(%rsp), %rax
  33da47: 48 8b 8c 24 90 00 00 00      	movq	0x90(%rsp), %rcx
  33da4f: f3 0f 7e 94 24 98 00 00 00   	movq	0x98(%rsp), %xmm2
  33da58: be 01 00 00 00               	movl	$0x1, %esi
  33da5d: e9 ad 00 00 00               	jmp	0x33db0f <PyInit__native+0xc140f>
  33da62: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33da67: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33da6c: e8 5f fb 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33da71: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33da76: 0f 85 e4 00 00 00            	jne	0x33db60 <PyInit__native+0xc1460>
  33da7c: 48 8b 54 24 68               	movq	0x68(%rsp), %rdx
  33da81: 0f 10 44 24 70               	movups	0x70(%rsp), %xmm0
  33da86: f3 0f 6f 8c 24 80 00 00 00   	movdqu	0x80(%rsp), %xmm1
  33da8f: 48 8b 84 24 90 00 00 00      	movq	0x90(%rsp), %rax
  33da97: 48 8b 8c 24 98 00 00 00      	movq	0x98(%rsp), %rcx
  33da9f: f3 0f 7e 94 24 a0 00 00 00   	movq	0xa0(%rsp), %xmm2
  33daa8: be 01 00 00 00               	movl	$0x1, %esi
  33daad: eb 60                        	jmp	0x33db0f <PyInit__native+0xc140f>
  33daaf: 4c 8b 25 2a 9e 7b 00         	movq	0x7b9e2a(%rip), %r12    # 0xaf78e0 ; ELF relocation: _Py_IncRef
  33dab6: 4c 89 f7                     	movq	%r14, %rdi
  33dab9: 41 ff d4                     	callq	*%r12
  33dabc: 48 89 df                     	movq	%rbx, %rdi
  33dabf: 41 ff d4                     	callq	*%r12
  33dac2: 48 89 5c 24 18               	movq	%rbx, 0x18(%rsp)
  33dac7: 4c 89 74 24 20               	movq	%r14, 0x20(%rsp)
  33dacc: bf 10 00 00 00               	movl	$0x10, %edi
  33dad1: ff 15 a9 9d 7b 00            	callq	*0x7b9da9(%rip)         # 0xaf7880 ; ELF relocation: malloc
  33dad7: 48 85 c0                     	testq	%rax, %rax
  33dada: 0f 84 65 02 00 00            	je	0x33dd45 <PyInit__native+0xc1645>
  33dae0: 48 89 18                     	movq	%rbx, (%rax)
  33dae3: 4c 89 70 08                  	movq	%r14, 0x8(%rax)
  33dae7: b9 03 00 00 00               	movl	$0x3, %ecx
  33daec: 66 0f 6e d1                  	movd	%ecx, %xmm2
  33daf0: 66 48 0f 6e c8               	movq	%rax, %xmm1
  33daf5: 66 0f 73 f9 08               	pslldq	$0x8, %xmm1             # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  33dafa: 0f 28 05 cf e4 d6 ff         	movaps	-0x291b31(%rip), %xmm0  # 0xabfd0
  33db01: be 01 00 00 00               	movl	$0x1, %esi
  33db06: 48 8d 05 23 b5 79 00         	leaq	0x79b523(%rip), %rax    # 0xad9030 ; ELF relocation: local pointer 0x693030
  33db0d: 31 d2                        	xorl	%edx, %edx
  33db0f: 31 ff                        	xorl	%edi, %edi
  33db11: 0f 11 44 24 28               	movups	%xmm0, 0x28(%rsp)
  33db16: f3 0f 7f 4c 24 38            	movdqu	%xmm1, 0x38(%rsp)
  33db1c: 48 89 44 24 48               	movq	%rax, 0x48(%rsp)
  33db21: 48 89 4c 24 50               	movq	%rcx, 0x50(%rsp)
  33db26: 66 0f d6 54 24 58            	movq	%xmm2, 0x58(%rsp)
  33db2c: 48 89 74 24 18               	movq	%rsi, 0x18(%rsp)
  33db31: 48 89 54 24 20               	movq	%rdx, 0x20(%rsp)
  33db36: 31 db                        	xorl	%ebx, %ebx
  33db38: 40 84 ff                     	testb	%dil, %dil
  33db3b: 75 0f                        	jne	0x33db4c <PyInit__native+0xc144c>
  33db3d: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  33db42: bb ff ff ff ff               	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
  33db47: e8 b4 3c 35 00               	callq	0x691800 <PyInit__native+0x415100>
  33db4c: 49 ff 0f                     	decq	(%r15)
  33db4f: 89 d8                        	movl	%ebx, %eax
  33db51: 48 81 c4 f8 00 00 00         	addq	$0xf8, %rsp
  33db58: 5b                           	popq	%rbx
  33db59: 41 5c                        	popq	%r12
  33db5b: 41 5e                        	popq	%r14
  33db5d: 41 5f                        	popq	%r15
  33db5f: c3                           	retq
  33db60: 48 8d 15 31 be 7b 00         	leaq	0x7bbe31(%rip), %rdx    # 0xaf9998 ; ELF relocation: local pointer 0xc4b37
  33db67: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33db6c: 48 89 de                     	movq	%rbx, %rsi
  33db6f: e8 8c f8 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33db74: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33db79: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33db7e: 0f 84 43 fe ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33db84: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33db89: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33db8e: e8 3d fa 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33db93: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33db98: 0f 84 de fe ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33db9e: 48 8d 15 33 bd 7b 00         	leaq	0x7bbd33(%rip), %rdx    # 0xaf98d8 ; ELF relocation: local pointer 0xd2fe4
  33dba5: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dbaa: 48 89 de                     	movq	%rbx, %rsi
  33dbad: e8 4e f8 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dbb2: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dbb7: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dbbc: 0f 84 05 fe ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33dbc2: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dbc7: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dbcc: e8 ff f9 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33dbd1: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33dbd6: 0f 84 a0 fe ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33dbdc: 48 8d 15 15 bd 7b 00         	leaq	0x7bbd15(%rip), %rdx    # 0xaf98f8 ; ELF relocation: local pointer 0xcc75c
  33dbe3: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dbe8: 48 89 de                     	movq	%rbx, %rsi
  33dbeb: e8 10 f8 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dbf0: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dbf5: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dbfa: 0f 84 c7 fd ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33dc00: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dc05: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dc0a: e8 c1 f9 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33dc0f: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33dc14: 0f 84 62 fe ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33dc1a: 48 8d 15 17 be 7b 00         	leaq	0x7bbe17(%rip), %rdx    # 0xaf9a38 ; ELF relocation: local pointer 0xc4b3c
  33dc21: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dc26: 48 89 de                     	movq	%rbx, %rsi
  33dc29: e8 d2 f7 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dc2e: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dc33: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dc38: 0f 84 89 fd ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33dc3e: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dc43: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dc48: e8 83 f9 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33dc4d: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33dc52: 0f 84 24 fe ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33dc58: 48 8d 15 f9 bd 7b 00         	leaq	0x7bbdf9(%rip), %rdx    # 0xaf9a58 ; ELF relocation: local pointer 0xd2104
  33dc5f: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dc64: 48 89 de                     	movq	%rbx, %rsi
  33dc67: e8 94 f7 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dc6c: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dc71: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dc76: 0f 84 4b fd ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33dc7c: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dc81: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dc86: e8 45 f9 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33dc8b: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33dc90: 0f 84 e6 fd ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33dc96: 48 8b 05 b3 d0 7b 00         	movq	0x7bd0b3(%rip), %rax    # 0xafad50
  33dc9d: 48 83 f8 02                  	cmpq	$0x2, %rax
  33dca1: 0f 85 ce 01 00 00            	jne	0x33de75 <PyInit__native+0xc1775>
  33dca7: 4c 8b 35 aa d0 7b 00         	movq	0x7bd0aa(%rip), %r14    # 0xafad58
  33dcae: 4c 89 f7                     	movq	%r14, %rdi
  33dcb1: ff 15 29 9c 7b 00            	callq	*0x7b9c29(%rip)         # 0xaf78e0 ; ELF relocation: _Py_IncRef
  33dcb7: 48 8d 15 32 bc d9 ff         	leaq	-0x2643ce(%rip), %rdx   # 0xd98f0 ; rodata: 'RustBridgeDeclinedRustUpstreamErrorconnectsend_text'
  33dcbe: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dcc3: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dcc8: b9 12 00 00 00               	movl	$0x12, %ecx
  33dccd: 4d 89 f0                     	movq	%r14, %r8
  33dcd0: e8 9b 16 f8 ff               	callq	0x2bf370 <PyInit__native+0x42c70>
  33dcd5: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dcda: 74 46                        	je	0x33dd22 <PyInit__native+0xc1622>
  33dcdc: 48 8b 05 7d d0 7b 00         	movq	0x7bd07d(%rip), %rax    # 0xafad60
  33dce3: 48 83 f8 02                  	cmpq	$0x2, %rax
  33dce7: 0f 85 97 01 00 00            	jne	0x33de84 <PyInit__native+0xc1784>
  33dced: 4c 8b 35 74 d0 7b 00         	movq	0x7bd074(%rip), %r14    # 0xafad68
  33dcf4: 4c 89 f7                     	movq	%r14, %rdi
  33dcf7: ff 15 e3 9b 7b 00            	callq	*0x7b9be3(%rip)         # 0xaf78e0 ; ELF relocation: _Py_IncRef
  33dcfd: 48 8d 15 fe bb d9 ff         	leaq	-0x264402(%rip), %rdx   # 0xd9902 ; rodata: 'RustUpstreamErrorconnectsend_text'
  33dd04: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dd09: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dd0e: b9 11 00 00 00               	movl	$0x11, %ecx
  33dd13: 4d 89 f0                     	movq	%r14, %r8
  33dd16: e8 55 16 f8 ff               	callq	0x2bf370 <PyInit__native+0x42c70>
  33dd1b: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dd20: 75 37                        	jne	0x33dd59 <PyInit__native+0xc1659>
  33dd22: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dd27: e9 9b fc ff ff               	jmp	0x33d9c7 <PyInit__native+0xc12c7>
  33dd2c: e8 4f 63 35 00               	callq	0x694080 <PyInit__native+0x417980>
  33dd31: e9 a9 01 00 00               	jmp	0x33dedf <PyInit__native+0xc17df>
  33dd36: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dd3b: e8 50 37 35 00               	callq	0x691490 <PyInit__native+0x414d90>
  33dd40: e9 ea fc ff ff               	jmp	0x33da2f <PyInit__native+0xc132f>
  33dd45: bf 08 00 00 00               	movl	$0x8, %edi
  33dd4a: be 10 00 00 00               	movl	$0x10, %esi
  33dd4f: e8 1e 84 01 00               	callq	0x356172 <PyInit__native+0xd9a72>
  33dd54: e9 86 01 00 00               	jmp	0x33dedf <PyInit__native+0xc17df>
  33dd59: 48 8d 15 f8 bb 7b 00         	leaq	0x7bbbf8(%rip), %rdx    # 0xaf9958 ; ELF relocation: local pointer 0xce743
  33dd60: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dd65: 48 89 de                     	movq	%rbx, %rsi
  33dd68: e8 93 f6 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dd6d: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33dd72: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33dd77: 0f 84 4a fc ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33dd7d: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33dd82: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33dd87: e8 44 f8 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33dd8c: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33dd91: 0f 84 e5 fc ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33dd97: 48 8d 15 7a bb 7b 00         	leaq	0x7bbb7a(%rip), %rdx    # 0xaf9918 ; ELF relocation: local pointer 0xc6ebe
  33dd9e: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dda3: 48 89 de                     	movq	%rbx, %rsi
  33dda6: e8 55 f6 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33ddab: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33ddb0: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33ddb5: 0f 84 0c fc ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33ddbb: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33ddc0: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33ddc5: e8 06 f8 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33ddca: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33ddcf: 0f 84 a7 fc ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33ddd5: 48 8d 15 5c bb 7b 00         	leaq	0x7bbb5c(%rip), %rdx    # 0xaf9938 ; ELF relocation: local pointer 0xc3c03
  33dddc: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dde1: 48 89 de                     	movq	%rbx, %rsi
  33dde4: e8 17 f6 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33dde9: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33ddee: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33ddf3: 0f 84 ce fb ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33ddf9: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33ddfe: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33de03: e8 c8 f7 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33de08: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33de0d: 0f 84 69 fc ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33de13: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33de18: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33de1d: e8 ee 15 f8 ff               	callq	0x2bf410 <PyInit__native+0x42d10>
  33de22: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33de27: 0f 84 f5 fe ff ff            	je	0x33dd22 <PyInit__native+0xc1622>
  33de2d: 48 8d 15 44 bc 7b 00         	leaq	0x7bbc44(%rip), %rdx    # 0xaf9a78 ; ELF relocation: local pointer 0xc3ca7
  33de34: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33de39: 48 89 de                     	movq	%rbx, %rsi
  33de3c: e8 bf f5 35 00               	callq	0x69d400 <PyInit__native+0x420d00>
  33de41: 48 8b 54 24 20               	movq	0x20(%rsp), %rdx
  33de46: 83 7c 24 18 01               	cmpl	$0x1, 0x18(%rsp)
  33de4b: 0f 84 76 fb ff ff            	je	0x33d9c7 <PyInit__native+0xc12c7>
  33de51: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  33de56: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  33de5b: e8 70 f7 35 00               	callq	0x69d5d0 <PyInit__native+0x420ed0>
  33de60: 83 7c 24 60 01               	cmpl	$0x1, 0x60(%rsp)
  33de65: 0f 84 11 fc ff ff            	je	0x33da7c <PyInit__native+0xc137c>
  33de6b: 40 b7 01                     	movb	$0x1, %dil
  33de6e: 31 f6                        	xorl	%esi, %esi
  33de70: e9 9c fc ff ff               	jmp	0x33db11 <PyInit__native+0xc1411>
  33de75: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  33de7a: e8 d1 dc f5 ff               	callq	0x29bb50 <PyInit__native+0x1f450>
  33de7f: e9 23 fe ff ff               	jmp	0x33dca7 <PyInit__native+0xc15a7>
  33de84: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  33de89: e8 02 de f5 ff               	callq	0x29bc90 <PyInit__native+0x1f590>
  33de8e: e9 5a fe ff ff               	jmp	0x33dced <PyInit__native+0xc15ed>
  33de93: 48 89 c3                     	movq	%rax, %rbx
  33de96: eb 0d                        	jmp	0x33dea5 <PyInit__native+0xc17a5>
  33de98: 48 89 c3                     	movq	%rax, %rbx
  33de9b: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  33dea0: e8 8b 51 35 00               	callq	0x693030 <PyInit__native+0x416930>
  33dea5: 48 89 df                     	movq	%rbx, %rdi
  33dea8: e8 e9 93 4f 00               	callq	0x837296 <PyInit_pyo3_async_runtimes+0x197a06>
  33dead: 48 8d 9c 24 b8 00 00 00      	leaq	0xb8(%rsp), %rbx
  33deb5: 48 89 df                     	movq	%rbx, %rdi
  33deb8: 48 89 c6                     	movq	%rax, %rsi
  33debb: e8 10 71 35 00               	callq	0x694fd0 <PyInit__native+0x4188d0>
  33dec0: 48 89 df                     	movq	%rbx, %rdi
  33dec3: e9 7a fc ff ff               	jmp	0x33db42 <PyInit__native+0xc1442>
  33dec8: e8 0f 92 23 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  33decd: 49 ff 0f                     	decq	(%r15)
  33ded0: eb 00                        	jmp	0x33ded2 <PyInit__native+0xc17d2>
  33ded2: 48 8d bc 24 a8 00 00 00      	leaq	0xa8(%rsp), %rdi
  33deda: e8 91 fa 35 00               	callq	0x69d970 <PyInit__native+0x421270>
  33dedf: 0f 0b                        	ud2
  33dee1: e8 f6 91 23 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
