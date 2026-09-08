
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  8ace60: 55                           	pushq	%rbp
  8ace61: 31 c0                        	xorl	%eax, %eax
  8ace63: 53                           	pushq	%rbx
  8ace64: 48 83 ec 08                  	subq	$0x8, %rsp
  8ace68: 31 c9                        	xorl	%ecx, %ecx
  8ace6a: 0f a2                        	cpuid
  8ace6c: 41 89 d0                     	movl	%edx, %r8d
  8ace6f: 41 89 c9                     	movl	%ecx, %r9d
  8ace72: 81 fb 47 65 6e 75            	cmpl	$0x756e6547, %ebx       # imm = 0x756E6547
  8ace78: 0f 84 12 01 00 00            	je	0x8acf90 <PyInit_pyo3_async_runtimes+0x213930>
  8ace7e: 81 fa 65 6e 74 69            	cmpl	$0x69746e65, %edx       # imm = 0x69746E65
  8ace84: 0f 94 c1                     	sete	%cl
  8ace87: 81 fb 41 75 74 68            	cmpl	$0x68747541, %ebx       # imm = 0x68747541
  8ace8d: 0f 94 c2                     	sete	%dl
  8ace90: 84 d1                        	testb	%dl, %cl
  8ace92: 74 0d                        	je	0x8acea1 <PyInit_pyo3_async_runtimes+0x213841>
  8ace94: 41 81 f9 63 41 4d 44         	cmpl	$0x444d4163, %r9d       # imm = 0x444D4163
  8ace9b: 0f 84 df 01 00 00            	je	0x8ad080 <PyInit_pyo3_async_runtimes+0x213a20>
  8acea1: 83 f8 06                     	cmpl	$0x6, %eax
  8acea4: 0f 87 b6 00 00 00            	ja	0x8acf60 <PyInit_pyo3_async_runtimes+0x213900>
  8aceaa: b8 01 00 00 00               	movl	$0x1, %eax
  8aceaf: 31 c9                        	xorl	%ecx, %ecx
  8aceb1: 0f a2                        	cpuid
  8aceb3: 31 f6                        	xorl	%esi, %esi
  8aceb5: 89 cf                        	movl	%ecx, %edi
  8aceb7: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8acebb: 81 e2 ff ff ef bf            	andl	$0xbfefffff, %edx       # imm = 0xBFEFFFFF
  8acec1: 81 ca 00 00 00 10            	orl	$0x10000000, %edx       # imm = 0x10000000
  8acec7: 66 0f 6e c2                  	movd	%edx, %xmm0
  8acecb: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8aced1: 0f 85 3f 01 00 00            	jne	0x8ad016 <PyInit_pyo3_async_runtimes+0x2139b6>
  8aced7: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8acedd: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8acee3: f7 c7 00 00 00 04            	testl	$0x4000000, %edi        # imm = 0x4000000
  8acee9: 0f 84 12 01 00 00            	je	0x8ad001 <PyInit_pyo3_async_runtimes+0x2139a1>
  8aceef: 66 0f 6e df                  	movd	%edi, %xmm3
  8acef3: 66 0f 6e d6                  	movd	%esi, %xmm2
  8acef7: 48 8d 2d f2 7f 24 00         	leaq	0x247ff2(%rip), %rbp    # 0xaf4ef0
  8acefe: 48 8d 05 e3 7f 24 00         	leaq	0x247fe3(%rip), %rax    # 0xaf4ee8
  8acf05: 66 0f 62 d1                  	punpckldq	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
  8acf09: 66 0f 62 c3                  	punpckldq	%xmm3, %xmm0    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
  8acf0d: 48 8d 3d ae 9a 82 ff         	leaq	-0x7d6552(%rip), %rdi   # 0xd69c2 ; rodata: 'OPENSSL_ia32cap'
  8acf14: 66 0f 6c c2                  	punpcklqdq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0]
  8acf18: c6 00 01                     	movb	$0x1, (%rax)
  8acf1b: 0f 11 45 00                  	movups	%xmm0, (%rbp)
  8acf1f: e8 7c 88 20 00               	callq	0xab57a0 <getenv@plt>
  8acf24: 48 89 c3                     	movq	%rax, %rbx
  8acf27: 48 85 c0                     	testq	%rax, %rax
  8acf2a: 74 54                        	je	0x8acf80 <PyInit_pyo3_async_runtimes+0x213920>
  8acf2c: 48 89 c6                     	movq	%rax, %rsi
  8acf2f: 48 89 ef                     	movq	%rbp, %rdi
  8acf32: e8 19 d4 fd ff               	callq	0x88a350 <PyInit_pyo3_async_runtimes+0x1f0cf0>
  8acf37: be 3a 00 00 00               	movl	$0x3a, %esi
  8acf3c: 48 89 df                     	movq	%rbx, %rdi
  8acf3f: e8 bc 88 20 00               	callq	0xab5800 <strchr@plt>
  8acf44: 48 85 c0                     	testq	%rax, %rax
  8acf47: 74 37                        	je	0x8acf80 <PyInit_pyo3_async_runtimes+0x213920>
  8acf49: 48 83 c4 08                  	addq	$0x8, %rsp
  8acf4d: 48 8d 7d 08                  	leaq	0x8(%rbp), %rdi
  8acf51: 48 8d 70 01                  	leaq	0x1(%rax), %rsi
  8acf55: 5b                           	popq	%rbx
  8acf56: 5d                           	popq	%rbp
  8acf57: e9 f4 d3 fd ff               	jmp	0x88a350 <PyInit_pyo3_async_runtimes+0x1f0cf0>
  8acf5c: 0f 1f 40 00                  	nopl	(%rax)
  8acf60: b8 07 00 00 00               	movl	$0x7, %eax
  8acf65: 31 c9                        	xorl	%ecx, %ecx
  8acf67: 0f a2                        	cpuid
  8acf69: b8 01 00 00 00               	movl	$0x1, %eax
  8acf6e: 89 de                        	movl	%ebx, %esi
  8acf70: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8acf74: 31 c9                        	xorl	%ecx, %ecx
  8acf76: 0f a2                        	cpuid
  8acf78: 89 cf                        	movl	%ecx, %edi
  8acf7a: e9 3c ff ff ff               	jmp	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8acf7f: 90                           	nop
  8acf80: 48 83 c4 08                  	addq	$0x8, %rsp
  8acf84: 5b                           	popq	%rbx
  8acf85: 5d                           	popq	%rbp
  8acf86: c3                           	retq
  8acf87: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
  8acf90: 83 f8 06                     	cmpl	$0x6, %eax
  8acf93: 0f 87 b7 00 00 00            	ja	0x8ad050 <PyInit_pyo3_async_runtimes+0x2139f0>
  8acf99: b8 01 00 00 00               	movl	$0x1, %eax
  8acf9e: 31 c9                        	xorl	%ecx, %ecx
  8acfa0: 0f a2                        	cpuid
  8acfa2: 31 f6                        	xorl	%esi, %esi
  8acfa4: 89 cf                        	movl	%ecx, %edi
  8acfa6: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8acfaa: 89 d1                        	movl	%edx, %ecx
  8acfac: 81 e1 ff ff ef ff            	andl	$0xffefffff, %ecx       # imm = 0xFFEFFFFF
  8acfb2: 41 81 f9 6e 74 65 6c         	cmpl	$0x6c65746e, %r9d       # imm = 0x6C65746E
  8acfb9: 0f 85 fc fe ff ff            	jne	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8acfbf: 41 81 f8 69 6e 65 49         	cmpl	$0x49656e69, %r8d       # imm = 0x49656E69
  8acfc6: 0f 85 ef fe ff ff            	jne	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8acfcc: 81 c9 00 00 00 50            	orl	$0x50000000, %ecx       # imm = 0x50000000
  8acfd2: 25 f0 0f ff 0f               	andl	$0xfff0ff0, %eax        # imm = 0xFFF0FF0
  8acfd7: 66 0f 6e c1                  	movd	%ecx, %xmm0
  8acfdb: 3d 70 06 05 00               	cmpl	$0x50670, %eax          # imm = 0x50670
  8acfe0: 74 0b                        	je	0x8acfed <PyInit_pyo3_async_runtimes+0x21398d>
  8acfe2: 3d 50 06 08 00               	cmpl	$0x80650, %eax          # imm = 0x80650
  8acfe7: 0f 85 de fe ff ff            	jne	0x8acecb <PyInit_pyo3_async_runtimes+0x21386b>
  8acfed: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8acff3: 75 1b                        	jne	0x8ad010 <PyInit_pyo3_async_runtimes+0x2139b0>
  8acff5: 81 e7 ff e7 ff eb            	andl	$0xebffe7ff, %edi       # imm = 0xEBFFE7FF
  8acffb: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8ad001: 81 e6 ff ff f7 ff            	andl	$0xfff7ffff, %esi       # imm = 0xFFF7FFFF
  8ad007: e9 e3 fe ff ff               	jmp	0x8aceef <PyInit_pyo3_async_runtimes+0x21388f>
  8ad00c: 0f 1f 40 00                  	nopl	(%rax)
  8ad010: 81 e7 ff ff ff fb            	andl	$0xfbffffff, %edi       # imm = 0xFBFFFFFF
  8ad016: 31 c9                        	xorl	%ecx, %ecx
  8ad018: 0f 01 d0                     	xgetbv
  8ad01b: 89 c0                        	movl	%eax, %eax
  8ad01d: 48 c1 e2 20                  	shlq	$0x20, %rdx
  8ad021: 48 09 c2                     	orq	%rax, %rdx
  8ad024: 48 f7 d0                     	notq	%rax
  8ad027: a8 06                        	testb	$0x6, %al
  8ad029: 74 45                        	je	0x8ad070 <PyInit_pyo3_async_runtimes+0x213a10>
  8ad02b: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8ad031: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8ad037: 89 f0                        	movl	%esi, %eax
  8ad039: 48 f7 d2                     	notq	%rdx
  8ad03c: 25 ff ff fe ff               	andl	$0xfffeffff, %eax       # imm = 0xFFFEFFFF
  8ad041: 81 e2 e6 00 00 00            	andl	$0xe6, %edx
  8ad047: 0f 45 f0                     	cmovnel	%eax, %esi
  8ad04a: e9 94 fe ff ff               	jmp	0x8acee3 <PyInit_pyo3_async_runtimes+0x213883>
  8ad04f: 90                           	nop
  8ad050: b8 07 00 00 00               	movl	$0x7, %eax
  8ad055: 31 c9                        	xorl	%ecx, %ecx
  8ad057: 0f a2                        	cpuid
  8ad059: b8 01 00 00 00               	movl	$0x1, %eax
  8ad05e: 89 de                        	movl	%ebx, %esi
  8ad060: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8ad064: 31 c9                        	xorl	%ecx, %ecx
  8ad066: 0f a2                        	cpuid
  8ad068: 89 cf                        	movl	%ecx, %edi
  8ad06a: e9 3b ff ff ff               	jmp	0x8acfaa <PyInit_pyo3_async_runtimes+0x21394a>
  8ad06f: 90                           	nop
  8ad070: 81 e7 ff f7 ff ff            	andl	$0xfffff7ff, %edi       # imm = 0xFFFFF7FF
  8ad076: eb bf                        	jmp	0x8ad037 <PyInit_pyo3_async_runtimes+0x2139d7>
  8ad078: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  8ad080: 83 f8 06                     	cmpl	$0x6, %eax
  8ad083: 77 2b                        	ja	0x8ad0b0 <PyInit_pyo3_async_runtimes+0x213a50>
  8ad085: b8 01 00 00 00               	movl	$0x1, %eax
  8ad08a: 31 c9                        	xorl	%ecx, %ecx
  8ad08c: 0f a2                        	cpuid
  8ad08e: 89 c6                        	movl	%eax, %esi
  8ad090: 89 cf                        	movl	%ecx, %edi
  8ad092: f7 d6                        	notl	%esi
  8ad094: 81 e6 00 0f 00 00            	andl	$0xf00, %esi            # imm = 0xF00
  8ad09a: 74 42                        	je	0x8ad0de <PyInit_pyo3_async_runtimes+0x213a7e>
  8ad09c: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8ad0a2: 31 f6                        	xorl	%esi, %esi
  8ad0a4: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8ad0a8: e9 0e fe ff ff               	jmp	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8ad0ad: 0f 1f 00                     	nopl	(%rax)
  8ad0b0: b8 07 00 00 00               	movl	$0x7, %eax
  8ad0b5: 31 c9                        	xorl	%ecx, %ecx
  8ad0b7: 0f a2                        	cpuid
  8ad0b9: b8 01 00 00 00               	movl	$0x1, %eax
  8ad0be: 89 de                        	movl	%ebx, %esi
  8ad0c0: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8ad0c4: 31 c9                        	xorl	%ecx, %ecx
  8ad0c6: 0f a2                        	cpuid
  8ad0c8: 89 cf                        	movl	%ecx, %edi
  8ad0ca: 89 c1                        	movl	%eax, %ecx
  8ad0cc: f7 d1                        	notl	%ecx
  8ad0ce: 80 e5 0f                     	andb	$0xf, %ch
  8ad0d1: 74 1d                        	je	0x8ad0f0 <PyInit_pyo3_async_runtimes+0x213a90>
  8ad0d3: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8ad0d9: e9 dd fd ff ff               	jmp	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8ad0de: 31 f6                        	xorl	%esi, %esi
  8ad0e0: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8ad0e4: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8ad0ef: 90                           	nop
  8ad0f0: c1 e8 14                     	shrl	$0x14, %eax
  8ad0f3: 0f b6 c0                     	movzbl	%al, %eax
  8ad0f6: 83 e8 09                     	subl	$0x9, %eax
  8ad0f9: 83 f8 e7                     	cmpl	$-0x19, %eax
  8ad0fc: 0f 86 b9 fd ff ff            	jbe	0x8acebb <PyInit_pyo3_async_runtimes+0x21385b>
  8ad102: eb cf                        	jmp	0x8ad0d3 <PyInit_pyo3_async_runtimes+0x213a73>
