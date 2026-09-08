
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027aa40 <.text>:
  27aa40: 48 8d 3d 61 64 87 00         	leaq	0x876461(%rip), %rdi    # 0xaf0ea8
  27aa47: 48 8d 05 5a 64 87 00         	leaq	0x87645a(%rip), %rax    # 0xaf0ea8
  27aa4e: 48 39 f8                     	cmpq	%rdi, %rax
  27aa51: 74 15                        	je	0x27aa68 <.text+0x28>
  27aa53: 48 8b 05 e6 44 87 00         	movq	0x8744e6(%rip), %rax    # 0xaeef40
  27aa5a: 48 85 c0                     	testq	%rax, %rax
  27aa5d: 74 09                        	je	0x27aa68 <.text+0x28>
  27aa5f: ff e0                        	jmpq	*%rax
  27aa61: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27aa68: c3                           	retq
  27aa69: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27aa70: 48 8d 3d 31 64 87 00         	leaq	0x876431(%rip), %rdi    # 0xaf0ea8
  27aa77: 48 8d 35 2a 64 87 00         	leaq	0x87642a(%rip), %rsi    # 0xaf0ea8
  27aa7e: 48 29 fe                     	subq	%rdi, %rsi
  27aa81: 48 89 f0                     	movq	%rsi, %rax
  27aa84: 48 c1 ee 3f                  	shrq	$0x3f, %rsi
  27aa88: 48 c1 f8 03                  	sarq	$0x3, %rax
  27aa8c: 48 01 c6                     	addq	%rax, %rsi
  27aa8f: 48 d1 fe                     	sarq	%rsi
  27aa92: 74 14                        	je	0x27aaa8 <.text+0x68>
  27aa94: 48 8b 05 ad 44 87 00         	movq	0x8744ad(%rip), %rax    # 0xaeef48
  27aa9b: 48 85 c0                     	testq	%rax, %rax
  27aa9e: 74 08                        	je	0x27aaa8 <.text+0x68>
  27aaa0: ff e0                        	jmpq	*%rax
  27aaa2: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  27aaa8: c3                           	retq
  27aaa9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27aab0: f3 0f 1e fa                  	endbr64
  27aab4: 80 3d 25 78 87 00 00         	cmpb	$0x0, 0x877825(%rip)    # 0xaf22e0
  27aabb: 75 2b                        	jne	0x27aae8 <.text+0xa8>
  27aabd: 55                           	pushq	%rbp
  27aabe: 48 83 3d 8a 44 87 00 00      	cmpq	$0x0, 0x87448a(%rip)    # 0xaeef50
  27aac6: 48 89 e5                     	movq	%rsp, %rbp
  27aac9: 74 0c                        	je	0x27aad7 <.text+0x97>
  27aacb: 48 8d 3d ae bf 83 00         	leaq	0x83bfae(%rip), %rdi    # 0xab6a80
  27aad2: e8 89 ab 83 00               	callq	0xab5660 <__cxa_finalize@plt>
  27aad7: e8 64 ff ff ff               	callq	0x27aa40 <.text>
  27aadc: c6 05 fd 77 87 00 01         	movb	$0x1, 0x8777fd(%rip)    # 0xaf22e0
  27aae3: 5d                           	popq	%rbp
  27aae4: c3                           	retq
  27aae5: 0f 1f 00                     	nopl	(%rax)
  27aae8: c3                           	retq
  27aae9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27aaf0: f3 0f 1e fa                  	endbr64
  27aaf4: e9 77 ff ff ff               	jmp	0x27aa70 <.text+0x30>
  27aaf9: cc                           	int3
  27aafa: cc                           	int3
  27aafb: cc                           	int3
  27aafc: cc                           	int3
  27aafd: cc                           	int3
  27aafe: cc                           	int3
  27aaff: cc                           	int3
