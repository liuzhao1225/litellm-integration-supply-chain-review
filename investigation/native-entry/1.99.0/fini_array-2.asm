
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  8c8c90: 55                           	pushq	%rbp
  8c8c91: 48 8d 2d 08 99 22 00         	leaq	0x229908(%rip), %rbp    # 0xaf25a0
  8c8c98: 53                           	pushq	%rbx
  8c8c99: 48 89 ef                     	movq	%rbp, %rdi
  8c8c9c: 48 83 ec 08                  	subq	$0x8, %rsp
  8c8ca0: e8 fb 10 03 00               	callq	0x8f9da0 <PyInit_pyo3_async_runtimes+0x260740>
  8c8ca5: 48 8b 1d 34 99 22 00         	movq	0x229934(%rip), %rbx    # 0xaf25e0
  8c8cac: 48 85 db                     	testq	%rbx, %rbx
  8c8caf: 74 28                        	je	0x8c8cd9 <PyInit_pyo3_async_runtimes+0x22f679>
  8c8cb1: 80 3b 01                     	cmpb	$0x1, (%rbx)
  8c8cb4: 0f 85 c5 ff ff ff            	jne	0x8c8c7f <PyInit_pyo3_async_runtimes+0x22f61f>
  8c8cba: 48 8b bb 48 01 00 00         	movq	0x148(%rbx), %rdi
  8c8cc1: e8 94 7b 1a 00               	callq	0xa7085a <PyInit_pyo3_async_runtimes+0x3d71fa>
  8c8cc6: 48 89 df                     	movq	%rbx, %rdi
  8c8cc9: e8 22 aa 02 00               	callq	0x8f36f0 <PyInit_pyo3_async_runtimes+0x25a090>
  8c8cce: 48 c7 05 07 99 22 00 00 00 00 00     	movq	$0x0, 0x229907(%rip) # 0xaf25e0
  8c8cd9: 48 83 c4 08                  	addq	$0x8, %rsp
  8c8cdd: 48 89 ef                     	movq	%rbp, %rdi
  8c8ce0: 5b                           	popq	%rbx
  8c8ce1: 5d                           	popq	%rbp
  8c8ce2: e9 f9 10 03 00               	jmp	0x8f9de0 <PyInit_pyo3_async_runtimes+0x260780>
  8c8ce7: cc                           	int3
  8c8ce8: cc                           	int3
  8c8ce9: cc                           	int3
  8c8cea: cc                           	int3
  8c8ceb: cc                           	int3
  8c8cec: cc                           	int3
  8c8ced: cc                           	int3
  8c8cee: cc                           	int3
  8c8cef: cc                           	int3
  8c8cf0: 48 85 ff                     	testq	%rdi, %rdi
  8c8cf3: 74 23                        	je	0x8c8d18 <PyInit_pyo3_async_runtimes+0x22f6b8>
  8c8cf5: 53                           	pushq	%rbx
  8c8cf6: 48 89 fb                     	movq	%rdi, %rbx
  8c8cf9: 48 8b 3f                     	movq	(%rdi), %rdi
  8c8cfc: e8 4f 0a fc ff               	callq	0x889750 <PyInit_pyo3_async_runtimes+0x1f00f0>
  8c8d01: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8c8d05: e8 46 0a fc ff               	callq	0x889750 <PyInit_pyo3_async_runtimes+0x1f00f0>
  8c8d0a: 48 89 df                     	movq	%rbx, %rdi
  8c8d0d: 5b                           	popq	%rbx
  8c8d0e: e9 dd a9 02 00               	jmp	0x8f36f0 <PyInit_pyo3_async_runtimes+0x25a090>
  8c8d13: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  8c8d18: c3                           	retq
  8c8d19: cc                           	int3
  8c8d1a: cc                           	int3
  8c8d1b: cc                           	int3
  8c8d1c: cc                           	int3
  8c8d1d: cc                           	int3
  8c8d1e: cc                           	int3
  8c8d1f: cc                           	int3
  8c8d20: 53                           	pushq	%rbx
  8c8d21: bf 18 00 00 00               	movl	$0x18, %edi
  8c8d26: e8 25 a9 02 00               	callq	0x8f3650 <PyInit_pyo3_async_runtimes+0x259ff0>
  8c8d2b: 48 85 c0                     	testq	%rax, %rax
  8c8d2e: 74 38                        	je	0x8c8d68 <PyInit_pyo3_async_runtimes+0x22f708>
  8c8d30: 48 89 c3                     	movq	%rax, %rbx
  8c8d33: e8 88 82 fd ff               	callq	0x8a0fc0 <PyInit_pyo3_async_runtimes+0x207960>
  8c8d38: 48 89 03                     	movq	%rax, (%rbx)
  8c8d3b: 48 85 c0                     	testq	%rax, %rax
  8c8d3e: 74 20                        	je	0x8c8d60 <PyInit_pyo3_async_runtimes+0x22f700>
  8c8d40: e8 7b 82 fd ff               	callq	0x8a0fc0 <PyInit_pyo3_async_runtimes+0x207960>
  8c8d45: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8c8d49: 48 85 c0                     	testq	%rax, %rax
  8c8d4c: 74 12                        	je	0x8c8d60 <PyInit_pyo3_async_runtimes+0x22f700>
  8c8d4e: 48 89 d8                     	movq	%rbx, %rax
  8c8d51: c7 43 10 1f 00 00 00         	movl	$0x1f, 0x10(%rbx)
  8c8d58: 5b                           	popq	%rbx
  8c8d59: c3                           	retq
  8c8d5a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8c8d60: 48 89 df                     	movq	%rbx, %rdi
  8c8d63: e8 88 ff ff ff               	callq	0x8c8cf0 <PyInit_pyo3_async_runtimes+0x22f690>
  8c8d68: 31 db                        	xorl	%ebx, %ebx
  8c8d6a: 48 89 d8                     	movq	%rbx, %rax
  8c8d6d: 5b                           	popq	%rbx
  8c8d6e: c3                           	retq
  8c8d6f: cc                           	int3
  8c8d70: c7 47 10 1f 00 00 00         	movl	$0x1f, 0x10(%rdi)
  8c8d77: c3                           	retq
  8c8d78: cc                           	int3
  8c8d79: cc                           	int3
  8c8d7a: cc                           	int3
  8c8d7b: cc                           	int3
  8c8d7c: cc                           	int3
  8c8d7d: cc                           	int3
  8c8d7e: cc                           	int3
  8c8d7f: cc                           	int3
  8c8d80: 41 57                        	pushq	%r15
  8c8d82: 41 56                        	pushq	%r14
  8c8d84: 41 55                        	pushq	%r13
  8c8d86: 49 89 fd                     	movq	%rdi, %r13
  8c8d89: 41 54                        	pushq	%r12
  8c8d8b: 4d 89 c4                     	movq	%r8, %r12
  8c8d8e: 55                           	pushq	%rbp
  8c8d8f: 48 89 cd                     	movq	%rcx, %rbp
  8c8d92: 53                           	pushq	%rbx
  8c8d93: 48 89 f3                     	movq	%rsi, %rbx
  8c8d96: 48 83 ec 18                  	subq	$0x18, %rsp
  8c8d9a: 8b 46 10                     	movl	0x10(%rsi), %eax
  8c8d9d: 48 8b 3e                     	movq	(%rsi), %rdi
  8c8da0: 83 c0 01                     	addl	$0x1, %eax
  8c8da3: 89 46 10                     	movl	%eax, 0x10(%rsi)
  8c8da6: 83 f8 20                     	cmpl	$0x20, %eax
  8c8da9: 74 75                        	je	0x8c8e20 <PyInit_pyo3_async_runtimes+0x22f7c0>
  8c8dab: 48 89 fa                     	movq	%rdi, %rdx
  8c8dae: 48 89 fe                     	movq	%rdi, %rsi
  8c8db1: e8 5a d0 fd ff               	callq	0x8a5e10 <PyInit_pyo3_async_runtimes+0x20c7b0>
  8c8db6: 85 c0                        	testl	%eax, %eax
  8c8db8: 75 1e                        	jne	0x8c8dd8 <PyInit_pyo3_async_runtimes+0x22f778>
  8c8dba: c7 43 10 1f 00 00 00         	movl	$0x1f, 0x10(%rbx)
  8c8dc1: 48 83 c4 18                  	addq	$0x18, %rsp
  8c8dc5: 31 c0                        	xorl	%eax, %eax
  8c8dc7: 5b                           	popq	%rbx
  8c8dc8: 5d                           	popq	%rbp
  8c8dc9: 41 5c                        	popq	%r12
  8c8dcb: 41 5d                        	popq	%r13
  8c8dcd: 41 5e                        	popq	%r14
  8c8dcf: 41 5f                        	popq	%r15
  8c8dd1: c3                           	retq
  8c8dd2: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8c8dd8: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8c8ddc: 4d 89 e0                     	movq	%r12, %r8
  8c8ddf: 48 89 e9                     	movq	%rbp, %rcx
  8c8de2: 48 89 fa                     	movq	%rdi, %rdx
  8c8de5: 48 89 fe                     	movq	%rdi, %rsi
  8c8de8: e8 23 d0 fd ff               	callq	0x8a5e10 <PyInit_pyo3_async_runtimes+0x20c7b0>
  8c8ded: 85 c0                        	testl	%eax, %eax
  8c8def: 74 c9                        	je	0x8c8dba <PyInit_pyo3_async_runtimes+0x22f75a>
  8c8df1: 48 8b 13                     	movq	(%rbx), %rdx
  8c8df4: 4d 89 e0                     	movq	%r12, %r8
  8c8df7: 48 89 e9                     	movq	%rbp, %rcx
  8c8dfa: 4c 89 ee                     	movq	%r13, %rsi
  8c8dfd: 4c 89 ef                     	movq	%r13, %rdi
  8c8e00: e8 0b d0 fd ff               	callq	0x8a5e10 <PyInit_pyo3_async_runtimes+0x20c7b0>
  8c8e05: 85 c0                        	testl	%eax, %eax
  8c8e07: 0f 95 c0                     	setne	%al
  8c8e0a: 48 83 c4 18                  	addq	$0x18, %rsp
  8c8e0e: 5b                           	popq	%rbx
  8c8e0f: 0f b6 c0                     	movzbl	%al, %eax
  8c8e12: 5d                           	popq	%rbp
  8c8e13: 41 5c                        	popq	%r12
  8c8e15: 41 5d                        	popq	%r13
  8c8e17: 41 5e                        	popq	%r14
  8c8e19: 41 5f                        	popq	%r15
  8c8e1b: c3                           	retq
  8c8e1c: 0f 1f 40 00                  	nopl	(%rax)
  8c8e20: 4c 8d 79 18                  	leaq	0x18(%rcx), %r15
  8c8e24: 49 89 d6                     	movq	%rdx, %r14
  8c8e27: be 01 00 00 00               	movl	$0x1, %esi
  8c8e2c: 4c 89 fa                     	movq	%r15, %rdx
  8c8e2f: e8 9c cd ff ff               	callq	0x8c5bd0 <PyInit_pyo3_async_runtimes+0x22c570>
  8c8e34: 85 c0                        	testl	%eax, %eax
  8c8e36: 74 16                        	je	0x8c8e4e <PyInit_pyo3_async_runtimes+0x22f7ee>
  8c8e38: 48 8b 33                     	movq	(%rbx), %rsi
  8c8e3b: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8c8e3f: 4c 89 e1                     	movq	%r12, %rcx
  8c8e42: 48 89 ea                     	movq	%rbp, %rdx
  8c8e45: e8 e6 bd fd ff               	callq	0x8a4c30 <PyInit_pyo3_async_runtimes+0x20b5d0>
  8c8e4a: 85 c0                        	testl	%eax, %eax
  8c8e4c: 75 2a                        	jne	0x8c8e78 <PyInit_pyo3_async_runtimes+0x22f818>
  8c8e4e: 41 b8 84 00 00 00            	movl	$0x84, %r8d
  8c8e54: 48 8d 0d 6d 11 88 ff         	leaq	-0x77ee93(%rip), %rcx   # 0x149fc8
  8c8e5b: ba 44 00 00 00               	movl	$0x44, %edx
  8c8e60: 31 f6                        	xorl	%esi, %esi
  8c8e62: bf 04 00 00 00               	movl	$0x4, %edi
  8c8e67: e8 34 2b fb ff               	callq	0x87b9a0 <PyInit_pyo3_async_runtimes+0x1e2340>
  8c8e6c: e9 49 ff ff ff               	jmp	0x8c8dba <PyInit_pyo3_async_runtimes+0x22f75a>
  8c8e71: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8c8e78: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8c8e7c: 48 8d 74 24 0c               	leaq	0xc(%rsp), %rsi
  8c8e81: 4d 89 e0                     	movq	%r12, %r8
  8c8e84: 48 89 e9                     	movq	%rbp, %rcx
  8c8e87: 48 89 fa                     	movq	%rdi, %rdx
  8c8e8a: e8 a1 cd ff ff               	callq	0x8c5c30 <PyInit_pyo3_async_runtimes+0x22c5d0>
  8c8e8f: 85 c0                        	testl	%eax, %eax
