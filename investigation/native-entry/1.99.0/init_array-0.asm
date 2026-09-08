
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  829400: c3                           	retq
  829401: cc                           	int3
  829402: cc                           	int3
  829403: cc                           	int3
  829404: cc                           	int3
  829405: cc                           	int3
  829406: cc                           	int3
  829407: cc                           	int3
  829408: cc                           	int3
  829409: cc                           	int3
  82940a: cc                           	int3
  82940b: cc                           	int3
  82940c: cc                           	int3
  82940d: cc                           	int3
  82940e: cc                           	int3
  82940f: cc                           	int3
  829410: 55                           	pushq	%rbp
  829411: 48 89 e5                     	movq	%rsp, %rbp
  829414: 48 83 ec 10                  	subq	$0x10, %rsp
  829418: 8b 46 10                     	movl	0x10(%rsi), %eax
  82941b: a9 00 00 00 02               	testl	$0x2000000, %eax        # imm = 0x2000000
  829420: 0f 85 97 00 00 00            	jne	0x8294bd <PyInit_pyo3_async_runtimes+0x18fe5d>
  829426: a9 00 00 00 04               	testl	$0x4000000, %eax        # imm = 0x4000000
  82942b: 0f 85 ca 00 00 00            	jne	0x8294fb <PyInit_pyo3_async_runtimes+0x18fe9b>
  829431: 0f b6 0f                     	movzbl	(%rdi), %ecx
  829434: b8 03 00 00 00               	movl	$0x3, %eax
  829439: 89 ca                        	movl	%ecx, %edx
  82943b: 80 f9 0a                     	cmpb	$0xa, %cl
  82943e: 72 2c                        	jb	0x82946c <PyInit_pyo3_async_runtimes+0x18fe0c>
  829440: 0f b6 c1                     	movzbl	%cl, %eax
  829443: 8d 14 80                     	leal	(%rax,%rax,4), %edx
  829446: 8d 14 d0                     	leal	(%rax,%rdx,8), %edx
  829449: c1 ea 0c                     	shrl	$0xc, %edx
  82944c: 6b c2 64                     	imull	$0x64, %edx, %eax
  82944f: 89 cf                        	movl	%ecx, %edi
  829451: 40 28 c7                     	subb	%al, %dil
  829454: 40 0f b6 c7                  	movzbl	%dil, %eax
  829458: 48 8d 3d b3 97 90 ff         	leaq	-0x6f684d(%rip), %rdi   # 0x132c12
  82945f: 0f b7 04 47                  	movzwl	(%rdi,%rax,2), %eax
  829463: 66 89 45 fc                  	movw	%ax, -0x4(%rbp)
  829467: b8 01 00 00 00               	movl	$0x1, %eax
  82946c: 84 d2                        	testb	%dl, %dl
  82946e: 40 0f 94 c7                  	sete	%dil
  829472: 84 c9                        	testb	%cl, %cl
  829474: 0f 95 c1                     	setne	%cl
  829477: 40 84 f9                     	testb	%dil, %cl
  82947a: 75 16                        	jne	0x829492 <PyInit_pyo3_async_runtimes+0x18fe32>
  82947c: 0f b6 ca                     	movzbl	%dl, %ecx
  82947f: 48 8d 15 8c 97 90 ff         	leaq	-0x6f6874(%rip), %rdx   # 0x132c12
  829486: 0f b6 4c 4a 01               	movzbl	0x1(%rdx,%rcx,2), %ecx
  82948b: 88 4c 05 fa                  	movb	%cl, -0x6(%rbp,%rax)
  82948f: 48 ff c8                     	decq	%rax
  829492: 41 b9 03 00 00 00            	movl	$0x3, %r9d
  829498: 49 29 c1                     	subq	%rax, %r9
  82949b: 4c 8d 04 28                  	leaq	(%rax,%rbp), %r8
  82949f: 49 83 c0 fb                  	addq	$-0x5, %r8
  8294a3: ba 01 00 00 00               	movl	$0x1, %edx
  8294a8: 48 89 f7                     	movq	%rsi, %rdi
  8294ab: be 01 00 00 00               	movl	$0x1, %esi
  8294b0: 31 c9                        	xorl	%ecx, %ecx
  8294b2: e8 59 cb d2 ff               	callq	0x556010 <PyInit__native+0x2db510>
  8294b7: 48 83 c4 10                  	addq	$0x10, %rsp
  8294bb: 5d                           	popq	%rbp
  8294bc: c3                           	retq
  8294bd: 0f b6 07                     	movzbl	(%rdi), %eax
  8294c0: bf 03 00 00 00               	movl	$0x3, %edi
  8294c5: 48 8d 0d 14 44 88 ff         	leaq	-0x77bbec(%rip), %rcx   # 0xad8e0
  8294cc: 0f 1f 40 00                  	nopl	(%rax)
  8294d0: 48 89 fa                     	movq	%rdi, %rdx
  8294d3: 0f b6 f8                     	movzbl	%al, %edi
  8294d6: c0 e8 04                     	shrb	$0x4, %al
  8294d9: 83 e7 0f                     	andl	$0xf, %edi
  8294dc: 0f b6 3c 0f                  	movzbl	(%rdi,%rcx), %edi
  8294e0: 40 88 7c 15 fc               	movb	%dil, -0x4(%rbp,%rdx)
  8294e5: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  8294e9: 84 c0                        	testb	%al, %al
  8294eb: 75 e3                        	jne	0x8294d0 <PyInit_pyo3_async_runtimes+0x18fe70>
  8294ed: 48 83 c2 fe                  	addq	$-0x2, %rdx
  8294f1: 4c 8d 04 2a                  	leaq	(%rdx,%rbp), %r8
  8294f5: 49 83 c0 fe                  	addq	$-0x2, %r8
  8294f9: eb 3e                        	jmp	0x829539 <PyInit_pyo3_async_runtimes+0x18fed9>
  8294fb: 0f b6 07                     	movzbl	(%rdi), %eax
  8294fe: bf 03 00 00 00               	movl	$0x3, %edi
  829503: 48 8d 0d 26 21 88 ff         	leaq	-0x77deda(%rip), %rcx   # 0xab630
  82950a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  829510: 48 89 fa                     	movq	%rdi, %rdx
  829513: 0f b6 f8                     	movzbl	%al, %edi
  829516: c0 e8 04                     	shrb	$0x4, %al
  829519: 83 e7 0f                     	andl	$0xf, %edi
  82951c: 0f b6 3c 0f                  	movzbl	(%rdi,%rcx), %edi
  829520: 40 88 7c 15 f7               	movb	%dil, -0x9(%rbp,%rdx)
  829525: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  829529: 84 c0                        	testb	%al, %al
  82952b: 75 e3                        	jne	0x829510 <PyInit_pyo3_async_runtimes+0x18feb0>
  82952d: 48 83 c2 fe                  	addq	$-0x2, %rdx
  829531: 4c 8d 04 2a                  	leaq	(%rdx,%rbp), %r8
  829535: 49 83 c0 f9                  	addq	$-0x7, %r8
  829539: 41 b9 03 00 00 00            	movl	$0x3, %r9d
  82953f: 49 29 f9                     	subq	%rdi, %r9
  829542: 48 8d 15 34 c2 90 ff         	leaq	-0x6f3dcc(%rip), %rdx   # 0x13577d
  829549: b9 02 00 00 00               	movl	$0x2, %ecx
  82954e: 48 89 f7                     	movq	%rsi, %rdi
  829551: be 01 00 00 00               	movl	$0x1, %esi
  829556: e8 b5 ca d2 ff               	callq	0x556010 <PyInit__native+0x2db510>
  82955b: 48 83 c4 10                  	addq	$0x10, %rsp
  82955f: 5d                           	popq	%rbp
  829560: c3                           	retq
  829561: 55                           	pushq	%rbp
  829562: 48 89 e5                     	movq	%rsp, %rbp
  829565: 48 83 ec 10                  	subq	$0x10, %rsp
  829569: 4c 89 c8                     	movq	%r9, %rax
  82956c: 4d 89 c2                     	movq	%r8, %r10
  82956f: 49 89 c9                     	movq	%rcx, %r9
  829572: 4c 8d 45 f8                  	leaq	-0x8(%rbp), %r8
  829576: 49 89 30                     	movq	%rsi, (%r8)
  829579: 48 8d 4d f0                  	leaq	-0x10(%rbp), %rcx
  82957d: 48 89 11                     	movq	%rdx, (%rcx)
  829580: 48 8d 15 49 49 2b 00         	leaq	0x2b4949(%rip), %rdx    # 0xadded0
  829587: 4c 89 c6                     	movq	%r8, %rsi
  82958a: 49 89 d0                     	movq	%rdx, %r8
  82958d: 50                           	pushq	%rax
  82958e: 41 52                        	pushq	%r10
  829590: e8 5e bd d2 ff               	callq	0x5552f3 <PyInit__native+0x2da7f3>
  829595: cc                           	int3
  829596: cc                           	int3
  829597: cc                           	int3
  829598: cc                           	int3
  829599: cc                           	int3
  82959a: cc                           	int3
  82959b: cc                           	int3
  82959c: cc                           	int3
  82959d: cc                           	int3
  82959e: cc                           	int3
  82959f: cc                           	int3
  8295a0: 55                           	pushq	%rbp
  8295a1: 48 89 e5                     	movq	%rsp, %rbp
  8295a4: 48 83 ec 10                  	subq	$0x10, %rsp
  8295a8: 48 8b 3f                     	movq	(%rdi), %rdi
  8295ab: 8b 46 10                     	movl	0x10(%rsi), %eax
  8295ae: a9 00 00 00 02               	testl	$0x2000000, %eax        # imm = 0x2000000
  8295b3: 75 11                        	jne	0x8295c6 <PyInit_pyo3_async_runtimes+0x18ff66>
  8295b5: a9 00 00 00 04               	testl	$0x4000000, %eax        # imm = 0x4000000
  8295ba: 75 44                        	jne	0x829600 <PyInit_pyo3_async_runtimes+0x18ffa0>
  8295bc: 48 83 c4 10                  	addq	$0x10, %rsp
  8295c0: 5d                           	popq	%rbp
  8295c1: e9 6a 5d d3 ff               	jmp	0x55f330 <PyInit__native+0x2e4830>
  8295c6: 44 8b 07                     	movl	(%rdi), %r8d
  8295c9: b9 09 00 00 00               	movl	$0x9, %ecx
  8295ce: 48 8d 05 0b 43 88 ff         	leaq	-0x77bcf5(%rip), %rax   # 0xad8e0
  8295d5: 44 89 c7                     	movl	%r8d, %edi
  8295d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  8295e0: 48 89 ca                     	movq	%rcx, %rdx
  8295e3: c1 ef 04                     	shrl	$0x4, %edi
  8295e6: 41 83 e0 0f                  	andl	$0xf, %r8d
  8295ea: 41 0f b6 0c 00               	movzbl	(%r8,%rax), %ecx
  8295ef: 88 4c 15 f6                  	movb	%cl, -0xa(%rbp,%rdx)
  8295f3: 48 8d 4a ff                  	leaq	-0x1(%rdx), %rcx
  8295f7: 41 89 f8                     	movl	%edi, %r8d
  8295fa: 85 ff                        	testl	%edi, %edi
  8295fc: 75 e2                        	jne	0x8295e0 <PyInit_pyo3_async_runtimes+0x18ff80>
  8295fe: eb 3e                        	jmp	0x82963e <PyInit_pyo3_async_runtimes+0x18ffde>
