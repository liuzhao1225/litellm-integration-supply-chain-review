
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  2a1900: 41 57                        	pushq	%r15
  2a1902: 41 56                        	pushq	%r14
  2a1904: 53                           	pushq	%rbx
  2a1905: 48 83 ec 20                  	subq	$0x20, %rsp
  2a1909: 49 89 fe                     	movq	%rdi, %r14
  2a190c: 48 8d 3d 15 2c 85 00         	leaq	0x852c15(%rip), %rdi    # 0xaf4528 ; ELF relocation: local pointer 0x0
  2a1913: e8 e8 98 81 00               	callq	0xabb200 <__tls_get_addr@plt>
  2a1918: 48 89 c3                     	movq	%rax, %rbx
  2a191b: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  2a1922: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  2a192d: ff 15 bd 2c 85 00            	callq	*0x852cbd(%rip)         # 0xaf45f0 ; ELF relocation: PyEval_SaveThread
  2a1933: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  2a1938: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  2a193d: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  2a1942: 48 8b 0d 0f 61 85 00         	movq	0x85610f(%rip), %rcx    # 0xaf7a58
  2a1949: 48 83 f9 02                  	cmpq	$0x2, %rcx
  2a194d: 75 35                        	jne	0x2a1984 <PyInit__native+0x22e44>
  2a194f: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  2a1956: 4c 89 39                     	movq	%r15, (%rcx)
  2a1959: 48 89 c7                     	movq	%rax, %rdi
  2a195c: ff 15 36 2c 85 00            	callq	*0x852c36(%rip)         # 0xaf4598 ; ELF relocation: PyEval_RestoreThread
  2a1962: 8b 05 a8 51 85 00            	movl	0x8551a8(%rip), %eax    # 0xaf6b10
  2a1968: 85 c0                        	testl	%eax, %eax
  2a196a: 74 0a                        	je	0x2a1976 <PyInit__native+0x22e36>
  2a196c: 48 83 c4 20                  	addq	$0x20, %rsp
  2a1970: 5b                           	popq	%rbx
  2a1971: 41 5e                        	popq	%r14
  2a1973: 41 5f                        	popq	%r15
  2a1975: c3                           	retq
  2a1976: 48 83 c4 20                  	addq	$0x20, %rsp
  2a197a: 5b                           	popq	%rbx
  2a197b: 41 5e                        	popq	%r14
  2a197d: 41 5f                        	popq	%r15
  2a197f: e9 5c 54 3e 00               	jmp	0x686de0 <PyInit__native+0x4082a0>
  2a1984: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  2a1989: e8 02 f5 fd ff               	callq	0x280e90 <PyInit__native+0x2350>
  2a198e: eb dc                        	jmp	0x2a196c <PyInit__native+0x22e2c>
  2a1990: e8 db 55 3f 00               	callq	0x696f70 <PyInit_pyo3_async_runtimes+0x2cf0>
  2a1995: 0f 0b                        	ud2
  2a1997: e8 70 44 2f 00               	callq	0x595e0c <PyInit__native+0x3172cc>
