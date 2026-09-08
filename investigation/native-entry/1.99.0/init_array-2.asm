
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  879d40: e9 1b 31 03 00               	jmp	0x8ace60 <PyInit_pyo3_async_runtimes+0x213800>
  879d45: cc                           	int3
  879d46: cc                           	int3
  879d47: cc                           	int3
  879d48: cc                           	int3
  879d49: cc                           	int3
  879d4a: cc                           	int3
  879d4b: cc                           	int3
  879d4c: cc                           	int3
  879d4d: cc                           	int3
  879d4e: cc                           	int3
  879d4f: cc                           	int3
  879d50: c3                           	retq
  879d51: cc                           	int3
  879d52: cc                           	int3
  879d53: cc                           	int3
  879d54: cc                           	int3
  879d55: cc                           	int3
  879d56: cc                           	int3
  879d57: cc                           	int3
  879d58: cc                           	int3
  879d59: cc                           	int3
  879d5a: cc                           	int3
  879d5b: cc                           	int3
  879d5c: cc                           	int3
  879d5d: cc                           	int3
  879d5e: cc                           	int3
  879d5f: cc                           	int3
  879d60: 41 54                        	pushq	%r12
  879d62: 55                           	pushq	%rbp
  879d63: 48 89 fd                     	movq	%rdi, %rbp
  879d66: 53                           	pushq	%rbx
  879d67: 48 83 ec 10                  	subq	$0x10, %rsp
  879d6b: e8 00 50 03 00               	callq	0x8aed70 <PyInit_pyo3_async_runtimes+0x215710>
  879d70: 48 85 c0                     	testq	%rax, %rax
  879d73: 74 79                        	je	0x879dee <PyInit_pyo3_async_runtimes+0x1e078e>
  879d75: ba 10 00 00 20               	movl	$0x20000010, %edx       # imm = 0x20000010
  879d7a: 48 89 e6                     	movq	%rsp, %rsi
  879d7d: 48 89 ef                     	movq	%rbp, %rdi
  879d80: 48 89 c3                     	movq	%rax, %rbx
  879d83: e8 98 f1 ff ff               	callq	0x878f20 <PyInit_pyo3_async_runtimes+0x1df8c0>
  879d88: 85 c0                        	testl	%eax, %eax
  879d8a: 74 3c                        	je	0x879dc8 <PyInit_pyo3_async_runtimes+0x1e0768>
  879d8c: 48 8b 33                     	movq	(%rbx), %rsi
  879d8f: 48 89 e7                     	movq	%rsp, %rdi
  879d92: e8 c9 02 00 00               	callq	0x87a060 <PyInit_pyo3_async_runtimes+0x1e0a00>
  879d97: 85 c0                        	testl	%eax, %eax
  879d99: 74 2d                        	je	0x879dc8 <PyInit_pyo3_async_runtimes+0x1e0768>
  879d9b: 48 8b 73 08                  	movq	0x8(%rbx), %rsi
  879d9f: 48 89 e7                     	movq	%rsp, %rdi
  879da2: e8 b9 02 00 00               	callq	0x87a060 <PyInit_pyo3_async_runtimes+0x1e0a00>
  879da7: 85 c0                        	testl	%eax, %eax
  879da9: 74 1d                        	je	0x879dc8 <PyInit_pyo3_async_runtimes+0x1e0768>
  879dab: 48 89 e7                     	movq	%rsp, %rdi
  879dae: e8 6d ec ff ff               	callq	0x878a20 <PyInit_pyo3_async_runtimes+0x1df3c0>
  879db3: 48 85 c0                     	testq	%rax, %rax
  879db6: 75 10                        	jne	0x879dc8 <PyInit_pyo3_async_runtimes+0x1e0768>
  879db8: 48 83 c4 10                  	addq	$0x10, %rsp
  879dbc: 48 89 d8                     	movq	%rbx, %rax
  879dbf: 5b                           	popq	%rbx
  879dc0: 5d                           	popq	%rbp
  879dc1: 41 5c                        	popq	%r12
  879dc3: c3                           	retq
  879dc4: 0f 1f 40 00                  	nopl	(%rax)
  879dc8: bf 1a 00 00 00               	movl	$0x1a, %edi
  879dcd: 41 b8 2e 00 00 00            	movl	$0x2e, %r8d
  879dd3: 48 8d 0d ee f5 8c ff         	leaq	-0x730a12(%rip), %rcx   # 0x1493c8
  879dda: 31 f6                        	xorl	%esi, %esi
  879ddc: ba 64 00 00 00               	movl	$0x64, %edx
  879de1: e8 ba 1b 00 00               	callq	0x87b9a0 <PyInit_pyo3_async_runtimes+0x1e2340>
  879de6: 48 89 df                     	movq	%rbx, %rdi
  879de9: e8 52 4f 03 00               	callq	0x8aed40 <PyInit_pyo3_async_runtimes+0x2156e0>
  879dee: 48 83 c4 10                  	addq	$0x10, %rsp
  879df2: 31 db                        	xorl	%ebx, %ebx
  879df4: 48 89 d8                     	movq	%rbx, %rax
  879df7: 5b                           	popq	%rbx
  879df8: 5d                           	popq	%rbp
  879df9: 41 5c                        	popq	%r12
  879dfb: c3                           	retq
  879dfc: cc                           	int3
  879dfd: cc                           	int3
  879dfe: cc                           	int3
  879dff: cc                           	int3
  879e00: 55                           	pushq	%rbp
  879e01: 48 89 f2                     	movq	%rsi, %rdx
  879e04: 48 89 fe                     	movq	%rdi, %rsi
  879e07: 53                           	pushq	%rbx
  879e08: 48 83 ec 18                  	subq	$0x18, %rsp
  879e0c: 48 89 e7                     	movq	%rsp, %rdi
  879e0f: e8 cc eb ff ff               	callq	0x8789e0 <PyInit_pyo3_async_runtimes+0x1df380>
  879e14: 48 89 e7                     	movq	%rsp, %rdi
  879e17: e8 44 ff ff ff               	callq	0x879d60 <PyInit_pyo3_async_runtimes+0x1e0700>
  879e1c: 48 89 c3                     	movq	%rax, %rbx
  879e1f: 48 85 c0                     	testq	%rax, %rax
  879e22: 74 1c                        	je	0x879e40 <PyInit_pyo3_async_runtimes+0x1e07e0>
  879e24: 48 89 e7                     	movq	%rsp, %rdi
  879e27: e8 f4 eb ff ff               	callq	0x878a20 <PyInit_pyo3_async_runtimes+0x1df3c0>
  879e2c: 48 85 c0                     	testq	%rax, %rax
  879e2f: 75 0f                        	jne	0x879e40 <PyInit_pyo3_async_runtimes+0x1e07e0>
  879e31: 48 83 c4 18                  	addq	$0x18, %rsp
  879e35: 48 89 d8                     	movq	%rbx, %rax
  879e38: 5b                           	popq	%rbx
  879e39: 5d                           	popq	%rbp
  879e3a: c3                           	retq
  879e3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  879e40: 41 b8 3a 00 00 00            	movl	$0x3a, %r8d
  879e46: 48 8d 0d 7b f5 8c ff         	leaq	-0x730a85(%rip), %rcx   # 0x1493c8
  879e4d: ba 64 00 00 00               	movl	$0x64, %edx
  879e52: 31 f6                        	xorl	%esi, %esi
  879e54: bf 1a 00 00 00               	movl	$0x1a, %edi
  879e59: e8 42 1b 00 00               	callq	0x87b9a0 <PyInit_pyo3_async_runtimes+0x1e2340>
  879e5e: 48 89 df                     	movq	%rbx, %rdi
  879e61: 31 db                        	xorl	%ebx, %ebx
  879e63: e8 d8 4e 03 00               	callq	0x8aed40 <PyInit_pyo3_async_runtimes+0x2156e0>
  879e68: 48 83 c4 18                  	addq	$0x18, %rsp
  879e6c: 48 89 d8                     	movq	%rbx, %rax
  879e6f: 5b                           	popq	%rbx
  879e70: 5d                           	popq	%rbp
  879e71: c3                           	retq
  879e72: cc                           	int3
  879e73: cc                           	int3
  879e74: cc                           	int3
  879e75: cc                           	int3
  879e76: cc                           	int3
  879e77: cc                           	int3
  879e78: cc                           	int3
  879e79: cc                           	int3
  879e7a: cc                           	int3
  879e7b: cc                           	int3
  879e7c: cc                           	int3
  879e7d: cc                           	int3
  879e7e: cc                           	int3
  879e7f: cc                           	int3
  879e80: 41 54                        	pushq	%r12
  879e82: ba 10 00 00 20               	movl	$0x20000010, %edx       # imm = 0x20000010
  879e87: 55                           	pushq	%rbp
  879e88: 48 89 f5                     	movq	%rsi, %rbp
  879e8b: 53                           	pushq	%rbx
  879e8c: 48 89 fb                     	movq	%rdi, %rbx
  879e8f: 48 83 ec 30                  	subq	$0x30, %rsp
  879e93: 48 89 e6                     	movq	%rsp, %rsi
  879e96: e8 05 e8 ff ff               	callq	0x8786a0 <PyInit_pyo3_async_runtimes+0x1df040>
  879e9b: 85 c0                        	testl	%eax, %eax
  879e9d: 74 10                        	je	0x879eaf <PyInit_pyo3_async_runtimes+0x1e084f>
  879e9f: 48 8b 75 00                  	movq	(%rbp), %rsi
  879ea3: 48 89 e7                     	movq	%rsp, %rdi
  879ea6: e8 75 02 00 00               	callq	0x87a120 <PyInit_pyo3_async_runtimes+0x1e0ac0>
  879eab: 85 c0                        	testl	%eax, %eax
  879ead: 75 31                        	jne	0x879ee0 <PyInit_pyo3_async_runtimes+0x1e0880>
  879eaf: 41 b8 47 00 00 00            	movl	$0x47, %r8d
  879eb5: 48 8d 0d 0c f5 8c ff         	leaq	-0x730af4(%rip), %rcx   # 0x1493c8
  879ebc: ba 69 00 00 00               	movl	$0x69, %edx
  879ec1: 31 f6                        	xorl	%esi, %esi
  879ec3: bf 1a 00 00 00               	movl	$0x1a, %edi
  879ec8: e8 d3 1a 00 00               	callq	0x87b9a0 <PyInit_pyo3_async_runtimes+0x1e2340>
  879ecd: 48 83 c4 30                  	addq	$0x30, %rsp
  879ed1: 31 c0                        	xorl	%eax, %eax
  879ed3: 5b                           	popq	%rbx
  879ed4: 5d                           	popq	%rbp
  879ed5: 41 5c                        	popq	%r12
  879ed7: c3                           	retq
  879ed8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  879ee0: 48 8b 75 08                  	movq	0x8(%rbp), %rsi
  879ee4: 48 89 e7                     	movq	%rsp, %rdi
  879ee7: e8 34 02 00 00               	callq	0x87a120 <PyInit_pyo3_async_runtimes+0x1e0ac0>
  879eec: 85 c0                        	testl	%eax, %eax
  879eee: 74 bf                        	je	0x879eaf <PyInit_pyo3_async_runtimes+0x1e084f>
  879ef0: 48 89 df                     	movq	%rbx, %rdi
  879ef3: e8 a8 e1 ff ff               	callq	0x8780a0 <PyInit_pyo3_async_runtimes+0x1dea40>
  879ef8: 85 c0                        	testl	%eax, %eax
  879efa: 74 b3                        	je	0x879eaf <PyInit_pyo3_async_runtimes+0x1e084f>
  879efc: 48 83 c4 30                  	addq	$0x30, %rsp
  879f00: b8 01 00 00 00               	movl	$0x1, %eax
  879f05: 5b                           	popq	%rbx
  879f06: 5d                           	popq	%rbp
  879f07: 41 5c                        	popq	%r12
  879f09: c3                           	retq
  879f0a: cc                           	int3
  879f0b: cc                           	int3
  879f0c: cc                           	int3
  879f0d: cc                           	int3
  879f0e: cc                           	int3
  879f0f: cc                           	int3
  879f10: 41 55                        	pushq	%r13
  879f12: 49 89 f5                     	movq	%rsi, %r13
  879f15: 41 54                        	pushq	%r12
  879f17: 49 89 fc                     	movq	%rdi, %r12
  879f1a: 55                           	pushq	%rbp
  879f1b: 48 89 d5                     	movq	%rdx, %rbp
  879f1e: 53                           	pushq	%rbx
  879f1f: 48 83 ec 38                  	subq	$0x38, %rsp
  879f23: 48 89 e7                     	movq	%rsp, %rdi
  879f26: 48 89 e3                     	movq	%rsp, %rbx
  879f29: e8 72 e0 ff ff               	callq	0x877fa0 <PyInit_pyo3_async_runtimes+0x1de940>
  879f2e: 31 f6                        	xorl	%esi, %esi
  879f30: 48 89 e7                     	movq	%rsp, %rdi
  879f33: e8 78 e0 ff ff               	callq	0x877fb0 <PyInit_pyo3_async_runtimes+0x1de950>
  879f38: 85 c0                        	testl	%eax, %eax
  879f3a: 74 0f                        	je	0x879f4b <PyInit_pyo3_async_runtimes+0x1e08eb>
  879f3c: 48 89 ee                     	movq	%rbp, %rsi
  879f3f: 48 89 e7                     	movq	%rsp, %rdi
