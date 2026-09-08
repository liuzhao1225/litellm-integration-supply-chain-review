
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c640 <.text>:
  27c6b0: f3 0f 1e fa                  	endbr64
  27c6b4: 80 3d 85 e6 87 00 00         	cmpb	$0x0, 0x87e685(%rip)    # 0xafad40
  27c6bb: 75 2b                        	jne	0x27c6e8 <.text+0xa8>
  27c6bd: 55                           	pushq	%rbp
  27c6be: 48 83 3d aa b1 87 00 00      	cmpq	$0x0, 0x87b1aa(%rip)    # 0xaf7870
  27c6c6: 48 89 e5                     	movq	%rsp, %rbp
  27c6c9: 74 0c                        	je	0x27c6d7 <.text+0x97>
  27c6cb: 48 8d 3d ee 2a 84 00         	leaq	0x842aee(%rip), %rdi    # 0xabf1c0
  27c6d2: e8 c9 16 84 00               	callq	0xabdda0 <__cxa_finalize@plt>
  27c6d7: e8 64 ff ff ff               	callq	0x27c640 <.text>
  27c6dc: c6 05 5d e6 87 00 01         	movb	$0x1, 0x87e65d(%rip)    # 0xafad40
  27c6e3: 5d                           	popq	%rbp
  27c6e4: c3                           	retq
  27c6e5: 0f 1f 00                     	nopl	(%rax)
  27c6e8: c3                           	retq
  27c6e9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27c6f0: f3 0f 1e fa                  	endbr64
  27c6f4: e9 77 ff ff ff               	jmp	0x27c670 <.text+0x30>
  27c6f9: cc                           	int3
  27c6fa: cc                           	int3
  27c6fb: cc                           	int3
  27c6fc: cc                           	int3
  27c6fd: cc                           	int3
  27c6fe: cc                           	int3
  27c6ff: cc                           	int3

000000000027c700 <PyInit__native>:
  27c700: 48 8d 3d c1 d2 87 00         	leaq	0x87d2c1(%rip), %rdi    # 0xaf99c8
  27c707: ff 25 6b b1 87 00            	jmpq	*0x87b16b(%rip)         # 0xaf7878
  27c70d: cc                           	int3
  27c70e: cc                           	int3
  27c70f: cc                           	int3
  27c710: 55                           	pushq	%rbp
  27c711: 41 57                        	pushq	%r15
  27c713: 41 56                        	pushq	%r14
  27c715: 41 55                        	pushq	%r13
  27c717: 41 54                        	pushq	%r12
  27c719: 53                           	pushq	%rbx
  27c71a: 48 81 ec 98 00 00 00         	subq	$0x98, %rsp
  27c721: 89 f5                        	movl	%esi, %ebp
  27c723: 49 89 fc                     	movq	%rdi, %r12
  27c726: 0f b7 1f                     	movzwl	(%rdi), %ebx
  27c729: 48 8b 47 08                  	movq	0x8(%rdi), %rax
  27c72d: 48 89 04 24                  	movq	%rax, (%rsp)
  27c731: 4c 8b 7f 10                  	movq	0x10(%rdi), %r15
  27c735: 4c 8b 77 18                  	movq	0x18(%rdi), %r14
  27c739: 4c 8b 6f 20                  	movq	0x20(%rdi), %r13
  27c73d: bf 02 00 00 00               	movl	$0x2, %edi
  27c742: ff 15 38 b1 87 00            	callq	*0x87b138(%rip)         # 0xaf7880
  27c748: 48 85 c0                     	testq	%rax, %rax
  27c74b: 0f 84 92 00 00 00            	je	0x27c7e3 <PyInit__native+0xe3>
  27c751: 40 88 28                     	movb	%bpl, (%rax)
  27c754: 66 89 5c 24 60               	movw	%bx, 0x60(%rsp)
  27c759: 41 8b 4c 24 02               	movl	0x2(%r12), %ecx
  27c75e: 89 4c 24 62                  	movl	%ecx, 0x62(%rsp)
  27c762: 41 0f b7 4c 24 06            	movzwl	0x6(%r12), %ecx
  27c768: 66 89 4c 24 66               	movw	%cx, 0x66(%rsp)
  27c76d: 48 8b 0c 24                  	movq	(%rsp), %rcx
  27c771: 48 89 4c 24 68               	movq	%rcx, 0x68(%rsp)
  27c776: 4c 89 7c 24 70               	movq	%r15, 0x70(%rsp)
  27c77b: 4c 89 74 24 78               	movq	%r14, 0x78(%rsp)
  27c780: 4c 89 ac 24 80 00 00 00      	movq	%r13, 0x80(%rsp)
  27c788: 48 89 84 24 88 00 00 00      	movq	%rax, 0x88(%rsp)
  27c790: 48 8d 05 b9 55 84 00         	leaq	0x8455b9(%rip), %rax    # 0xac1d50
  27c797: 48 89 84 24 90 00 00 00      	movq	%rax, 0x90(%rsp)
  27c79f: 48 c7 44 24 08 ff ff ff ff   	movq	$-0x1, 0x8(%rsp)
  27c7a8: bf 90 00 00 00               	movl	$0x90, %edi
  27c7ad: ff 15 cd b0 87 00            	callq	*0x87b0cd(%rip)         # 0xaf7880
  27c7b3: 48 85 c0                     	testq	%rax, %rax
  27c7b6: 74 42                        	je	0x27c7fa <PyInit__native+0xfa>
  27c7b8: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  27c7bd: ba 90 00 00 00               	movl	$0x90, %edx
  27c7c2: 48 89 c7                     	movq	%rax, %rdi
  27c7c5: 48 89 c3                     	movq	%rax, %rbx
  27c7c8: ff 15 ba b0 87 00            	callq	*0x87b0ba(%rip)         # 0xaf7888
  27c7ce: 48 89 d8                     	movq	%rbx, %rax
  27c7d1: 48 81 c4 98 00 00 00         	addq	$0x98, %rsp
  27c7d8: 5b                           	popq	%rbx
  27c7d9: 41 5c                        	popq	%r12
  27c7db: 41 5d                        	popq	%r13
  27c7dd: 41 5e                        	popq	%r14
  27c7df: 41 5f                        	popq	%r15
  27c7e1: 5d                           	popq	%rbp
  27c7e2: c3                           	retq
  27c7e3: 89 dd                        	movl	%ebx, %ebp
  27c7e5: 48 8b 1c 24                  	movq	(%rsp), %rbx
  27c7e9: bf 01 00 00 00               	movl	$0x1, %edi
  27c7ee: be 02 00 00 00               	movl	$0x2, %esi
  27c7f3: e8 7a 99 0d 00               	callq	0x356172 <PyInit__native+0xd9a72>
  27c7f8: eb 0f                        	jmp	0x27c809 <PyInit__native+0x109>
  27c7fa: bf 08 00 00 00               	movl	$0x8, %edi
  27c7ff: be 90 00 00 00               	movl	$0x90, %esi
  27c804: e8 69 99 0d 00               	callq	0x356172 <PyInit__native+0xd9a72>
  27c809: 0f 0b                        	ud2
  27c80b: 49 89 c4                     	movq	%rax, %r12
  27c80e: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  27c813: e8 68 7f 43 00               	callq	0x6b4780 <PyInit_pyo3_async_runtimes+0x14ef0>
  27c818: eb 25                        	jmp	0x27c83f <PyInit__native+0x13f>
  27c81a: e8 bd a8 2f 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  27c81f: 49 89 c4                     	movq	%rax, %r12
  27c822: 66 83 fd 03                  	cmpw	$0x3, %bp
  27c826: 0f 95 c0                     	setne	%al
  27c829: 48 85 db                     	testq	%rbx, %rbx
  27c82c: 0f 94 c1                     	sete	%cl
  27c82f: 08 c1                        	orb	%al, %cl
  27c831: 75 0c                        	jne	0x27c83f <PyInit__native+0x13f>
  27c833: 4c 89 ef                     	movq	%r13, %rdi
  27c836: 4c 89 fe                     	movq	%r15, %rsi
  27c839: 4c 89 f2                     	movq	%r14, %rdx
  27c83c: ff 53 20                     	callq	*0x20(%rbx)
  27c83f: 4c 89 e7                     	movq	%r12, %rdi
  27c842: e8 89 15 84 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  27c847: e8 90 a8 2f 00               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  27c84c: cc                           	int3
  27c84d: cc                           	int3
  27c84e: cc                           	int3
  27c84f: cc                           	int3
  27c850: 55                           	pushq	%rbp
  27c851: 41 57                        	pushq	%r15
  27c853: 41 56                        	pushq	%r14
  27c855: 41 55                        	pushq	%r13
  27c857: 41 54                        	pushq	%r12
  27c859: 53                           	pushq	%rbx
  27c85a: 48 83 ec 68                  	subq	$0x68, %rsp
  27c85e: 48 89 f5                     	movq	%rsi, %rbp
  27c861: 48 8b 57 10                  	movq	0x10(%rdi), %rdx
  27c865: 48 8b 77 18                  	movq	0x18(%rdi), %rsi
  27c869: 49 89 d6                     	movq	%rdx, %r14
  27c86c: 49 29 f6                     	subq	%rsi, %r14
  27c86f: 0f 82 df 03 00 00            	jb	0x27cc54 <PyInit__native+0x554>
  27c875: 48 89 fb                     	movq	%rdi, %rbx
  27c878: 48 c7 47 10 00 00 00 00      	movq	$0x0, 0x10(%rdi)
  27c880: 4c 8b 6f 08                  	movq	0x8(%rdi), %r13
  27c884: 48 85 f6                     	testq	%rsi, %rsi
  27c887: 74 16                        	je	0x27c89f <PyInit__native+0x19f>
  27c889: 48 39 f2                     	cmpq	%rsi, %rdx
  27c88c: 74 1c                        	je	0x27c8aa <PyInit__native+0x1aa>
  27c88e: 4c 01 ee                     	addq	%r13, %rsi
  27c891: 4c 89 ef                     	movq	%r13, %rdi
  27c894: 4c 89 f2                     	movq	%r14, %rdx
  27c897: ff 15 f3 af 87 00            	callq	*0x87aff3(%rip)         # 0xaf7890
  27c89d: eb 05                        	jmp	0x27c8a4 <PyInit__native+0x1a4>
  27c89f: 48 85 d2                     	testq	%rdx, %rdx
  27c8a2: 74 06                        	je	0x27c8aa <PyInit__native+0x1aa>
  27c8a4: 4c 89 73 10                  	movq	%r14, 0x10(%rbx)
  27c8a8: eb 03                        	jmp	0x27c8ad <PyInit__native+0x1ad>
  27c8aa: 45 31 f6                     	xorl	%r14d, %r14d
  27c8ad: 49 bc 03 00 00 00 0d 00 00 00	movabsq	$0xd00000003, %r12      # imm = 0xD00000003
