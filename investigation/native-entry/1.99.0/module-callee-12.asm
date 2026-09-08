
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  28ff90: 41 57                        	pushq	%r15
  28ff92: 41 56                        	pushq	%r14
  28ff94: 53                           	pushq	%rbx
  28ff95: 48 83 ec 20                  	subq	$0x20, %rsp
  28ff99: 49 89 fe                     	movq	%rdi, %r14
  28ff9c: 48 8d 3d 85 ef 85 00         	leaq	0x85ef85(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  28ffa3: e8 18 57 82 00               	callq	0xab56c0 <__tls_get_addr@plt>
  28ffa8: 48 89 c3                     	movq	%rax, %rbx
  28ffab: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  28ffb2: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  28ffbd: ff 15 f5 ef 85 00            	callq	*0x85eff5(%rip)         # 0xaeefb8 ; ELF relocation: PyEval_SaveThread
  28ffc3: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  28ffc8: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  28ffcd: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  28ffd2: 48 8b 0d 27 23 86 00         	movq	0x862327(%rip), %rcx    # 0xaf2300
  28ffd9: 48 83 f9 02                  	cmpq	$0x2, %rcx
  28ffdd: 75 35                        	jne	0x290014 <PyInit__native+0x15514>
  28ffdf: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  28ffe6: 4c 89 39                     	movq	%r15, (%rcx)
  28ffe9: 48 89 c7                     	movq	%rax, %rdi
  28ffec: ff 15 96 ef 85 00            	callq	*0x85ef96(%rip)         # 0xaeef88 ; ELF relocation: PyEval_RestoreThread
  28fff2: 8b 05 f8 13 86 00            	movl	0x8613f8(%rip), %eax    # 0xaf13f0
  28fff8: 85 c0                        	testl	%eax, %eax
  28fffa: 74 0a                        	je	0x290006 <PyInit__native+0x15506>
  28fffc: 48 83 c4 20                  	addq	$0x20, %rsp
  290000: 5b                           	popq	%rbx
  290001: 41 5e                        	popq	%r14
  290003: 41 5f                        	popq	%r15
  290005: c3                           	retq
  290006: 48 83 c4 20                  	addq	$0x20, %rsp
  29000a: 5b                           	popq	%rbx
  29000b: 41 5e                        	popq	%r14
  29000d: 41 5f                        	popq	%r15
  29000f: e9 1c c5 3f 00               	jmp	0x68c530 <PyInit__native+0x411a30>
  290014: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  290019: e8 f2 c2 fe ff               	callq	0x27c310 <PyInit__native+0x1810>
  29001e: eb dc                        	jmp	0x28fffc <PyInit__native+0x154fc>
  290020: e8 5b c4 40 00               	callq	0x69c480 <PyInit_pyo3_async_runtimes+0x2e20>
  290025: 0f 0b                        	ud2
  290027: e8 80 a7 2c 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
