
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000694280 <PyInit_pyo3_async_runtimes>:
  8b29a0: 55                           	pushq	%rbp
  8b29a1: 31 c0                        	xorl	%eax, %eax
  8b29a3: 53                           	pushq	%rbx
  8b29a4: 48 83 ec 08                  	subq	$0x8, %rsp
  8b29a8: 31 c9                        	xorl	%ecx, %ecx
  8b29aa: 0f a2                        	cpuid
  8b29ac: 41 89 d0                     	movl	%edx, %r8d
  8b29af: 41 89 c9                     	movl	%ecx, %r9d
  8b29b2: 81 fb 47 65 6e 75            	cmpl	$0x756e6547, %ebx       # imm = 0x756E6547
  8b29b8: 0f 84 12 01 00 00            	je	0x8b2ad0 <PyInit_pyo3_async_runtimes+0x21e850>
  8b29be: 81 fa 65 6e 74 69            	cmpl	$0x69746e65, %edx       # imm = 0x69746E65
  8b29c4: 0f 94 c1                     	sete	%cl
  8b29c7: 81 fb 41 75 74 68            	cmpl	$0x68747541, %ebx       # imm = 0x68747541
  8b29cd: 0f 94 c2                     	sete	%dl
  8b29d0: 84 d1                        	testb	%dl, %cl
  8b29d2: 74 0d                        	je	0x8b29e1 <PyInit_pyo3_async_runtimes+0x21e761>
  8b29d4: 41 81 f9 63 41 4d 44         	cmpl	$0x444d4163, %r9d       # imm = 0x444D4163
  8b29db: 0f 84 df 01 00 00            	je	0x8b2bc0 <PyInit_pyo3_async_runtimes+0x21e940>
  8b29e1: 83 f8 06                     	cmpl	$0x6, %eax
  8b29e4: 0f 87 b6 00 00 00            	ja	0x8b2aa0 <PyInit_pyo3_async_runtimes+0x21e820>
  8b29ea: b8 01 00 00 00               	movl	$0x1, %eax
  8b29ef: 31 c9                        	xorl	%ecx, %ecx
  8b29f1: 0f a2                        	cpuid
  8b29f3: 31 f6                        	xorl	%esi, %esi
  8b29f5: 89 cf                        	movl	%ecx, %edi
  8b29f7: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b29fb: 81 e2 ff ff ef bf            	andl	$0xbfefffff, %edx       # imm = 0xBFEFFFFF
  8b2a01: 81 ca 00 00 00 10            	orl	$0x10000000, %edx       # imm = 0x10000000
  8b2a07: 66 0f 6e c2                  	movd	%edx, %xmm0
  8b2a0b: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8b2a11: 0f 85 3f 01 00 00            	jne	0x8b2b56 <PyInit_pyo3_async_runtimes+0x21e8d6>
  8b2a17: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8b2a1d: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b2a23: f7 c7 00 00 00 04            	testl	$0x4000000, %edi        # imm = 0x4000000
  8b2a29: 0f 84 12 01 00 00            	je	0x8b2b41 <PyInit_pyo3_async_runtimes+0x21e8c1>
  8b2a2f: 66 0f 6e df                  	movd	%edi, %xmm3
  8b2a33: 66 0f 6e d6                  	movd	%esi, %xmm2
  8b2a37: 48 8d 2d 32 7c 24 00         	leaq	0x247c32(%rip), %rbp    # 0xafa670
  8b2a3e: 48 8d 05 23 7c 24 00         	leaq	0x247c23(%rip), %rax    # 0xafa668
  8b2a45: 66 0f 62 d1                  	punpckldq	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
  8b2a49: 66 0f 62 c3                  	punpckldq	%xmm3, %xmm0    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
  8b2a4d: 48 8d 3d e0 36 82 ff         	leaq	-0x7dc920(%rip), %rdi   # 0xd6134 ; rodata: 'OPENSSL_ia32cap'
  8b2a54: 66 0f 6c c2                  	punpcklqdq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0]
  8b2a58: c6 00 01                     	movb	$0x1, (%rax)
  8b2a5b: 0f 11 45 00                  	movups	%xmm0, (%rbp)
  8b2a5f: e8 7c 88 20 00               	callq	0xabb2e0 <getenv@plt>
  8b2a64: 48 89 c3                     	movq	%rax, %rbx
  8b2a67: 48 85 c0                     	testq	%rax, %rax
  8b2a6a: 74 54                        	je	0x8b2ac0 <PyInit_pyo3_async_runtimes+0x21e840>
  8b2a6c: 48 89 c6                     	movq	%rax, %rsi
  8b2a6f: 48 89 ef                     	movq	%rbp, %rdi
  8b2a72: e8 19 d4 fd ff               	callq	0x88fe90 <PyInit_pyo3_async_runtimes+0x1fbc10>
  8b2a77: be 3a 00 00 00               	movl	$0x3a, %esi
  8b2a7c: 48 89 df                     	movq	%rbx, %rdi
  8b2a7f: e8 bc 88 20 00               	callq	0xabb340 <strchr@plt>
  8b2a84: 48 85 c0                     	testq	%rax, %rax
  8b2a87: 74 37                        	je	0x8b2ac0 <PyInit_pyo3_async_runtimes+0x21e840>
  8b2a89: 48 83 c4 08                  	addq	$0x8, %rsp
  8b2a8d: 48 8d 7d 08                  	leaq	0x8(%rbp), %rdi
  8b2a91: 48 8d 70 01                  	leaq	0x1(%rax), %rsi
  8b2a95: 5b                           	popq	%rbx
  8b2a96: 5d                           	popq	%rbp
  8b2a97: e9 f4 d3 fd ff               	jmp	0x88fe90 <PyInit_pyo3_async_runtimes+0x1fbc10>
  8b2a9c: 0f 1f 40 00                  	nopl	(%rax)
  8b2aa0: b8 07 00 00 00               	movl	$0x7, %eax
  8b2aa5: 31 c9                        	xorl	%ecx, %ecx
  8b2aa7: 0f a2                        	cpuid
  8b2aa9: b8 01 00 00 00               	movl	$0x1, %eax
  8b2aae: 89 de                        	movl	%ebx, %esi
  8b2ab0: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b2ab4: 31 c9                        	xorl	%ecx, %ecx
  8b2ab6: 0f a2                        	cpuid
  8b2ab8: 89 cf                        	movl	%ecx, %edi
  8b2aba: e9 3c ff ff ff               	jmp	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2abf: 90                           	nop
  8b2ac0: 48 83 c4 08                  	addq	$0x8, %rsp
  8b2ac4: 5b                           	popq	%rbx
  8b2ac5: 5d                           	popq	%rbp
  8b2ac6: c3                           	retq
  8b2ac7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
  8b2ad0: 83 f8 06                     	cmpl	$0x6, %eax
  8b2ad3: 0f 87 b7 00 00 00            	ja	0x8b2b90 <PyInit_pyo3_async_runtimes+0x21e910>
  8b2ad9: b8 01 00 00 00               	movl	$0x1, %eax
  8b2ade: 31 c9                        	xorl	%ecx, %ecx
  8b2ae0: 0f a2                        	cpuid
  8b2ae2: 31 f6                        	xorl	%esi, %esi
  8b2ae4: 89 cf                        	movl	%ecx, %edi
  8b2ae6: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b2aea: 89 d1                        	movl	%edx, %ecx
  8b2aec: 81 e1 ff ff ef ff            	andl	$0xffefffff, %ecx       # imm = 0xFFEFFFFF
  8b2af2: 41 81 f9 6e 74 65 6c         	cmpl	$0x6c65746e, %r9d       # imm = 0x6C65746E
  8b2af9: 0f 85 fc fe ff ff            	jne	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2aff: 41 81 f8 69 6e 65 49         	cmpl	$0x49656e69, %r8d       # imm = 0x49656E69
  8b2b06: 0f 85 ef fe ff ff            	jne	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2b0c: 81 c9 00 00 00 50            	orl	$0x50000000, %ecx       # imm = 0x50000000
  8b2b12: 25 f0 0f ff 0f               	andl	$0xfff0ff0, %eax        # imm = 0xFFF0FF0
  8b2b17: 66 0f 6e c1                  	movd	%ecx, %xmm0
  8b2b1b: 3d 70 06 05 00               	cmpl	$0x50670, %eax          # imm = 0x50670
  8b2b20: 74 0b                        	je	0x8b2b2d <PyInit_pyo3_async_runtimes+0x21e8ad>
  8b2b22: 3d 50 06 08 00               	cmpl	$0x80650, %eax          # imm = 0x80650
  8b2b27: 0f 85 de fe ff ff            	jne	0x8b2a0b <PyInit_pyo3_async_runtimes+0x21e78b>
  8b2b2d: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8b2b33: 75 1b                        	jne	0x8b2b50 <PyInit_pyo3_async_runtimes+0x21e8d0>
  8b2b35: 81 e7 ff e7 ff eb            	andl	$0xebffe7ff, %edi       # imm = 0xEBFFE7FF
  8b2b3b: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b2b41: 81 e6 ff ff f7 ff            	andl	$0xfff7ffff, %esi       # imm = 0xFFF7FFFF
  8b2b47: e9 e3 fe ff ff               	jmp	0x8b2a2f <PyInit_pyo3_async_runtimes+0x21e7af>
  8b2b4c: 0f 1f 40 00                  	nopl	(%rax)
  8b2b50: 81 e7 ff ff ff fb            	andl	$0xfbffffff, %edi       # imm = 0xFBFFFFFF
  8b2b56: 31 c9                        	xorl	%ecx, %ecx
  8b2b58: 0f 01 d0                     	xgetbv
  8b2b5b: 89 c0                        	movl	%eax, %eax
  8b2b5d: 48 c1 e2 20                  	shlq	$0x20, %rdx
  8b2b61: 48 09 c2                     	orq	%rax, %rdx
  8b2b64: 48 f7 d0                     	notq	%rax
  8b2b67: a8 06                        	testb	$0x6, %al
  8b2b69: 74 45                        	je	0x8b2bb0 <PyInit_pyo3_async_runtimes+0x21e930>
  8b2b6b: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8b2b71: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b2b77: 89 f0                        	movl	%esi, %eax
  8b2b79: 48 f7 d2                     	notq	%rdx
  8b2b7c: 25 ff ff fe ff               	andl	$0xfffeffff, %eax       # imm = 0xFFFEFFFF
  8b2b81: 81 e2 e6 00 00 00            	andl	$0xe6, %edx
  8b2b87: 0f 45 f0                     	cmovnel	%eax, %esi
  8b2b8a: e9 94 fe ff ff               	jmp	0x8b2a23 <PyInit_pyo3_async_runtimes+0x21e7a3>
  8b2b8f: 90                           	nop
  8b2b90: b8 07 00 00 00               	movl	$0x7, %eax
  8b2b95: 31 c9                        	xorl	%ecx, %ecx
  8b2b97: 0f a2                        	cpuid
  8b2b99: b8 01 00 00 00               	movl	$0x1, %eax
  8b2b9e: 89 de                        	movl	%ebx, %esi
  8b2ba0: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b2ba4: 31 c9                        	xorl	%ecx, %ecx
  8b2ba6: 0f a2                        	cpuid
  8b2ba8: 89 cf                        	movl	%ecx, %edi
  8b2baa: e9 3b ff ff ff               	jmp	0x8b2aea <PyInit_pyo3_async_runtimes+0x21e86a>
  8b2baf: 90                           	nop
  8b2bb0: 81 e7 ff f7 ff ff            	andl	$0xfffff7ff, %edi       # imm = 0xFFFFF7FF
  8b2bb6: eb bf                        	jmp	0x8b2b77 <PyInit_pyo3_async_runtimes+0x21e8f7>
  8b2bb8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  8b2bc0: 83 f8 06                     	cmpl	$0x6, %eax
  8b2bc3: 77 2b                        	ja	0x8b2bf0 <PyInit_pyo3_async_runtimes+0x21e970>
  8b2bc5: b8 01 00 00 00               	movl	$0x1, %eax
  8b2bca: 31 c9                        	xorl	%ecx, %ecx
  8b2bcc: 0f a2                        	cpuid
  8b2bce: 89 c6                        	movl	%eax, %esi
  8b2bd0: 89 cf                        	movl	%ecx, %edi
  8b2bd2: f7 d6                        	notl	%esi
  8b2bd4: 81 e6 00 0f 00 00            	andl	$0xf00, %esi            # imm = 0xF00
  8b2bda: 74 42                        	je	0x8b2c1e <PyInit_pyo3_async_runtimes+0x21e99e>
  8b2bdc: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8b2be2: 31 f6                        	xorl	%esi, %esi
  8b2be4: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b2be8: e9 0e fe ff ff               	jmp	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2bed: 0f 1f 00                     	nopl	(%rax)
  8b2bf0: b8 07 00 00 00               	movl	$0x7, %eax
  8b2bf5: 31 c9                        	xorl	%ecx, %ecx
  8b2bf7: 0f a2                        	cpuid
  8b2bf9: b8 01 00 00 00               	movl	$0x1, %eax
  8b2bfe: 89 de                        	movl	%ebx, %esi
  8b2c00: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b2c04: 31 c9                        	xorl	%ecx, %ecx
  8b2c06: 0f a2                        	cpuid
  8b2c08: 89 cf                        	movl	%ecx, %edi
  8b2c0a: 89 c1                        	movl	%eax, %ecx
  8b2c0c: f7 d1                        	notl	%ecx
  8b2c0e: 80 e5 0f                     	andb	$0xf, %ch
  8b2c11: 74 1d                        	je	0x8b2c30 <PyInit_pyo3_async_runtimes+0x21e9b0>
  8b2c13: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8b2c19: e9 dd fd ff ff               	jmp	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2c1e: 31 f6                        	xorl	%esi, %esi
  8b2c20: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b2c24: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8b2c2f: 90                           	nop
  8b2c30: c1 e8 14                     	shrl	$0x14, %eax
  8b2c33: 0f b6 c0                     	movzbl	%al, %eax
  8b2c36: 83 e8 09                     	subl	$0x9, %eax
  8b2c39: 83 f8 e7                     	cmpl	$-0x19, %eax
  8b2c3c: 0f 86 b9 fd ff ff            	jbe	0x8b29fb <PyInit_pyo3_async_runtimes+0x21e77b>
  8b2c42: eb cf                        	jmp	0x8b2c13 <PyInit_pyo3_async_runtimes+0x21e993>
