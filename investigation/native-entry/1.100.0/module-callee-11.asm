
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  29bb50: 41 57                        	pushq	%r15
  29bb52: 41 56                        	pushq	%r14
  29bb54: 53                           	pushq	%rbx
  29bb55: 48 83 ec 20                  	subq	$0x20, %rsp
  29bb59: 49 89 fe                     	movq	%rdi, %r14
  29bb5c: 48 8d 3d e5 bc 85 00         	leaq	0x85bce5(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  29bb63: e8 98 22 82 00               	callq	0xabde00 <__tls_get_addr@plt>
  29bb68: 48 89 c3                     	movq	%rax, %rbx
  29bb6b: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  29bb72: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  29bb7d: ff 15 85 bd 85 00            	callq	*0x85bd85(%rip)         # 0xaf7908 ; ELF relocation: PyEval_SaveThread
  29bb83: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  29bb88: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  29bb8d: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  29bb92: 48 8b 0d b7 f1 85 00         	movq	0x85f1b7(%rip), %rcx    # 0xafad50
  29bb99: 48 83 f9 02                  	cmpq	$0x2, %rcx
  29bb9d: 75 35                        	jne	0x29bbd4 <PyInit__native+0x1f4d4>
  29bb9f: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  29bba6: 4c 89 39                     	movq	%r15, (%rcx)
  29bba9: 48 89 c7                     	movq	%rax, %rdi
  29bbac: ff 15 06 bd 85 00            	callq	*0x85bd06(%rip)         # 0xaf78b8 ; ELF relocation: PyEval_RestoreThread
  29bbb2: 8b 05 68 e2 85 00            	movl	0x85e268(%rip), %eax    # 0xaf9e20
  29bbb8: 85 c0                        	testl	%eax, %eax
  29bbba: 74 0a                        	je	0x29bbc6 <PyInit__native+0x1f4c6>
  29bbbc: 48 83 c4 20                  	addq	$0x20, %rsp
  29bbc0: 5b                           	popq	%rbx
  29bbc1: 41 5e                        	popq	%r14
  29bbc3: 41 5f                        	popq	%r15
  29bbc5: c3                           	retq
  29bbc6: 48 83 c4 20                  	addq	$0x20, %rsp
  29bbca: 5b                           	popq	%rbx
  29bbcb: 41 5e                        	popq	%r14
  29bbcd: 41 5f                        	popq	%r15
  29bbcf: e9 3c 69 3f 00               	jmp	0x692510 <PyInit__native+0x415e10>
  29bbd4: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  29bbd9: e8 52 26 fe ff               	callq	0x27e230 <PyInit__native+0x1b30>
  29bbde: eb dc                        	jmp	0x29bbbc <PyInit__native+0x1f4bc>
  29bbe0: e8 bb 69 40 00               	callq	0x6a25a0 <PyInit_pyo3_async_runtimes+0x2d10>
  29bbe5: 0f 0b                        	ud2
  29bbe7: e8 f0 b4 2d 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
