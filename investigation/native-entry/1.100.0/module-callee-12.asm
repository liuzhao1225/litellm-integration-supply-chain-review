
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  29bc90: 41 57                        	pushq	%r15
  29bc92: 41 56                        	pushq	%r14
  29bc94: 53                           	pushq	%rbx
  29bc95: 48 83 ec 20                  	subq	$0x20, %rsp
  29bc99: 49 89 fe                     	movq	%rdi, %r14
  29bc9c: 48 8d 3d a5 bb 85 00         	leaq	0x85bba5(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  29bca3: e8 58 21 82 00               	callq	0xabde00 <__tls_get_addr@plt>
  29bca8: 48 89 c3                     	movq	%rax, %rbx
  29bcab: 4c 8b b8 d8 00 00 00         	movq	0xd8(%rax), %r15
  29bcb2: 48 c7 80 d8 00 00 00 00 00 00 00     	movq	$0x0, 0xd8(%rax)
  29bcbd: ff 15 45 bc 85 00            	callq	*0x85bc45(%rip)         # 0xaf7908 ; ELF relocation: PyEval_SaveThread
  29bcc3: 4c 89 74 24 08               	movq	%r14, 0x8(%rsp)
  29bcc8: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  29bccd: 48 89 44 24 18               	movq	%rax, 0x18(%rsp)
  29bcd2: 48 8b 0d 87 f0 85 00         	movq	0x85f087(%rip), %rcx    # 0xafad60
  29bcd9: 48 83 f9 02                  	cmpq	$0x2, %rcx
  29bcdd: 75 35                        	jne	0x29bd14 <PyInit__native+0x1f614>
  29bcdf: 48 8d 8b d8 00 00 00         	leaq	0xd8(%rbx), %rcx
  29bce6: 4c 89 39                     	movq	%r15, (%rcx)
  29bce9: 48 89 c7                     	movq	%rax, %rdi
  29bcec: ff 15 c6 bb 85 00            	callq	*0x85bbc6(%rip)         # 0xaf78b8 ; ELF relocation: PyEval_RestoreThread
  29bcf2: 8b 05 28 e1 85 00            	movl	0x85e128(%rip), %eax    # 0xaf9e20
  29bcf8: 85 c0                        	testl	%eax, %eax
  29bcfa: 74 0a                        	je	0x29bd06 <PyInit__native+0x1f606>
  29bcfc: 48 83 c4 20                  	addq	$0x20, %rsp
  29bd00: 5b                           	popq	%rbx
  29bd01: 41 5e                        	popq	%r14
  29bd03: 41 5f                        	popq	%r15
  29bd05: c3                           	retq
  29bd06: 48 83 c4 20                  	addq	$0x20, %rsp
  29bd0a: 5b                           	popq	%rbx
  29bd0b: 41 5e                        	popq	%r14
  29bd0d: 41 5f                        	popq	%r15
  29bd0f: e9 fc 67 3f 00               	jmp	0x692510 <PyInit__native+0x415e10>
  29bd14: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  29bd19: e8 d2 26 fe ff               	callq	0x27e3f0 <PyInit__native+0x1cf0>
  29bd1e: eb dc                        	jmp	0x29bcfc <PyInit__native+0x1f5fc>
  29bd20: e8 7b 68 40 00               	callq	0x6a25a0 <PyInit_pyo3_async_runtimes+0x2d10>
  29bd25: 0f 0b                        	ud2
  29bd27: e8 b0 b3 2d 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
