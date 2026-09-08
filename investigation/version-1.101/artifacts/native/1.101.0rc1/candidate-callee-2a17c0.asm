
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  2a17c0: 41 57                        	pushq	%r15
  2a17c2: 41 56                        	pushq	%r14
  2a17c4: 53                           	pushq	%rbx
  2a17c5: 48 83 ec 20                  	subq	$0x20, %rsp
  2a17c9: 49 89 fe                     	movq	%rdi, %r14
  2a17cc: 48 8d 3d 55 2d 85 00         	leaq	0x852d55(%rip), %rdi    # 0xaf4528 ; ELF relocation: local pointer 0x0
  2a17d3: e8 28 9a 81 00               	callq	0xabb200 <__tls_get_addr@plt>
  2a17d8: 48 89 c3                     	movq	%rax, %rbx
  2a17db: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  2a17e2: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  2a17ed: ff 15 fd 2d 85 00            	callq	*0x852dfd(%rip)         # 0xaf45f0 ; ELF relocation: PyEval_SaveThread
  2a17f3: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  2a17f8: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  2a17fd: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  2a1802: 48 8b 0d 3f 62 85 00         	movq	0x85623f(%rip), %rcx    # 0xaf7a48
  2a1809: 48 83 f9 02                  	cmpq	$0x2, %rcx
  2a180d: 75 35                        	jne	0x2a1844 <PyInit__native+0x22d04>
  2a180f: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  2a1816: 4c 89 39                     	movq	%r15, (%rcx)
  2a1819: 48 89 c7                     	movq	%rax, %rdi
  2a181c: ff 15 76 2d 85 00            	callq	*0x852d76(%rip)         # 0xaf4598 ; ELF relocation: PyEval_RestoreThread
  2a1822: 8b 05 e8 52 85 00            	movl	0x8552e8(%rip), %eax    # 0xaf6b10
  2a1828: 85 c0                        	testl	%eax, %eax
  2a182a: 74 0a                        	je	0x2a1836 <PyInit__native+0x22cf6>
  2a182c: 48 83 c4 20                  	addq	$0x20, %rsp
  2a1830: 5b                           	popq	%rbx
  2a1831: 41 5e                        	popq	%r14
  2a1833: 41 5f                        	popq	%r15
  2a1835: c3                           	retq
  2a1836: 48 83 c4 20                  	addq	$0x20, %rsp
  2a183a: 5b                           	popq	%rbx
  2a183b: 41 5e                        	popq	%r14
  2a183d: 41 5f                        	popq	%r15
  2a183f: e9 9c 55 3e 00               	jmp	0x686de0 <PyInit__native+0x4082a0>
  2a1844: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  2a1849: e8 82 f4 fd ff               	callq	0x280cd0 <PyInit__native+0x2190>
  2a184e: eb dc                        	jmp	0x2a182c <PyInit__native+0x22cec>
  2a1850: e8 1b 57 3f 00               	callq	0x696f70 <PyInit_pyo3_async_runtimes+0x2cf0>
  2a1855: 0f 0b                        	ud2
  2a1857: e8 b0 45 2f 00               	callq	0x595e0c <PyInit__native+0x3172cc>
