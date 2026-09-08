
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  28fe50: 41 57                        	pushq	%r15
  28fe52: 41 56                        	pushq	%r14
  28fe54: 53                           	pushq	%rbx
  28fe55: 48 83 ec 20                  	subq	$0x20, %rsp
  28fe59: 49 89 fe                     	movq	%rdi, %r14
  28fe5c: 48 8d 3d c5 f0 85 00         	leaq	0x85f0c5(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  28fe63: e8 58 58 82 00               	callq	0xab56c0 <__tls_get_addr@plt>
  28fe68: 48 89 c3                     	movq	%rax, %rbx
  28fe6b: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  28fe72: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  28fe7d: ff 15 35 f1 85 00            	callq	*0x85f135(%rip)         # 0xaeefb8 ; ELF relocation: PyEval_SaveThread
  28fe83: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  28fe88: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  28fe8d: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  28fe92: 48 8b 0d 57 24 86 00         	movq	0x862457(%rip), %rcx    # 0xaf22f0
  28fe99: 48 83 f9 02                  	cmpq	$0x2, %rcx
  28fe9d: 75 35                        	jne	0x28fed4 <PyInit__native+0x153d4>
  28fe9f: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  28fea6: 4c 89 39                     	movq	%r15, (%rcx)
  28fea9: 48 89 c7                     	movq	%rax, %rdi
  28feac: ff 15 d6 f0 85 00            	callq	*0x85f0d6(%rip)         # 0xaeef88 ; ELF relocation: PyEval_RestoreThread
  28feb2: 8b 05 38 15 86 00            	movl	0x861538(%rip), %eax    # 0xaf13f0
  28feb8: 85 c0                        	testl	%eax, %eax
  28feba: 74 0a                        	je	0x28fec6 <PyInit__native+0x153c6>
  28febc: 48 83 c4 20                  	addq	$0x20, %rsp
  28fec0: 5b                           	popq	%rbx
  28fec1: 41 5e                        	popq	%r14
  28fec3: 41 5f                        	popq	%r15
  28fec5: c3                           	retq
  28fec6: 48 83 c4 20                  	addq	$0x20, %rsp
  28feca: 5b                           	popq	%rbx
  28fecb: 41 5e                        	popq	%r14
  28fecd: 41 5f                        	popq	%r15
  28fecf: e9 5c c6 3f 00               	jmp	0x68c530 <PyInit__native+0x411a30>
  28fed4: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  28fed9: e8 72 c2 fe ff               	callq	0x27c150 <PyInit__native+0x1650>
  28fede: eb dc                        	jmp	0x28febc <PyInit__native+0x153bc>
  28fee0: e8 9b c5 40 00               	callq	0x69c480 <PyInit_pyo3_async_runtimes+0x2e20>
  28fee5: 0f 0b                        	ud2
  28fee7: e8 c0 a8 2c 00               	callq	0x55a7ac <PyInit__native+0x2dfcac>
