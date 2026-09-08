
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  892a90: 41 55                        	pushq	%r13
  892a92: 41 54                        	pushq	%r12
  892a94: 55                           	pushq	%rbp
  892a95: 53                           	pushq	%rbx
  892a96: 48 89 fb                     	movq	%rdi, %rbx
  892a99: 48 83 ec 18                  	subq	$0x18, %rsp
  892a9d: 0f b6 2e                     	movzbl	(%rsi), %ebp
  892aa0: 44 8b 23                     	movl	(%rbx), %r12d
  892aa3: 44 8b 6b 04                  	movl	0x4(%rbx), %r13d
  892aa7: 48 8d 54 24 08               	leaq	0x8(%rsp), %rdx
  892aac: 89 e8                        	movl	%ebp, %eax
  892aae: 83 e0 fd                     	andl	$-0x3, %eax
  892ab1: 3c 7c                        	cmpb	$0x7c, %al
  892ab3: 0f 94 c0                     	sete	%al
  892ab6: 0f b6 c0                     	movzbl	%al, %eax
  892ab9: 48 8d 3c 06                  	leaq	(%rsi,%rax), %rdi
  892abd: 80 3f 30                     	cmpb	$0x30, (%rdi)
  892ac0: 74 7e                        	je	0x892b40 <PyInit_pyo3_async_runtimes+0x1f32b0>
  892ac2: 48 8d 35 20 2c 83 ff         	leaq	-0x7cd3e0(%rip), %rsi   # 0xc56e9 ; rodata: '%lu'
  892ac9: 31 c0                        	xorl	%eax, %eax
  892acb: e8 b0 b4 22 00               	callq	0xabdf80 <sscanf@plt>
  892ad0: 85 c0                        	testl	%eax, %eax
  892ad2: 74 3c                        	je	0x892b10 <PyInit_pyo3_async_runtimes+0x1f3280>
  892ad4: 4c 8b 44 24 08               	movq	0x8(%rsp), %r8
  892ad9: 4d 89 c1                     	movq	%r8, %r9
  892adc: 49 c1 e9 20                  	shrq	$0x20, %r9
  892ae0: 40 80 fd 7e                  	cmpb	$0x7e, %bpl
  892ae4: 74 3a                        	je	0x892b20 <PyInit_pyo3_async_runtimes+0x1f3290>
  892ae6: 44 89 e0                     	movl	%r12d, %eax
  892ae9: 44 09 e8                     	orl	%r13d, %eax
  892aec: 74 19                        	je	0x892b07 <PyInit_pyo3_async_runtimes+0x1f3277>
  892aee: 44 89 e0                     	movl	%r12d, %eax
  892af1: 44 89 ea                     	movl	%r13d, %edx
  892af4: 0d 00 00 00 40               	orl	$0x40000000, %eax       # imm = 0x40000000
  892af9: f7 d2                        	notl	%edx
  892afb: f7 d0                        	notl	%eax
  892afd: 44 21 ca                     	andl	%r9d, %edx
  892b00: 44 21 c0                     	andl	%r8d, %eax
  892b03: 09 d0                        	orl	%edx, %eax
  892b05: 75 7d                        	jne	0x892b84 <PyInit_pyo3_async_runtimes+0x1f32f4>
  892b07: 40 80 fd 7c                  	cmpb	$0x7c, %bpl
  892b0b: 74 5b                        	je	0x892b68 <PyInit_pyo3_async_runtimes+0x1f32d8>
  892b0d: 4c 89 03                     	movq	%r8, (%rbx)
  892b10: 48 83 c4 18                  	addq	$0x18, %rsp
  892b14: 5b                           	popq	%rbx
  892b15: 5d                           	popq	%rbp
  892b16: 41 5c                        	popq	%r12
  892b18: 41 5d                        	popq	%r13
  892b1a: c3                           	retq
  892b1b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  892b20: f3 0f 7e 0b                  	movq	(%rbx), %xmm1
  892b24: 66 49 0f 6e c0               	movq	%r8, %xmm0
  892b29: 66 0f df c1                  	pandn	%xmm1, %xmm0
  892b2d: 66 0f d6 03                  	movq	%xmm0, (%rbx)
  892b31: 48 83 c4 18                  	addq	$0x18, %rsp
  892b35: 5b                           	popq	%rbx
  892b36: 5d                           	popq	%rbp
  892b37: 41 5c                        	popq	%r12
  892b39: 41 5d                        	popq	%r13
  892b3b: c3                           	retq
  892b3c: 0f 1f 40 00                  	nopl	(%rax)
  892b40: 80 7c 06 01 78               	cmpb	$0x78, 0x1(%rsi,%rax)
  892b45: 0f 85 77 ff ff ff            	jne	0x892ac2 <PyInit_pyo3_async_runtimes+0x1f3232>
  892b4b: 48 8d 7c 06 02               	leaq	0x2(%rsi,%rax), %rdi
  892b50: 48 8d 35 35 c6 83 ff         	leaq	-0x7c39cb(%rip), %rsi   # 0xcf18c ; rodata: '%lx'
  892b57: 31 c0                        	xorl	%eax, %eax
  892b59: e8 22 b4 22 00               	callq	0xabdf80 <sscanf@plt>
  892b5e: e9 6d ff ff ff               	jmp	0x892ad0 <PyInit_pyo3_async_runtimes+0x1f3240>
  892b63: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  892b68: f3 0f 7e 03                  	movq	(%rbx), %xmm0
  892b6c: 66 49 0f 6e d0               	movq	%r8, %xmm2
  892b71: 66 0f eb c2                  	por	%xmm2, %xmm0
  892b75: 66 0f d6 03                  	movq	%xmm0, (%rbx)
  892b79: 48 83 c4 18                  	addq	$0x18, %rsp
  892b7d: 5b                           	popq	%rbx
  892b7e: 5d                           	popq	%rbp
  892b7f: 41 5c                        	popq	%r12
  892b81: 41 5d                        	popq	%r13
  892b83: c3                           	retq
  892b84: 48 8b 05 55 5b 26 00         	movq	0x265b55(%rip), %rax    # 0xaf86e0 ; ELF relocation: stderr
  892b8b: 44 89 e9                     	movl	%r13d, %ecx
  892b8e: 44 89 e2                     	movl	%r12d, %edx
  892b91: 48 8d 35 c0 7c 8b ff         	leaq	-0x748340(%rip), %rsi   # 0x14a858 ; rodata: 'Fatal Error: HW capability found: 0x%02X 0x%02X, but HW capability requested: 0x%02X 0x%02X.\n'
  892b98: 48 8b 38                     	movq	(%rax), %rdi
  892b9b: 31 c0                        	xorl	%eax, %eax
  892b9d: e8 ee b3 22 00               	callq	0xabdf90 <fprintf@plt>
  892ba2: e8 49 b3 22 00               	callq	0xabdef0 <abort@plt>
