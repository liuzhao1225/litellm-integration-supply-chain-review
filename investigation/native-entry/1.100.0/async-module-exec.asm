
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  69f8a0: 41 57                        	pushq	%r15
  69f8a2: 41 56                        	pushq	%r14
  69f8a4: 41 54                        	pushq	%r12
  69f8a6: 53                           	pushq	%rbx
  69f8a7: 48 81 ec e8 00 00 00         	subq	$0xe8, %rsp
  69f8ae: 48 89 fb                     	movq	%rdi, %rbx
  69f8b1: 48 8d 05 ac cd a7 ff         	leaq	-0x583254(%rip), %rax   # 0x11c664 ; rodata: 'uncaught panic at ffi boundaryPyDoneCallbackcontextvarsasyncioLazy instance has previously been poisonedUnable to build Tokio runtimeFailed to initialize new exception type.RustPan'
  69f8b8: 48 89 84 24 98 00 00 00      	movq	%rax, 0x98(%rsp)
  69f8c0: 48 c7 84 24 a0 00 00 00 1e 00 00 00  	movq	$0x1e, 0xa0(%rsp)
  69f8cc: 48 8d 3d 75 7f 45 00         	leaq	0x457f75(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  69f8d3: e8 28 e5 41 00               	callq	0xabde00 <__tls_get_addr@plt>
  69f8d8: 48 8b b8 d8 00 00 00         	movq	0xd8(%rax), %rdi
  69f8df: 48 85 ff                     	testq	%rdi, %rdi
  69f8e2: 0f 88 12 02 00 00            	js	0x69fafa <PyInit_pyo3_async_runtimes+0x26a>
  69f8e8: 4c 8d a0 d8 00 00 00         	leaq	0xd8(%rax), %r12
  69f8ef: 48 ff c7                     	incq	%rdi
  69f8f2: 49 89 3c 24                  	movq	%rdi, (%r12)
  69f8f6: 8b 05 24 a5 45 00            	movl	0x45a524(%rip), %eax    # 0xaf9e20
  69f8fc: 85 c0                        	testl	%eax, %eax
  69f8fe: 75 05                        	jne	0x69f905 <PyInit_pyo3_async_runtimes+0x75>
  69f900: e8 0b 2c ff ff               	callq	0x692510 <PyInit__native+0x415e10>
  69f905: 48 85 db                     	testq	%rbx, %rbx
  69f908: 0f 84 c6 00 00 00            	je	0x69f9d4 <PyInit_pyo3_async_runtimes+0x144>
  69f90e: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  69f912: 48 3b 3d df 81 45 00         	cmpq	0x4581df(%rip), %rdi    # 0xaf7af8 ; ELF relocation: PyModule_Type
  69f919: 74 18                        	je	0x69f933 <PyInit_pyo3_async_runtimes+0xa3>
  69f91b: 4c 8b 35 d6 81 45 00         	movq	0x4581d6(%rip), %r14    # 0xaf7af8 ; ELF relocation: PyModule_Type
  69f922: 4c 89 f6                     	movq	%r14, %rsi
  69f925: ff 15 35 80 45 00            	callq	*0x458035(%rip)         # 0xaf7960 ; ELF relocation: PyType_IsSubtype
  69f92b: 85 c0                        	testl	%eax, %eax
  69f92d: 0f 84 15 01 00 00            	je	0x69fa48 <PyInit_pyo3_async_runtimes+0x1b8>
  69f933: 48 89 5c 24 50               	movq	%rbx, 0x50(%rsp)
  69f938: 48 8b 05 b9 b4 45 00         	movq	0x45b4b9(%rip), %rax    # 0xafadf8
  69f93f: 48 83 f8 02                  	cmpq	$0x2, %rax
  69f943: 0f 85 bb 01 00 00            	jne	0x69fb04 <PyInit_pyo3_async_runtimes+0x274>
  69f949: 48 8b 1d b0 b4 45 00         	movq	0x45b4b0(%rip), %rbx    # 0xafae00
  69f950: 48 89 df                     	movq	%rbx, %rdi
  69f953: ff 15 87 7f 45 00            	callq	*0x457f87(%rip)         # 0xaf78e0 ; ELF relocation: _Py_IncRef
  69f959: 48 8d 3d b1 cd a7 ff         	leaq	-0x58324f(%rip), %rdi   # 0x11c711 ; rodata: 'RustPanicfuturevaluefutadd_done_callbackunknown errorcopy_contextcreate_futurecall_soon_threadsafeset_resultset_exceptioncancelled'
  69f960: be 09 00 00 00               	movl	$0x9, %esi
  69f965: ff 15 cd 7f 45 00            	callq	*0x457fcd(%rip)         # 0xaf7938 ; ELF relocation: PyUnicode_FromStringAndSize
  69f96b: 48 85 c0                     	testq	%rax, %rax
  69f96e: 0f 84 9f 01 00 00            	je	0x69fb13 <PyInit_pyo3_async_runtimes+0x283>
  69f974: 49 89 c6                     	movq	%rax, %r14
  69f977: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69f97c: 48 8d 74 24 50               	leaq	0x50(%rsp), %rsi
  69f981: 48 89 c2                     	movq	%rax, %rdx
  69f984: 48 89 d9                     	movq	%rbx, %rcx
  69f987: e8 e4 d1 ff ff               	callq	0x69cb70 <PyInit__native+0x420470>
  69f98c: 4c 8b 3d 15 7f 45 00         	movq	0x457f15(%rip), %r15    # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69f993: 48 89 df                     	movq	%rbx, %rdi
  69f996: 41 ff d7                     	callq	*%r15
  69f999: 4c 89 f7                     	movq	%r14, %rdi
  69f99c: 41 ff d7                     	callq	*%r15
  69f99f: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  69f9a4: 0f 85 97 00 00 00            	jne	0x69fa41 <PyInit_pyo3_async_runtimes+0x1b1>
  69f9aa: 48 8b 44 24 10               	movq	0x10(%rsp), %rax
  69f9af: 0f 10 54 24 18               	movups	0x18(%rsp), %xmm2
  69f9b4: f3 0f 6f 4c 24 28            	movdqu	0x28(%rsp), %xmm1
  69f9ba: 48 8b 54 24 38               	movq	0x38(%rsp), %rdx
  69f9bf: 48 8b 7c 24 40               	movq	0x40(%rsp), %rdi
  69f9c4: f3 0f 7e 44 24 48            	movq	0x48(%rsp), %xmm0
  69f9ca: b9 01 00 00 00               	movl	$0x1, %ecx
  69f9cf: e9 d4 00 00 00               	jmp	0x69faa8 <PyInit_pyo3_async_runtimes+0x218>
  69f9d4: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69f9d9: e8 72 18 ff ff               	callq	0x691250 <PyInit__native+0x414b50>
  69f9de: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  69f9e3: 0f 85 3b 01 00 00            	jne	0x69fb24 <PyInit_pyo3_async_runtimes+0x294>
  69f9e9: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  69f9ee: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  69f9f3: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  69f9f8: 0f 10 5c 24 40               	movups	0x40(%rsp), %xmm3
  69f9fd: 0f 29 9c 24 80 00 00 00      	movaps	%xmm3, 0x80(%rsp)
  69fa05: 0f 29 54 24 70               	movaps	%xmm2, 0x70(%rsp)
  69fa0a: 0f 29 4c 24 60               	movaps	%xmm1, 0x60(%rsp)
  69fa0f: 0f 29 44 24 50               	movaps	%xmm0, 0x50(%rsp)
  69fa14: 48 8b 44 24 50               	movq	0x50(%rsp), %rax
  69fa19: 0f 10 54 24 58               	movups	0x58(%rsp), %xmm2
  69fa1e: f3 0f 6f 4c 24 68            	movdqu	0x68(%rsp), %xmm1
  69fa24: 48 8b 54 24 78               	movq	0x78(%rsp), %rdx
  69fa29: 48 8b bc 24 80 00 00 00      	movq	0x80(%rsp), %rdi
  69fa31: f3 0f 7e 84 24 88 00 00 00   	movq	0x88(%rsp), %xmm0
  69fa3a: b9 01 00 00 00               	movl	$0x1, %ecx
  69fa3f: eb 67                        	jmp	0x69faa8 <PyInit_pyo3_async_runtimes+0x218>
  69fa41: 40 b6 01                     	movb	$0x1, %sil
  69fa44: 31 c9                        	xorl	%ecx, %ecx
  69fa46: eb 62                        	jmp	0x69faaa <PyInit_pyo3_async_runtimes+0x21a>
  69fa48: 4c 8b 3d 91 7e 45 00         	movq	0x457e91(%rip), %r15    # 0xaf78e0 ; ELF relocation: _Py_IncRef
  69fa4f: 4c 89 f7                     	movq	%r14, %rdi
  69fa52: 41 ff d7                     	callq	*%r15
  69fa55: 48 89 df                     	movq	%rbx, %rdi
  69fa58: 41 ff d7                     	callq	*%r15
  69fa5b: 48 89 5c 24 08               	movq	%rbx, 0x8(%rsp)
  69fa60: 4c 89 74 24 10               	movq	%r14, 0x10(%rsp)
  69fa65: bf 10 00 00 00               	movl	$0x10, %edi
  69fa6a: ff 15 10 7e 45 00            	callq	*0x457e10(%rip)         # 0xaf7880 ; ELF relocation: malloc
  69fa70: 48 85 c0                     	testq	%rax, %rax
  69fa73: 0f 84 ba 00 00 00            	je	0x69fb33 <PyInit_pyo3_async_runtimes+0x2a3>
  69fa79: 48 89 18                     	movq	%rbx, (%rax)
  69fa7c: 4c 89 70 08                  	movq	%r14, 0x8(%rax)
  69fa80: b9 03 00 00 00               	movl	$0x3, %ecx
  69fa85: 66 0f 6e c1                  	movd	%ecx, %xmm0
  69fa89: 66 48 0f 6e c8               	movq	%rax, %xmm1
  69fa8e: 66 0f 73 f9 08               	pslldq	$0x8, %xmm1             # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  69fa93: 0f 28 15 36 c5 a0 ff         	movaps	-0x5f3aca(%rip), %xmm2  # 0xabfd0
  69fa9a: b9 01 00 00 00               	movl	$0x1, %ecx
  69fa9f: 48 8d 15 8a 95 43 00         	leaq	0x43958a(%rip), %rdx    # 0xad9030 ; ELF relocation: local pointer 0x693030
  69faa6: 31 c0                        	xorl	%eax, %eax
  69faa8: 31 f6                        	xorl	%esi, %esi
  69faaa: 0f 11 54 24 18               	movups	%xmm2, 0x18(%rsp)
  69faaf: f3 0f 7f 4c 24 28            	movdqu	%xmm1, 0x28(%rsp)
  69fab5: 48 89 54 24 38               	movq	%rdx, 0x38(%rsp)
  69faba: 48 89 7c 24 40               	movq	%rdi, 0x40(%rsp)
  69fabf: 66 0f d6 44 24 48            	movq	%xmm0, 0x48(%rsp)
  69fac5: 48 89 4c 24 08               	movq	%rcx, 0x8(%rsp)
  69faca: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  69facf: 31 db                        	xorl	%ebx, %ebx
  69fad1: 40 84 f6                     	testb	%sil, %sil
  69fad4: 75 0f                        	jne	0x69fae5 <PyInit_pyo3_async_runtimes+0x255>
  69fad6: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  69fadb: bb ff ff ff ff               	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
  69fae0: e8 1b 1d ff ff               	callq	0x691800 <PyInit__native+0x415100>
  69fae5: 49 ff 0c 24                  	decq	(%r12)
  69fae9: 89 d8                        	movl	%ebx, %eax
  69faeb: 48 81 c4 e8 00 00 00         	addq	$0xe8, %rsp
  69faf2: 5b                           	popq	%rbx
  69faf3: 41 5c                        	popq	%r12
  69faf5: 41 5e                        	popq	%r14
  69faf7: 41 5f                        	popq	%r15
  69faf9: c3                           	retq
  69fafa: e8 81 45 ff ff               	callq	0x694080 <PyInit__native+0x417980>
  69faff: e9 ac 00 00 00               	jmp	0x69fbb0 <PyInit_pyo3_async_runtimes+0x320>
  69fb04: 48 8d 7c 24 07               	leaq	0x7(%rsp), %rdi
  69fb09: e8 b2 00 00 00               	callq	0x69fbc0 <PyInit_pyo3_async_runtimes+0x330>
  69fb0e: e9 36 fe ff ff               	jmp	0x69f949 <PyInit_pyo3_async_runtimes+0xb9>
  69fb13: 48 8d 3d ee 96 43 00         	leaq	0x4396ee(%rip), %rdi    # 0xad9208 ; ELF relocation: local pointer 0xd4bd6
  69fb1a: e8 a1 1c ff ff               	callq	0x6917c0 <PyInit__native+0x4150c0>
  69fb1f: e9 8c 00 00 00               	jmp	0x69fbb0 <PyInit_pyo3_async_runtimes+0x320>
  69fb24: 48 8d 7c 24 50               	leaq	0x50(%rsp), %rdi
  69fb29: e8 62 19 ff ff               	callq	0x691490 <PyInit__native+0x414d90>
  69fb2e: e9 e1 fe ff ff               	jmp	0x69fa14 <PyInit_pyo3_async_runtimes+0x184>
  69fb33: bf 08 00 00 00               	movl	$0x8, %edi
  69fb38: be 10 00 00 00               	movl	$0x10, %esi
  69fb3d: e8 30 66 cb ff               	callq	0x356172 <PyInit__native+0xd9a72>
  69fb42: eb 6c                        	jmp	0x69fbb0 <PyInit_pyo3_async_runtimes+0x320>
  69fb44: 49 89 c7                     	movq	%rax, %r15
  69fb47: eb 31                        	jmp	0x69fb7a <PyInit_pyo3_async_runtimes+0x2ea>
  69fb49: 49 89 c7                     	movq	%rax, %r15
  69fb4c: 48 89 df                     	movq	%rbx, %rdi
  69fb4f: ff 15 53 7d 45 00            	callq	*0x457d53(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69fb55: eb 1a                        	jmp	0x69fb71 <PyInit_pyo3_async_runtimes+0x2e1>
  69fb57: 49 89 c7                     	movq	%rax, %r15
  69fb5a: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69fb5f: e8 cc 34 ff ff               	callq	0x693030 <PyInit__native+0x416930>
  69fb64: eb 14                        	jmp	0x69fb7a <PyInit_pyo3_async_runtimes+0x2ea>
  69fb66: e8 71 75 ed ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  69fb6b: 49 89 c7                     	movq	%rax, %r15
  69fb6e: 49 89 de                     	movq	%rbx, %r14
  69fb71: 4c 89 f7                     	movq	%r14, %rdi
  69fb74: ff 15 2e 7d 45 00            	callq	*0x457d2e(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69fb7a: 4c 89 ff                     	movq	%r15, %rdi
  69fb7d: e8 14 77 19 00               	callq	0x837296 <PyInit_pyo3_async_runtimes+0x197a06>
  69fb82: 48 8d 9c 24 a8 00 00 00      	leaq	0xa8(%rsp), %rbx
  69fb8a: 48 89 df                     	movq	%rbx, %rdi
  69fb8d: 48 89 c6                     	movq	%rax, %rsi
  69fb90: e8 3b 54 ff ff               	callq	0x694fd0 <PyInit__native+0x4188d0>
  69fb95: 48 89 df                     	movq	%rbx, %rdi
  69fb98: e9 3e ff ff ff               	jmp	0x69fadb <PyInit_pyo3_async_runtimes+0x24b>
  69fb9d: 49 ff 0c 24                  	decq	(%r12)
  69fba1: eb 00                        	jmp	0x69fba3 <PyInit_pyo3_async_runtimes+0x313>
  69fba3: 48 8d bc 24 98 00 00 00      	leaq	0x98(%rsp), %rdi
  69fbab: e8 c0 dd ff ff               	callq	0x69d970 <PyInit__native+0x421270>
  69fbb0: 0f 0b                        	ud2
  69fbb2: e8 25 75 ed ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
