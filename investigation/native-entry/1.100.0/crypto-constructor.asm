
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  8b55a0: 55                           	pushq	%rbp
  8b55a1: 31 c0                        	xorl	%eax, %eax
  8b55a3: 53                           	pushq	%rbx
  8b55a4: 48 83 ec 08                  	subq	$0x8, %rsp
  8b55a8: 31 c9                        	xorl	%ecx, %ecx
  8b55aa: 0f a2                        	cpuid
  8b55ac: 41 89 d0                     	movl	%edx, %r8d
  8b55af: 41 89 c9                     	movl	%ecx, %r9d
  8b55b2: 81 fb 47 65 6e 75            	cmpl	$0x756e6547, %ebx       # imm = 0x756E6547
  8b55b8: 0f 84 12 01 00 00            	je	0x8b56d0 <PyInit_pyo3_async_runtimes+0x215e40>
  8b55be: 81 fa 65 6e 74 69            	cmpl	$0x69746e65, %edx       # imm = 0x69746E65
  8b55c4: 0f 94 c1                     	sete	%cl
  8b55c7: 81 fb 41 75 74 68            	cmpl	$0x68747541, %ebx       # imm = 0x68747541
  8b55cd: 0f 94 c2                     	sete	%dl
  8b55d0: 84 d1                        	testb	%dl, %cl
  8b55d2: 74 0d                        	je	0x8b55e1 <PyInit_pyo3_async_runtimes+0x215d51>
  8b55d4: 41 81 f9 63 41 4d 44         	cmpl	$0x444d4163, %r9d       # imm = 0x444D4163
  8b55db: 0f 84 df 01 00 00            	je	0x8b57c0 <PyInit_pyo3_async_runtimes+0x215f30>
  8b55e1: 83 f8 06                     	cmpl	$0x6, %eax
  8b55e4: 0f 87 b6 00 00 00            	ja	0x8b56a0 <PyInit_pyo3_async_runtimes+0x215e10>
  8b55ea: b8 01 00 00 00               	movl	$0x1, %eax
  8b55ef: 31 c9                        	xorl	%ecx, %ecx
  8b55f1: 0f a2                        	cpuid
  8b55f3: 31 f6                        	xorl	%esi, %esi
  8b55f5: 89 cf                        	movl	%ecx, %edi
  8b55f7: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b55fb: 81 e2 ff ff ef bf            	andl	$0xbfefffff, %edx       # imm = 0xBFEFFFFF
  8b5601: 81 ca 00 00 00 10            	orl	$0x10000000, %edx       # imm = 0x10000000
  8b5607: 66 0f 6e c2                  	movd	%edx, %xmm0
  8b560b: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8b5611: 0f 85 3f 01 00 00            	jne	0x8b5756 <PyInit_pyo3_async_runtimes+0x215ec6>
  8b5617: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8b561d: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b5623: f7 c7 00 00 00 04            	testl	$0x4000000, %edi        # imm = 0x4000000
  8b5629: 0f 84 12 01 00 00            	je	0x8b5741 <PyInit_pyo3_async_runtimes+0x215eb1>
  8b562f: 66 0f 6e df                  	movd	%edi, %xmm3
  8b5633: 66 0f 6e d6                  	movd	%esi, %xmm2
  8b5637: 48 8d 2d 32 83 24 00         	leaq	0x248332(%rip), %rbp    # 0xafd970
  8b563e: 48 8d 05 23 83 24 00         	leaq	0x248323(%rip), %rax    # 0xafd968
  8b5645: 66 0f 62 d1                  	punpckldq	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
  8b5649: 66 0f 62 c3                  	punpckldq	%xmm3, %xmm0    # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
  8b564d: 48 8d 3d 9f 27 82 ff         	leaq	-0x7dd861(%rip), %rdi   # 0xd7df3 ; rodata: 'OPENSSL_ia32cap'
  8b5654: 66 0f 6c c2                  	punpcklqdq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0]
  8b5658: c6 00 01                     	movb	$0x1, (%rax)
  8b565b: 0f 11 45 00                  	movups	%xmm0, (%rbp)
  8b565f: e8 7c 88 20 00               	callq	0xabdee0 <getenv@plt>
  8b5664: 48 89 c3                     	movq	%rax, %rbx
  8b5667: 48 85 c0                     	testq	%rax, %rax
  8b566a: 74 54                        	je	0x8b56c0 <PyInit_pyo3_async_runtimes+0x215e30>
  8b566c: 48 89 c6                     	movq	%rax, %rsi
  8b566f: 48 89 ef                     	movq	%rbp, %rdi
  8b5672: e8 19 d4 fd ff               	callq	0x892a90 <PyInit_pyo3_async_runtimes+0x1f3200>
  8b5677: be 3a 00 00 00               	movl	$0x3a, %esi
  8b567c: 48 89 df                     	movq	%rbx, %rdi
  8b567f: e8 bc 88 20 00               	callq	0xabdf40 <strchr@plt>
  8b5684: 48 85 c0                     	testq	%rax, %rax
  8b5687: 74 37                        	je	0x8b56c0 <PyInit_pyo3_async_runtimes+0x215e30>
  8b5689: 48 83 c4 08                  	addq	$0x8, %rsp
  8b568d: 48 8d 7d 08                  	leaq	0x8(%rbp), %rdi
  8b5691: 48 8d 70 01                  	leaq	0x1(%rax), %rsi
  8b5695: 5b                           	popq	%rbx
  8b5696: 5d                           	popq	%rbp
  8b5697: e9 f4 d3 fd ff               	jmp	0x892a90 <PyInit_pyo3_async_runtimes+0x1f3200>
  8b569c: 0f 1f 40 00                  	nopl	(%rax)
  8b56a0: b8 07 00 00 00               	movl	$0x7, %eax
  8b56a5: 31 c9                        	xorl	%ecx, %ecx
  8b56a7: 0f a2                        	cpuid
  8b56a9: b8 01 00 00 00               	movl	$0x1, %eax
  8b56ae: 89 de                        	movl	%ebx, %esi
  8b56b0: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b56b4: 31 c9                        	xorl	%ecx, %ecx
  8b56b6: 0f a2                        	cpuid
  8b56b8: 89 cf                        	movl	%ecx, %edi
  8b56ba: e9 3c ff ff ff               	jmp	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b56bf: 90                           	nop
  8b56c0: 48 83 c4 08                  	addq	$0x8, %rsp
  8b56c4: 5b                           	popq	%rbx
  8b56c5: 5d                           	popq	%rbp
  8b56c6: c3                           	retq
  8b56c7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
  8b56d0: 83 f8 06                     	cmpl	$0x6, %eax
  8b56d3: 0f 87 b7 00 00 00            	ja	0x8b5790 <PyInit_pyo3_async_runtimes+0x215f00>
  8b56d9: b8 01 00 00 00               	movl	$0x1, %eax
  8b56de: 31 c9                        	xorl	%ecx, %ecx
  8b56e0: 0f a2                        	cpuid
  8b56e2: 31 f6                        	xorl	%esi, %esi
  8b56e4: 89 cf                        	movl	%ecx, %edi
  8b56e6: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b56ea: 89 d1                        	movl	%edx, %ecx
  8b56ec: 81 e1 ff ff ef ff            	andl	$0xffefffff, %ecx       # imm = 0xFFEFFFFF
  8b56f2: 41 81 f9 6e 74 65 6c         	cmpl	$0x6c65746e, %r9d       # imm = 0x6C65746E
  8b56f9: 0f 85 fc fe ff ff            	jne	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b56ff: 41 81 f8 69 6e 65 49         	cmpl	$0x49656e69, %r8d       # imm = 0x49656E69
  8b5706: 0f 85 ef fe ff ff            	jne	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b570c: 81 c9 00 00 00 50            	orl	$0x50000000, %ecx       # imm = 0x50000000
  8b5712: 25 f0 0f ff 0f               	andl	$0xfff0ff0, %eax        # imm = 0xFFF0FF0
  8b5717: 66 0f 6e c1                  	movd	%ecx, %xmm0
  8b571b: 3d 70 06 05 00               	cmpl	$0x50670, %eax          # imm = 0x50670
  8b5720: 74 0b                        	je	0x8b572d <PyInit_pyo3_async_runtimes+0x215e9d>
  8b5722: 3d 50 06 08 00               	cmpl	$0x80650, %eax          # imm = 0x80650
  8b5727: 0f 85 de fe ff ff            	jne	0x8b560b <PyInit_pyo3_async_runtimes+0x215d7b>
  8b572d: f7 c7 00 00 00 08            	testl	$0x8000000, %edi        # imm = 0x8000000
  8b5733: 75 1b                        	jne	0x8b5750 <PyInit_pyo3_async_runtimes+0x215ec0>
  8b5735: 81 e7 ff e7 ff eb            	andl	$0xebffe7ff, %edi       # imm = 0xEBFFE7FF
  8b573b: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b5741: 81 e6 ff ff f7 ff            	andl	$0xfff7ffff, %esi       # imm = 0xFFF7FFFF
  8b5747: e9 e3 fe ff ff               	jmp	0x8b562f <PyInit_pyo3_async_runtimes+0x215d9f>
  8b574c: 0f 1f 40 00                  	nopl	(%rax)
  8b5750: 81 e7 ff ff ff fb            	andl	$0xfbffffff, %edi       # imm = 0xFBFFFFFF
  8b5756: 31 c9                        	xorl	%ecx, %ecx
  8b5758: 0f 01 d0                     	xgetbv
  8b575b: 89 c0                        	movl	%eax, %eax
  8b575d: 48 c1 e2 20                  	shlq	$0x20, %rdx
  8b5761: 48 09 c2                     	orq	%rax, %rdx
  8b5764: 48 f7 d0                     	notq	%rax
  8b5767: a8 06                        	testb	$0x6, %al
  8b5769: 74 45                        	je	0x8b57b0 <PyInit_pyo3_async_runtimes+0x215f20>
  8b576b: 81 e7 ff e7 ff ef            	andl	$0xefffe7ff, %edi       # imm = 0xEFFFE7FF
  8b5771: 81 e6 df ff de 3f            	andl	$0x3fdeffdf, %esi       # imm = 0x3FDEFFDF
  8b5777: 89 f0                        	movl	%esi, %eax
  8b5779: 48 f7 d2                     	notq	%rdx
  8b577c: 25 ff ff fe ff               	andl	$0xfffeffff, %eax       # imm = 0xFFFEFFFF
  8b5781: 81 e2 e6 00 00 00            	andl	$0xe6, %edx
  8b5787: 0f 45 f0                     	cmovnel	%eax, %esi
  8b578a: e9 94 fe ff ff               	jmp	0x8b5623 <PyInit_pyo3_async_runtimes+0x215d93>
  8b578f: 90                           	nop
  8b5790: b8 07 00 00 00               	movl	$0x7, %eax
  8b5795: 31 c9                        	xorl	%ecx, %ecx
  8b5797: 0f a2                        	cpuid
  8b5799: b8 01 00 00 00               	movl	$0x1, %eax
  8b579e: 89 de                        	movl	%ebx, %esi
  8b57a0: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b57a4: 31 c9                        	xorl	%ecx, %ecx
  8b57a6: 0f a2                        	cpuid
  8b57a8: 89 cf                        	movl	%ecx, %edi
  8b57aa: e9 3b ff ff ff               	jmp	0x8b56ea <PyInit_pyo3_async_runtimes+0x215e5a>
  8b57af: 90                           	nop
  8b57b0: 81 e7 ff f7 ff ff            	andl	$0xfffff7ff, %edi       # imm = 0xFFFFF7FF
  8b57b6: eb bf                        	jmp	0x8b5777 <PyInit_pyo3_async_runtimes+0x215ee7>
  8b57b8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  8b57c0: 83 f8 06                     	cmpl	$0x6, %eax
  8b57c3: 77 2b                        	ja	0x8b57f0 <PyInit_pyo3_async_runtimes+0x215f60>
  8b57c5: b8 01 00 00 00               	movl	$0x1, %eax
  8b57ca: 31 c9                        	xorl	%ecx, %ecx
  8b57cc: 0f a2                        	cpuid
  8b57ce: 89 c6                        	movl	%eax, %esi
  8b57d0: 89 cf                        	movl	%ecx, %edi
  8b57d2: f7 d6                        	notl	%esi
  8b57d4: 81 e6 00 0f 00 00            	andl	$0xf00, %esi            # imm = 0xF00
  8b57da: 74 42                        	je	0x8b581e <PyInit_pyo3_async_runtimes+0x215f8e>
  8b57dc: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8b57e2: 31 f6                        	xorl	%esi, %esi
  8b57e4: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b57e8: e9 0e fe ff ff               	jmp	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b57ed: 0f 1f 00                     	nopl	(%rax)
  8b57f0: b8 07 00 00 00               	movl	$0x7, %eax
  8b57f5: 31 c9                        	xorl	%ecx, %ecx
  8b57f7: 0f a2                        	cpuid
  8b57f9: b8 01 00 00 00               	movl	$0x1, %eax
  8b57fe: 89 de                        	movl	%ebx, %esi
  8b5800: 66 0f 6e c9                  	movd	%ecx, %xmm1
  8b5804: 31 c9                        	xorl	%ecx, %ecx
  8b5806: 0f a2                        	cpuid
  8b5808: 89 cf                        	movl	%ecx, %edi
  8b580a: 89 c1                        	movl	%eax, %ecx
  8b580c: f7 d1                        	notl	%ecx
  8b580e: 80 e5 0f                     	andb	$0xf, %ch
  8b5811: 74 1d                        	je	0x8b5830 <PyInit_pyo3_async_runtimes+0x215fa0>
  8b5813: 81 e7 ff ff ff bf            	andl	$0xbfffffff, %edi       # imm = 0xBFFFFFFF
  8b5819: e9 dd fd ff ff               	jmp	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b581e: 31 f6                        	xorl	%esi, %esi
  8b5820: 66 0f ef c9                  	pxor	%xmm1, %xmm1
  8b5824: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8b582f: 90                           	nop
  8b5830: c1 e8 14                     	shrl	$0x14, %eax
  8b5833: 0f b6 c0                     	movzbl	%al, %eax
  8b5836: 83 e8 09                     	subl	$0x9, %eax
  8b5839: 83 f8 e7                     	cmpl	$-0x19, %eax
  8b583c: 0f 86 b9 fd ff ff            	jbe	0x8b55fb <PyInit_pyo3_async_runtimes+0x215d6b>
  8b5842: eb cf                        	jmp	0x8b5813 <PyInit_pyo3_async_runtimes+0x215f83>
