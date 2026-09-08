
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  8317b0: c3                           	retq
  8317b1: cc                           	int3
  8317b2: cc                           	int3
  8317b3: cc                           	int3
  8317b4: cc                           	int3
  8317b5: cc                           	int3
  8317b6: cc                           	int3
  8317b7: cc                           	int3
  8317b8: cc                           	int3
  8317b9: cc                           	int3
  8317ba: cc                           	int3
  8317bb: cc                           	int3
  8317bc: cc                           	int3
  8317bd: cc                           	int3
  8317be: cc                           	int3
  8317bf: cc                           	int3
  8317c0: 55                           	pushq	%rbp
  8317c1: 48 89 e5                     	movq	%rsp, %rbp
  8317c4: 48 83 ec 10                  	subq	$0x10, %rsp
  8317c8: 8b 46 10                     	movl	0x10(%rsi), %eax
  8317cb: a9 00 00 00 02               	testl	$0x2000000, %eax        # imm = 0x2000000
  8317d0: 0f 85 97 00 00 00            	jne	0x83186d <PyInit_pyo3_async_runtimes+0x191fdd>
  8317d6: a9 00 00 00 04               	testl	$0x4000000, %eax        # imm = 0x4000000
  8317db: 0f 85 ca 00 00 00            	jne	0x8318ab <PyInit_pyo3_async_runtimes+0x19201b>
  8317e1: 0f b6 0f                     	movzbl	(%rdi), %ecx
  8317e4: b8 03 00 00 00               	movl	$0x3, %eax
  8317e9: 89 ca                        	movl	%ecx, %edx
  8317eb: 80 f9 0a                     	cmpb	$0xa, %cl
  8317ee: 72 2c                        	jb	0x83181c <PyInit_pyo3_async_runtimes+0x191f8c>
  8317f0: 0f b6 c1                     	movzbl	%cl, %eax
  8317f3: 8d 14 80                     	leal	(%rax,%rax,4), %edx
  8317f6: 8d 14 d0                     	leal	(%rax,%rdx,8), %edx
  8317f9: c1 ea 0c                     	shrl	$0xc, %edx
  8317fc: 6b c2 64                     	imull	$0x64, %edx, %eax
  8317ff: 89 cf                        	movl	%ecx, %edi
  831801: 40 28 c7                     	subb	%al, %dil
  831804: 40 0f b6 c7                  	movzbl	%dil, %eax
  831808: 48 8d 3d 3b 28 90 ff         	leaq	-0x6fd7c5(%rip), %rdi   # 0x13404a
  83180f: 0f b7 04 47                  	movzwl	(%rdi,%rax,2), %eax
  831813: 66 89 45 fc                  	movw	%ax, -0x4(%rbp)
  831817: b8 01 00 00 00               	movl	$0x1, %eax
  83181c: 84 d2                        	testb	%dl, %dl
  83181e: 40 0f 94 c7                  	sete	%dil
  831822: 84 c9                        	testb	%cl, %cl
  831824: 0f 95 c1                     	setne	%cl
  831827: 40 84 f9                     	testb	%dil, %cl
  83182a: 75 16                        	jne	0x831842 <PyInit_pyo3_async_runtimes+0x191fb2>
  83182c: 0f b6 ca                     	movzbl	%dl, %ecx
  83182f: 48 8d 15 14 28 90 ff         	leaq	-0x6fd7ec(%rip), %rdx   # 0x13404a
  831836: 0f b6 4c 4a 01               	movzbl	0x1(%rdx,%rcx,2), %ecx
  83183b: 88 4c 05 fa                  	movb	%cl, -0x6(%rbp,%rax)
  83183f: 48 ff c8                     	decq	%rax
  831842: 41 b9 03 00 00 00            	movl	$0x3, %r9d
  831848: 49 29 c1                     	subq	%rax, %r9
  83184b: 4c 8d 04 28                  	leaq	(%rax,%rbp), %r8
  83184f: 49 83 c0 fb                  	addq	$-0x5, %r8
  831853: ba 01 00 00 00               	movl	$0x1, %edx
  831858: 48 89 f7                     	movq	%rsi, %rdi
  83185b: be 01 00 00 00               	movl	$0x1, %esi
  831860: 31 c9                        	xorl	%ecx, %ecx
  831862: e8 d9 10 d4 ff               	callq	0x572940 <PyInit__native+0x2f6240>
  831867: 48 83 c4 10                  	addq	$0x10, %rsp
  83186b: 5d                           	popq	%rbp
  83186c: c3                           	retq
  83186d: 0f b6 07                     	movzbl	(%rdi), %eax
  831870: bf 03 00 00 00               	movl	$0x3, %edi
  831875: 48 8d 0d 94 c1 87 ff         	leaq	-0x783e6c(%rip), %rcx   # 0xada10
  83187c: 0f 1f 40 00                  	nopl	(%rax)
  831880: 48 89 fa                     	movq	%rdi, %rdx
  831883: 0f b6 f8                     	movzbl	%al, %edi
  831886: c0 e8 04                     	shrb	$0x4, %al
  831889: 83 e7 0f                     	andl	$0xf, %edi
  83188c: 0f b6 3c 0f                  	movzbl	(%rdi,%rcx), %edi
  831890: 40 88 7c 15 fc               	movb	%dil, -0x4(%rbp,%rdx)
  831895: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  831899: 84 c0                        	testb	%al, %al
  83189b: 75 e3                        	jne	0x831880 <PyInit_pyo3_async_runtimes+0x191ff0>
  83189d: 48 83 c2 fe                  	addq	$-0x2, %rdx
  8318a1: 4c 8d 04 2a                  	leaq	(%rdx,%rbp), %r8
  8318a5: 49 83 c0 fe                  	addq	$-0x2, %r8
  8318a9: eb 3e                        	jmp	0x8318e9 <PyInit_pyo3_async_runtimes+0x192059>
  8318ab: 0f b6 07                     	movzbl	(%rdi), %eax
  8318ae: bf 03 00 00 00               	movl	$0x3, %edi
  8318b3: 48 8d 0d e6 9e 87 ff         	leaq	-0x78611a(%rip), %rcx   # 0xab7a0
  8318ba: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8318c0: 48 89 fa                     	movq	%rdi, %rdx
  8318c3: 0f b6 f8                     	movzbl	%al, %edi
  8318c6: c0 e8 04                     	shrb	$0x4, %al
  8318c9: 83 e7 0f                     	andl	$0xf, %edi
  8318cc: 0f b6 3c 0f                  	movzbl	(%rdi,%rcx), %edi
  8318d0: 40 88 7c 15 f7               	movb	%dil, -0x9(%rbp,%rdx)
  8318d5: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  8318d9: 84 c0                        	testb	%al, %al
  8318db: 75 e3                        	jne	0x8318c0 <PyInit_pyo3_async_runtimes+0x192030>
  8318dd: 48 83 c2 fe                  	addq	$-0x2, %rdx
  8318e1: 4c 8d 04 2a                  	leaq	(%rdx,%rbp), %r8
  8318e5: 49 83 c0 f9                  	addq	$-0x7, %r8
  8318e9: 41 b9 03 00 00 00            	movl	$0x3, %r9d
  8318ef: 49 29 f9                     	subq	%rdi, %r9
  8318f2: 48 8d 15 bc 52 90 ff         	leaq	-0x6fad44(%rip), %rdx   # 0x136bb5
  8318f9: b9 02 00 00 00               	movl	$0x2, %ecx
  8318fe: 48 89 f7                     	movq	%rsi, %rdi
  831901: be 01 00 00 00               	movl	$0x1, %esi
  831906: e8 35 10 d4 ff               	callq	0x572940 <PyInit__native+0x2f6240>
  83190b: 48 83 c4 10                  	addq	$0x10, %rsp
  83190f: 5d                           	popq	%rbp
  831910: c3                           	retq
  831911: 55                           	pushq	%rbp
  831912: 48 89 e5                     	movq	%rsp, %rbp
  831915: 48 83 ec 10                  	subq	$0x10, %rsp
  831919: 4c 89 c8                     	movq	%r9, %rax
  83191c: 4d 89 c2                     	movq	%r8, %r10
  83191f: 49 89 c9                     	movq	%rcx, %r9
  831922: 4c 8d 45 f8                  	leaq	-0x8(%rbp), %r8
  831926: 49 89 30                     	movq	%rsi, (%r8)
  831929: 48 8d 4d f0                  	leaq	-0x10(%rbp), %rcx
  83192d: 48 89 11                     	movq	%rdx, (%rcx)
  831930: 48 8d 15 c1 4e 2b 00         	leaq	0x2b4ec1(%rip), %rdx    # 0xae67f8
  831937: 4c 89 c6                     	movq	%r8, %rsi
  83193a: 49 89 d0                     	movq	%rdx, %r8
  83193d: 50                           	pushq	%rax
  83193e: 41 52                        	pushq	%r10
  831940: e8 de 02 d4 ff               	callq	0x571c23 <PyInit__native+0x2f5523>
  831945: cc                           	int3
  831946: cc                           	int3
  831947: cc                           	int3
  831948: cc                           	int3
  831949: cc                           	int3
  83194a: cc                           	int3
  83194b: cc                           	int3
  83194c: cc                           	int3
  83194d: cc                           	int3
  83194e: cc                           	int3
  83194f: cc                           	int3
  831950: 55                           	pushq	%rbp
  831951: 48 89 e5                     	movq	%rsp, %rbp
  831954: 48 83 ec 10                  	subq	$0x10, %rsp
  831958: 48 8b 3f                     	movq	(%rdi), %rdi
  83195b: 8b 46 10                     	movl	0x10(%rsi), %eax
  83195e: a9 00 00 00 02               	testl	$0x2000000, %eax        # imm = 0x2000000
  831963: 75 11                        	jne	0x831976 <PyInit_pyo3_async_runtimes+0x1920e6>
  831965: a9 00 00 00 04               	testl	$0x4000000, %eax        # imm = 0x4000000
  83196a: 75 44                        	jne	0x8319b0 <PyInit_pyo3_async_runtimes+0x192120>
  83196c: 48 83 c4 10                  	addq	$0x10, %rsp
  831970: 5d                           	popq	%rbp
  831971: e9 ea a2 d4 ff               	jmp	0x57bc60 <PyInit__native+0x2ff560>
  831976: 44 8b 07                     	movl	(%rdi), %r8d
  831979: b9 09 00 00 00               	movl	$0x9, %ecx
  83197e: 48 8d 05 8b c0 87 ff         	leaq	-0x783f75(%rip), %rax   # 0xada10
  831985: 44 89 c7                     	movl	%r8d, %edi
  831988: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  831990: 48 89 ca                     	movq	%rcx, %rdx
  831993: c1 ef 04                     	shrl	$0x4, %edi
  831996: 41 83 e0 0f                  	andl	$0xf, %r8d
  83199a: 41 0f b6 0c 00               	movzbl	(%r8,%rax), %ecx
  83199f: 88 4c 15 f6                  	movb	%cl, -0xa(%rbp,%rdx)
  8319a3: 48 8d 4a ff                  	leaq	-0x1(%rdx), %rcx
  8319a7: 41 89 f8                     	movl	%edi, %r8d
  8319aa: 85 ff                        	testl	%edi, %edi
  8319ac: 75 e2                        	jne	0x831990 <PyInit_pyo3_async_runtimes+0x192100>
  8319ae: eb 3e                        	jmp	0x8319ee <PyInit_pyo3_async_runtimes+0x19215e>
