
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  699670: 41 57                        	pushq	%r15
  699672: 41 56                        	pushq	%r14
  699674: 41 54                        	pushq	%r12
  699676: 53                           	pushq	%rbx
  699677: 48 81 ec e8 00 00 00         	subq	$0xe8, %rsp
  69967e: 48 89 fb                     	movq	%rdi, %rbx
  699681: 48 8d 05 9a 1c a8 ff         	leaq	-0x57e366(%rip), %rax   # 0x11b322 ; rodata: 'uncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previously been poisonedUnable to build Tokio runtimeFailed to initialize new exception type.RustPan'
  699688: 48 89 84 24 98 00 00 00      	movq	%rax, 0x98(%rsp)
  699690: 48 c7 84 24 a0 00 00 00 1e 00 00 00  	movq	$0x1e, 0xa0(%rsp)
  69969c: 48 8d 3d 85 58 45 00         	leaq	0x455885(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  6996a3: e8 18 c0 41 00               	callq	0xab56c0 <__tls_get_addr@plt>
  6996a8: 48 8b b8 d8 00 00 00         	movq	0xd8(%rax), %rdi
  6996af: 48 85 ff                     	testq	%rdi, %rdi
  6996b2: 0f 88 12 02 00 00            	js	0x6998ca <PyInit_pyo3_async_runtimes+0x26a>
  6996b8: 4c 8d a0 d8 00 00 00         	leaq	0xd8(%rax), %r12
  6996bf: 48 ff c7                     	incq	%rdi
  6996c2: 49 89 3c 24                  	movq	%rdi, (%r12)
  6996c6: 8b 05 24 7d 45 00            	movl	0x457d24(%rip), %eax    # 0xaf13f0
  6996cc: 85 c0                        	testl	%eax, %eax
  6996ce: 75 05                        	jne	0x6996d5 <PyInit_pyo3_async_runtimes+0x75>
  6996d0: e8 5b 2e ff ff               	callq	0x68c530 <PyInit__native+0x411a30>
  6996d5: 48 85 db                     	testq	%rbx, %rbx
  6996d8: 0f 84 c6 00 00 00            	je	0x6997a4 <PyInit_pyo3_async_runtimes+0x144>
  6996de: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  6996e2: 48 3b 3d d7 59 45 00         	cmpq	0x4559d7(%rip), %rdi    # 0xaef0c0 ; ELF relocation: PyModule_Type
  6996e9: 74 18                        	je	0x699703 <PyInit_pyo3_async_runtimes+0xa3>
  6996eb: 4c 8b 35 ce 59 45 00         	movq	0x4559ce(%rip), %r14    # 0xaef0c0 ; ELF relocation: PyModule_Type
  6996f2: 4c 89 f6                     	movq	%r14, %rsi
  6996f5: ff 15 cd 59 45 00            	callq	*0x4559cd(%rip)         # 0xaef0c8 ; ELF relocation: PyType_IsSubtype
  6996fb: 85 c0                        	testl	%eax, %eax
  6996fd: 0f 84 15 01 00 00            	je	0x699818 <PyInit_pyo3_async_runtimes+0x1b8>
  699703: 48 89 5c 24 50               	movq	%rbx, 0x50(%rsp)
  699708: 48 8b 05 89 8c 45 00         	movq	0x458c89(%rip), %rax    # 0xaf2398
  69970f: 48 83 f8 02                  	cmpq	$0x2, %rax
  699713: 0f 85 bb 01 00 00            	jne	0x6998d4 <PyInit_pyo3_async_runtimes+0x274>
  699719: 48 8b 1d 80 8c 45 00         	movq	0x458c80(%rip), %rbx    # 0xaf23a0
  699720: 48 89 df                     	movq	%rbx, %rdi
  699723: ff 15 9f 58 45 00            	callq	*0x45589f(%rip)         # 0xaeefc8 ; ELF relocation: _Py_IncRef
  699729: 48 8d 3d 9f 1c a8 ff         	leaq	-0x57e361(%rip), %rdi   # 0x11b3cf ; rodata: 'RustPanicfuturevaluefutadd_done_callbackunknown errorcopy_contextcreate_futurecall_soon_threadsafeset_resultset_exceptioncancelled'
  699730: be 09 00 00 00               	movl	$0x9, %esi
  699735: ff 15 bd 58 45 00            	callq	*0x4558bd(%rip)         # 0xaeeff8 ; ELF relocation: PyUnicode_FromStringAndSize
  69973b: 48 85 c0                     	testq	%rax, %rax
  69973e: 0f 84 9f 01 00 00            	je	0x6998e3 <PyInit_pyo3_async_runtimes+0x283>
  699744: 49 89 c6                     	movq	%rax, %r14
  699747: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69974c: 48 8d 74 24 50               	leaq	0x50(%rsp), %rsi
  699751: 48 89 c2                     	movq	%rax, %rdx
  699754: 48 89 d9                     	movq	%rbx, %rcx
  699757: e8 b4 d2 ff ff               	callq	0x696a10 <PyInit__native+0x41bf10>
  69975c: 4c 8b 3d 45 58 45 00         	movq	0x455845(%rip), %r15    # 0xaeefa8 ; ELF relocation: _Py_DecRef
  699763: 48 89 df                     	movq	%rbx, %rdi
  699766: 41 ff d7                     	callq	*%r15
  699769: 4c 89 f7                     	movq	%r14, %rdi
  69976c: 41 ff d7                     	callq	*%r15
  69976f: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  699774: 0f 85 97 00 00 00            	jne	0x699811 <PyInit_pyo3_async_runtimes+0x1b1>
  69977a: 48 8b 44 24 10               	movq	0x10(%rsp), %rax
  69977f: 0f 10 54 24 18               	movups	0x18(%rsp), %xmm2
  699784: f3 0f 6f 4c 24 28            	movdqu	0x28(%rsp), %xmm1
  69978a: 48 8b 54 24 38               	movq	0x38(%rsp), %rdx
  69978f: 48 8b 7c 24 40               	movq	0x40(%rsp), %rdi
  699794: f3 0f 7e 44 24 48            	movq	0x48(%rsp), %xmm0
  69979a: b9 01 00 00 00               	movl	$0x1, %ecx
  69979f: e9 d4 00 00 00               	jmp	0x699878 <PyInit_pyo3_async_runtimes+0x218>
  6997a4: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  6997a9: e8 c2 1a ff ff               	callq	0x68b270 <PyInit__native+0x410770>
  6997ae: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  6997b3: 0f 85 3b 01 00 00            	jne	0x6998f4 <PyInit_pyo3_async_runtimes+0x294>
  6997b9: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  6997be: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  6997c3: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  6997c8: 0f 10 5c 24 40               	movups	0x40(%rsp), %xmm3
  6997cd: 0f 29 9c 24 80 00 00 00      	movaps	%xmm3, 0x80(%rsp)
  6997d5: 0f 29 54 24 70               	movaps	%xmm2, 0x70(%rsp)
  6997da: 0f 29 4c 24 60               	movaps	%xmm1, 0x60(%rsp)
  6997df: 0f 29 44 24 50               	movaps	%xmm0, 0x50(%rsp)
  6997e4: 48 8b 44 24 50               	movq	0x50(%rsp), %rax
  6997e9: 0f 10 54 24 58               	movups	0x58(%rsp), %xmm2
  6997ee: f3 0f 6f 4c 24 68            	movdqu	0x68(%rsp), %xmm1
  6997f4: 48 8b 54 24 78               	movq	0x78(%rsp), %rdx
  6997f9: 48 8b bc 24 80 00 00 00      	movq	0x80(%rsp), %rdi
  699801: f3 0f 7e 84 24 88 00 00 00   	movq	0x88(%rsp), %xmm0
  69980a: b9 01 00 00 00               	movl	$0x1, %ecx
  69980f: eb 67                        	jmp	0x699878 <PyInit_pyo3_async_runtimes+0x218>
  699811: 40 b6 01                     	movb	$0x1, %sil
  699814: 31 c9                        	xorl	%ecx, %ecx
  699816: eb 62                        	jmp	0x69987a <PyInit_pyo3_async_runtimes+0x21a>
  699818: 4c 8b 3d a9 57 45 00         	movq	0x4557a9(%rip), %r15    # 0xaeefc8 ; ELF relocation: _Py_IncRef
  69981f: 4c 89 f7                     	movq	%r14, %rdi
  699822: 41 ff d7                     	callq	*%r15
  699825: 48 89 df                     	movq	%rbx, %rdi
  699828: 41 ff d7                     	callq	*%r15
  69982b: 48 89 5c 24 08               	movq	%rbx, 0x8(%rsp)
  699830: 4c 89 74 24 10               	movq	%r14, 0x10(%rsp)
  699835: bf 10 00 00 00               	movl	$0x10, %edi
  69983a: ff 15 20 57 45 00            	callq	*0x455720(%rip)         # 0xaeef60 ; ELF relocation: malloc
  699840: 48 85 c0                     	testq	%rax, %rax
  699843: 0f 84 ba 00 00 00            	je	0x699903 <PyInit_pyo3_async_runtimes+0x2a3>
  699849: 48 89 18                     	movq	%rbx, (%rax)
  69984c: 4c 89 70 08                  	movq	%r14, 0x8(%rax)
  699850: b9 03 00 00 00               	movl	$0x3, %ecx
  699855: 66 0f 6e c1                  	movd	%ecx, %xmm0
  699859: 66 48 0f 6e c8               	movq	%rax, %xmm1
  69985e: 66 0f 73 f9 08               	pslldq	$0x8, %xmm1             # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  699863: 0f 28 15 76 25 a1 ff         	movaps	-0x5eda8a(%rip), %xmm2  # 0xabde0
  69986a: b9 01 00 00 00               	movl	$0x1, %ecx
  69986f: 48 8d 15 e2 6f 43 00         	leaq	0x436fe2(%rip), %rdx    # 0xad0858 ; ELF relocation: local pointer 0x68d050
  699876: 31 c0                        	xorl	%eax, %eax
  699878: 31 f6                        	xorl	%esi, %esi
  69987a: 0f 11 54 24 18               	movups	%xmm2, 0x18(%rsp)
  69987f: f3 0f 7f 4c 24 28            	movdqu	%xmm1, 0x28(%rsp)
  699885: 48 89 54 24 38               	movq	%rdx, 0x38(%rsp)
  69988a: 48 89 7c 24 40               	movq	%rdi, 0x40(%rsp)
  69988f: 66 0f d6 44 24 48            	movq	%xmm0, 0x48(%rsp)
  699895: 48 89 4c 24 08               	movq	%rcx, 0x8(%rsp)
  69989a: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  69989f: 31 db                        	xorl	%ebx, %ebx
  6998a1: 40 84 f6                     	testb	%sil, %sil
  6998a4: 75 0f                        	jne	0x6998b5 <PyInit_pyo3_async_runtimes+0x255>
  6998a6: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  6998ab: bb ff ff ff ff               	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
  6998b0: e8 6b 1f ff ff               	callq	0x68b820 <PyInit__native+0x410d20>
  6998b5: 49 ff 0c 24                  	decq	(%r12)
  6998b9: 89 d8                        	movl	%ebx, %eax
  6998bb: 48 81 c4 e8 00 00 00         	addq	$0xe8, %rsp
  6998c2: 5b                           	popq	%rbx
  6998c3: 41 5c                        	popq	%r12
  6998c5: 41 5e                        	popq	%r14
  6998c7: 41 5f                        	popq	%r15
  6998c9: c3                           	retq
  6998ca: e8 d1 47 ff ff               	callq	0x68e0a0 <PyInit__native+0x4135a0>
  6998cf: e9 ac 00 00 00               	jmp	0x699980 <PyInit_pyo3_async_runtimes+0x320>
  6998d4: 48 8d 7c 24 07               	leaq	0x7(%rsp), %rdi
  6998d9: e8 b2 00 00 00               	callq	0x699990 <PyInit_pyo3_async_runtimes+0x330>
  6998de: e9 36 fe ff ff               	jmp	0x699719 <PyInit_pyo3_async_runtimes+0xb9>
  6998e3: 48 8d 3d 46 71 43 00         	leaq	0x437146(%rip), %rdi    # 0xad0a30 ; ELF relocation: local pointer 0xd39ea
  6998ea: e8 f1 1e ff ff               	callq	0x68b7e0 <PyInit__native+0x410ce0>
  6998ef: e9 8c 00 00 00               	jmp	0x699980 <PyInit_pyo3_async_runtimes+0x320>
  6998f4: 48 8d 7c 24 50               	leaq	0x50(%rsp), %rdi
  6998f9: e8 b2 1b ff ff               	callq	0x68b4b0 <PyInit__native+0x4109b0>
  6998fe: e9 e1 fe ff ff               	jmp	0x6997e4 <PyInit_pyo3_async_runtimes+0x184>
  699903: bf 08 00 00 00               	movl	$0x8, %edi
  699908: be 10 00 00 00               	movl	$0x10, %esi
  69990d: e8 30 20 ca ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  699912: eb 6c                        	jmp	0x699980 <PyInit_pyo3_async_runtimes+0x320>
  699914: 49 89 c7                     	movq	%rax, %r15
  699917: eb 31                        	jmp	0x69994a <PyInit_pyo3_async_runtimes+0x2ea>
  699919: 49 89 c7                     	movq	%rax, %r15
  69991c: 48 89 df                     	movq	%rbx, %rdi
  69991f: ff 15 83 56 45 00            	callq	*0x455683(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  699925: eb 1a                        	jmp	0x699941 <PyInit_pyo3_async_runtimes+0x2e1>
  699927: 49 89 c7                     	movq	%rax, %r15
  69992a: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69992f: e8 1c 37 ff ff               	callq	0x68d050 <PyInit__native+0x412550>
  699934: eb 14                        	jmp	0x69994a <PyInit_pyo3_async_runtimes+0x2ea>
  699936: e8 71 0e ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  69993b: 49 89 c7                     	movq	%rax, %r15
  69993e: 49 89 de                     	movq	%rbx, %r14
  699941: 4c 89 f7                     	movq	%r14, %rdi
  699944: ff 15 5e 56 45 00            	callq	*0x45565e(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  69994a: 4c 89 ff                     	movq	%r15, %rdi
  69994d: e8 94 55 19 00               	callq	0x82eee6 <PyInit_pyo3_async_runtimes+0x195886>
  699952: 48 8d 9c 24 a8 00 00 00      	leaq	0xa8(%rsp), %rbx
  69995a: 48 89 df                     	movq	%rbx, %rdi
  69995d: 48 89 c6                     	movq	%rax, %rsi
  699960: e8 2b 55 ff ff               	callq	0x68ee90 <PyInit__native+0x414390>
  699965: 48 89 df                     	movq	%rbx, %rdi
  699968: e9 3e ff ff ff               	jmp	0x6998ab <PyInit_pyo3_async_runtimes+0x24b>
  69996d: 49 ff 0c 24                  	decq	(%r12)
  699971: eb 00                        	jmp	0x699973 <PyInit_pyo3_async_runtimes+0x313>
  699973: 48 8d bc 24 98 00 00 00      	leaq	0x98(%rsp), %rdi
  69997b: e8 70 dc ff ff               	callq	0x6975f0 <PyInit__native+0x41caf0>
  699980: 0f 0b                        	ud2
  699982: e8 25 0e ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
