
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c640 <.text>:
  27c640: 48 8d 3d 91 d2 87 00         	leaq	0x87d291(%rip), %rdi    # 0xaf98d8
  27c647: 48 8d 05 8a d2 87 00         	leaq	0x87d28a(%rip), %rax    # 0xaf98d8
  27c64e: 48 39 f8                     	cmpq	%rdi, %rax
  27c651: 74 15                        	je	0x27c668 <.text+0x28>
  27c653: 48 8b 05 06 b2 87 00         	movq	0x87b206(%rip), %rax    # 0xaf7860
  27c65a: 48 85 c0                     	testq	%rax, %rax
  27c65d: 74 09                        	je	0x27c668 <.text+0x28>
  27c65f: ff e0                        	jmpq	*%rax
  27c661: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27c668: c3                           	retq
  27c669: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27c670: 48 8d 3d 61 d2 87 00         	leaq	0x87d261(%rip), %rdi    # 0xaf98d8
  27c677: 48 8d 35 5a d2 87 00         	leaq	0x87d25a(%rip), %rsi    # 0xaf98d8
  27c67e: 48 29 fe                     	subq	%rdi, %rsi
  27c681: 48 89 f0                     	movq	%rsi, %rax
  27c684: 48 c1 ee 3f                  	shrq	$0x3f, %rsi
  27c688: 48 c1 f8 03                  	sarq	$0x3, %rax
  27c68c: 48 01 c6                     	addq	%rax, %rsi
  27c68f: 48 d1 fe                     	sarq	%rsi
  27c692: 74 14                        	je	0x27c6a8 <.text+0x68>
  27c694: 48 8b 05 cd b1 87 00         	movq	0x87b1cd(%rip), %rax    # 0xaf7868
  27c69b: 48 85 c0                     	testq	%rax, %rax
  27c69e: 74 08                        	je	0x27c6a8 <.text+0x68>
  27c6a0: ff e0                        	jmpq	*%rax
  27c6a2: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  27c6a8: c3                           	retq
  27c6a9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
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
