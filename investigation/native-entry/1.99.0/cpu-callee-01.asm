
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  88a350: 41 55                        	pushq	%r13
  88a352: 41 54                        	pushq	%r12
  88a354: 55                           	pushq	%rbp
  88a355: 53                           	pushq	%rbx
  88a356: 48 89 fb                     	movq	%rdi, %rbx
  88a359: 48 83 ec 18                  	subq	$0x18, %rsp
  88a35d: 0f b6 2e                     	movzbl	(%rsi), %ebp
  88a360: 44 8b 23                     	movl	(%rbx), %r12d
  88a363: 44 8b 6b 04                  	movl	0x4(%rbx), %r13d
  88a367: 48 8d 54 24 08               	leaq	0x8(%rsp), %rdx
  88a36c: 89 e8                        	movl	%ebp, %eax
  88a36e: 83 e0 fd                     	andl	$-0x3, %eax
  88a371: 3c 7c                        	cmpb	$0x7c, %al
  88a373: 0f 94 c0                     	sete	%al
  88a376: 0f b6 c0                     	movzbl	%al, %eax
  88a379: 48 8d 3c 06                  	leaq	(%rsi,%rax), %rdi
  88a37d: 80 3f 30                     	cmpb	$0x30, (%rdi)
  88a380: 74 7e                        	je	0x88a400 <PyInit_pyo3_async_runtimes+0x1f0da0>
  88a382: 48 8d 35 27 a2 83 ff         	leaq	-0x7c5dd9(%rip), %rsi   # 0xc45b0 ; rodata: '%lu'
  88a389: 31 c0                        	xorl	%eax, %eax
  88a38b: e8 b0 b4 22 00               	callq	0xab5840 <sscanf@plt>
  88a390: 85 c0                        	testl	%eax, %eax
  88a392: 74 3c                        	je	0x88a3d0 <PyInit_pyo3_async_runtimes+0x1f0d70>
  88a394: 4c 8b 44 24 08               	movq	0x8(%rsp), %r8
  88a399: 4d 89 c1                     	movq	%r8, %r9
  88a39c: 49 c1 e9 20                  	shrq	$0x20, %r9
  88a3a0: 40 80 fd 7e                  	cmpb	$0x7e, %bpl
  88a3a4: 74 3a                        	je	0x88a3e0 <PyInit_pyo3_async_runtimes+0x1f0d80>
  88a3a6: 44 89 e0                     	movl	%r12d, %eax
  88a3a9: 44 09 e8                     	orl	%r13d, %eax
  88a3ac: 74 19                        	je	0x88a3c7 <PyInit_pyo3_async_runtimes+0x1f0d67>
  88a3ae: 44 89 e0                     	movl	%r12d, %eax
  88a3b1: 44 89 ea                     	movl	%r13d, %edx
  88a3b4: 0d 00 00 00 40               	orl	$0x40000000, %eax       # imm = 0x40000000
  88a3b9: f7 d2                        	notl	%edx
  88a3bb: f7 d0                        	notl	%eax
  88a3bd: 44 21 ca                     	andl	%r9d, %edx
  88a3c0: 44 21 c0                     	andl	%r8d, %eax
  88a3c3: 09 d0                        	orl	%edx, %eax
  88a3c5: 75 7d                        	jne	0x88a444 <PyInit_pyo3_async_runtimes+0x1f0de4>
  88a3c7: 40 80 fd 7c                  	cmpb	$0x7c, %bpl
  88a3cb: 74 5b                        	je	0x88a428 <PyInit_pyo3_async_runtimes+0x1f0dc8>
  88a3cd: 4c 89 03                     	movq	%r8, (%rbx)
  88a3d0: 48 83 c4 18                  	addq	$0x18, %rsp
  88a3d4: 5b                           	popq	%rbx
  88a3d5: 5d                           	popq	%rbp
  88a3d6: 41 5c                        	popq	%r12
  88a3d8: 41 5d                        	popq	%r13
  88a3da: c3                           	retq
  88a3db: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  88a3e0: f3 0f 7e 0b                  	movq	(%rbx), %xmm1
  88a3e4: 66 49 0f 6e c0               	movq	%r8, %xmm0
  88a3e9: 66 0f df c1                  	pandn	%xmm1, %xmm0
  88a3ed: 66 0f d6 03                  	movq	%xmm0, (%rbx)
  88a3f1: 48 83 c4 18                  	addq	$0x18, %rsp
  88a3f5: 5b                           	popq	%rbx
  88a3f6: 5d                           	popq	%rbp
  88a3f7: 41 5c                        	popq	%r12
  88a3f9: 41 5d                        	popq	%r13
  88a3fb: c3                           	retq
  88a3fc: 0f 1f 40 00                  	nopl	(%rax)
  88a400: 80 7c 06 01 78               	cmpb	$0x78, 0x1(%rsi,%rax)
  88a405: 0f 85 77 ff ff ff            	jne	0x88a382 <PyInit_pyo3_async_runtimes+0x1f0d22>
  88a40b: 48 8d 7c 06 02               	leaq	0x2(%rsi,%rax), %rdi
  88a410: 48 8d 35 44 3d 84 ff         	leaq	-0x7bc2bc(%rip), %rsi   # 0xce15b ; rodata: '%lx'
  88a417: 31 c0                        	xorl	%eax, %eax
  88a419: e8 22 b4 22 00               	callq	0xab5840 <sscanf@plt>
  88a41e: e9 6d ff ff ff               	jmp	0x88a390 <PyInit_pyo3_async_runtimes+0x1f0d30>
  88a423: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  88a428: f3 0f 7e 03                  	movq	(%rbx), %xmm0
  88a42c: 66 49 0f 6e d0               	movq	%r8, %xmm2
  88a431: 66 0f eb c2                  	por	%xmm2, %xmm0
  88a435: 66 0f d6 03                  	movq	%xmm0, (%rbx)
  88a439: 48 83 c4 18                  	addq	$0x18, %rsp
  88a43d: 5b                           	popq	%rbx
  88a43e: 5d                           	popq	%rbp
  88a43f: 41 5c                        	popq	%r12
  88a441: 41 5d                        	popq	%r13
  88a443: c3                           	retq
  88a444: 48 8b 05 65 58 26 00         	movq	0x265865(%rip), %rax    # 0xaefcb0 ; ELF relocation: stderr
  88a44b: 44 89 e9                     	movl	%r13d, %ecx
  88a44e: 44 89 e2                     	movl	%r12d, %edx
  88a451: 48 8d 35 c0 ef 8b ff         	leaq	-0x741040(%rip), %rsi   # 0x149418 ; rodata: 'Fatal Error: HW capability found: 0x%02X 0x%02X, but HW capability requested: 0x%02X 0x%02X.\n'
  88a458: 48 8b 38                     	movq	(%rax), %rdi
  88a45b: 31 c0                        	xorl	%eax, %eax
  88a45d: e8 ee b3 22 00               	callq	0xab5850 <fprintf@plt>
  88a462: e8 49 b3 22 00               	callq	0xab57b0 <abort@plt>
