
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  8cdbd0: 55                           	pushq	%rbp
  8cdbd1: 48 8d 2d 48 d5 22 00         	leaq	0x22d548(%rip), %rbp    # 0xafb120
  8cdbd8: 53                           	pushq	%rbx
  8cdbd9: 48 89 ef                     	movq	%rbp, %rdi
  8cdbdc: 48 83 ec 08                  	subq	$0x8, %rsp
  8cdbe0: e8 fb 48 03 00               	callq	0x9024e0 <PyInit_pyo3_async_runtimes+0x262c50>
  8cdbe5: 8b 05 1d d5 22 00            	movl	0x22d51d(%rip), %eax    # 0xafb108
  8cdbeb: 85 c0                        	testl	%eax, %eax
  8cdbed: 75 6b                        	jne	0x8cdc5a <PyInit_pyo3_async_runtimes+0x22e3ca>
  8cdbef: 48 8b 1d 62 d5 22 00         	movq	0x22d562(%rip), %rbx    # 0xafb158
  8cdbf6: c7 05 08 d5 22 00 01 00 00 00	movl	$0x1, 0x22d508(%rip)    # 0xafb108
  8cdc00: 48 85 db                     	testq	%rbx, %rbx
  8cdc03: 74 55                        	je	0x8cdc5a <PyInit_pyo3_async_runtimes+0x22e3ca>
  8cdc05: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8cdc10: 48 8d bb 50 01 00 00         	leaq	0x150(%rbx), %rdi
  8cdc17: e8 34 48 03 00               	callq	0x902450 <PyInit_pyo3_async_runtimes+0x262bc0>
  8cdc1c: 48 89 df                     	movq	%rbx, %rdi
  8cdc1f: e8 9c ff ff ff               	callq	0x8cdbc0 <PyInit_pyo3_async_runtimes+0x22e330>
  8cdc24: 48 8b 9b 40 01 00 00         	movq	0x140(%rbx), %rbx
  8cdc2b: 48 85 db                     	testq	%rbx, %rbx
  8cdc2e: 75 e0                        	jne	0x8cdc10 <PyInit_pyo3_async_runtimes+0x22e380>
  8cdc30: 48 8b 1d 21 d5 22 00         	movq	0x22d521(%rip), %rbx    # 0xafb158
  8cdc37: 48 85 db                     	testq	%rbx, %rbx
  8cdc3a: 74 1e                        	je	0x8cdc5a <PyInit_pyo3_async_runtimes+0x22e3ca>
  8cdc3c: 0f 1f 40 00                  	nopl	(%rax)
  8cdc40: 48 8b bb 38 01 00 00         	movq	0x138(%rbx), %rdi
  8cdc47: 48 8b 47 08                  	movq	0x8(%rdi), %rax
  8cdc4b: ff 50 08                     	callq	*0x8(%rax)
  8cdc4e: 48 8b 9b 40 01 00 00         	movq	0x140(%rbx), %rbx
  8cdc55: 48 85 db                     	testq	%rbx, %rbx
  8cdc58: 75 e6                        	jne	0x8cdc40 <PyInit_pyo3_async_runtimes+0x22e3b0>
  8cdc5a: 48 83 c4 08                  	addq	$0x8, %rsp
  8cdc5e: 48 89 ef                     	movq	%rbp, %rdi
  8cdc61: 5b                           	popq	%rbx
  8cdc62: 5d                           	popq	%rbp
  8cdc63: e9 b8 48 03 00               	jmp	0x902520 <PyInit_pyo3_async_runtimes+0x262c90>
  8cdc68: cc                           	int3
  8cdc69: cc                           	int3
  8cdc6a: cc                           	int3
  8cdc6b: cc                           	int3
  8cdc6c: cc                           	int3
  8cdc6d: cc                           	int3
  8cdc6e: cc                           	int3
  8cdc6f: cc                           	int3
  8cdc70: 53                           	pushq	%rbx
  8cdc71: bf 10 00 00 00               	movl	$0x10, %edi
  8cdc76: e8 15 e1 02 00               	callq	0x8fbd90 <PyInit_pyo3_async_runtimes+0x25c500>
  8cdc7b: 48 85 c0                     	testq	%rax, %rax
  8cdc7e: 74 78                        	je	0x8cdcf8 <PyInit_pyo3_async_runtimes+0x22e468>
  8cdc80: 83 3d 71 d4 22 00 01         	cmpl	$0x1, 0x22d471(%rip)    # 0xafb0f8
  8cdc87: 48 89 c3                     	movq	%rax, %rbx
  8cdc8a: 74 54                        	je	0x8cdce0 <PyInit_pyo3_async_runtimes+0x22e450>
  8cdc8c: e8 ff 4f 03 00               	callq	0x902c90 <PyInit_pyo3_async_runtimes+0x263400>
  8cdc91: 83 f8 01                     	cmpl	$0x1, %eax
  8cdc94: 74 6a                        	je	0x8cdd00 <PyInit_pyo3_async_runtimes+0x22e470>
  8cdc96: 48 8d 35 23 35 fc ff         	leaq	-0x3cadd(%rip), %rsi    # 0x8911c0 <PyInit_pyo3_async_runtimes+0x1f1930>
  8cdc9d: 48 8d 3d 14 d4 22 00         	leaq	0x22d414(%rip), %rdi    # 0xafb0b8
  8cdca4: e8 97 48 03 00               	callq	0x902540 <PyInit_pyo3_async_runtimes+0x262cb0>
  8cdca9: 48 8d 05 10 d4 22 00         	leaq	0x22d410(%rip), %rax    # 0xafb0c0
  8cdcb0: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8cdcb4: 48 83 78 08 00               	cmpq	$0x0, 0x8(%rax)
  8cdcb9: 74 35                        	je	0x8cdcf0 <PyInit_pyo3_async_runtimes+0x22e460>
  8cdcbb: 48 83 78 10 00               	cmpq	$0x0, 0x10(%rax)
  8cdcc0: 74 2e                        	je	0x8cdcf0 <PyInit_pyo3_async_runtimes+0x22e460>
  8cdcc2: 48 83 78 18 00               	cmpq	$0x0, 0x18(%rax)
  8cdcc7: 74 27                        	je	0x8cdcf0 <PyInit_pyo3_async_runtimes+0x22e460>
  8cdcc9: 48 8b 00                     	movq	(%rax), %rax
  8cdccc: 48 85 c0                     	testq	%rax, %rax
  8cdccf: 74 1f                        	je	0x8cdcf0 <PyInit_pyo3_async_runtimes+0x22e460>
  8cdcd1: 48 89 df                     	movq	%rbx, %rdi
  8cdcd4: ff d0                        	callq	*%rax
  8cdcd6: 83 f8 01                     	cmpl	$0x1, %eax
  8cdcd9: 75 15                        	jne	0x8cdcf0 <PyInit_pyo3_async_runtimes+0x22e460>
  8cdcdb: 48 89 d8                     	movq	%rbx, %rax
  8cdcde: 5b                           	popq	%rbx
  8cdcdf: c3                           	retq
  8cdce0: 48 8b 05 19 d4 22 00         	movq	0x22d419(%rip), %rax    # 0xafb100
  8cdce7: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8cdceb: 48 85 c0                     	testq	%rax, %rax
  8cdcee: 75 c4                        	jne	0x8cdcb4 <PyInit_pyo3_async_runtimes+0x22e424>
  8cdcf0: 48 89 df                     	movq	%rbx, %rdi
  8cdcf3: e8 38 e1 02 00               	callq	0x8fbe30 <PyInit_pyo3_async_runtimes+0x25c5a0>
  8cdcf8: 31 db                        	xorl	%ebx, %ebx
  8cdcfa: 48 89 d8                     	movq	%rbx, %rax
  8cdcfd: 5b                           	popq	%rbx
  8cdcfe: c3                           	retq
  8cdcff: 90                           	nop
  8cdd00: 48 8d 35 39 35 fc ff         	leaq	-0x3cac7(%rip), %rsi    # 0x891240 <PyInit_pyo3_async_runtimes+0x1f19b0>
  8cdd07: 48 8d 3d 5a d3 22 00         	leaq	0x22d35a(%rip), %rdi    # 0xafb068
  8cdd0e: e8 2d 48 03 00               	callq	0x902540 <PyInit_pyo3_async_runtimes+0x262cb0>
  8cdd13: 48 8d 05 66 d3 22 00         	leaq	0x22d366(%rip), %rax    # 0xafb080
  8cdd1a: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8cdd1e: eb 94                        	jmp	0x8cdcb4 <PyInit_pyo3_async_runtimes+0x22e424>
  8cdd20: e8 cb 01 1f 00               	callq	0xabdef0 <abort@plt>
  8cdd25: e8 c6 01 1f 00               	callq	0xabdef0 <abort@plt>
  8cdd2a: cc                           	int3
  8cdd2b: cc                           	int3
  8cdd2c: cc                           	int3
  8cdd2d: cc                           	int3
  8cdd2e: cc                           	int3
  8cdd2f: cc                           	int3
  8cdd30: 41 57                        	pushq	%r15
  8cdd32: 41 56                        	pushq	%r14
  8cdd34: 41 89 fe                     	movl	%edi, %r14d
  8cdd37: 41 55                        	pushq	%r13
  8cdd39: 49 89 f5                     	movq	%rsi, %r13
  8cdd3c: 41 54                        	pushq	%r12
  8cdd3e: 49 89 d4                     	movq	%rdx, %r12
  8cdd41: 55                           	pushq	%rbp
  8cdd42: 48 89 cd                     	movq	%rcx, %rbp
  8cdd45: 53                           	pushq	%rbx
  8cdd46: 48 81 ec 08 01 00 00         	subq	$0x108, %rsp            # imm = 0x108
  8cdd4d: 44 89 44 24 10               	movl	%r8d, 0x10(%rsp)
  8cdd52: e8 09 48 03 00               	callq	0x902560 <PyInit_pyo3_async_runtimes+0x262cd0>
  8cdd57: c7 44 24 18 01 00 00 00      	movl	$0x1, 0x18(%rsp)
  8cdd5f: 48 85 c0                     	testq	%rax, %rax
  8cdd62: 0f 84 b8 02 00 00            	je	0x8ce020 <PyInit_pyo3_async_runtimes+0x22e790>
  8cdd68: 48 89 c3                     	movq	%rax, %rbx
  8cdd6b: 4d 85 ed                     	testq	%r13, %r13
  8cdd6e: 0f 84 b1 ff ff ff            	je	0x8cdd25 <PyInit_pyo3_async_runtimes+0x22e495>
  8cdd74: 48 8d 84 24 d0 00 00 00      	leaq	0xd0(%rsp), %rax
  8cdd7c: 48 c7 84 24 d0 00 00 00 00 00 00 00  	movq	$0x0, 0xd0(%rsp)
  8cdd88: 48 89 c7                     	movq	%rax, %rdi
  8cdd8b: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  8cdd90: e8 ab 4b 03 00               	callq	0x902940 <PyInit_pyo3_async_runtimes+0x2630b0>
  8cdd95: 83 f8 01                     	cmpl	$0x1, %eax
  8cdd98: 75 1c                        	jne	0x8cddb6 <PyInit_pyo3_async_runtimes+0x22e526>
  8cdd9a: 48 8b 84 24 d0 00 00 00      	movq	0xd0(%rsp), %rax
  8cdda2: 48 39 83 30 01 00 00         	cmpq	%rax, 0x130(%rbx)
  8cdda9: 0f 84 09 02 00 00            	je	0x8cdfb8 <PyInit_pyo3_async_runtimes+0x22e728>
  8cddaf: 48 89 83 30 01 00 00         	movq	%rax, 0x130(%rbx)
  8cddb6: 48 8b bb 38 01 00 00         	movq	0x138(%rbx), %rdi
  8cddbd: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  8cddc1: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  8cddc6: 0f 29 44 24 30               	movaps	%xmm0, 0x30(%rsp)
  8cddcb: 48 85 ff                     	testq	%rdi, %rdi
  8cddce: 0f 84 51 ff ff ff            	je	0x8cdd25 <PyInit_pyo3_async_runtimes+0x22e495>
