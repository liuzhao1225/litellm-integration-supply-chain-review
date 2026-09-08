
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ea80 <.text>:
  27ea80: 48 8d 3d 39 7b 87 00         	leaq	0x877b39(%rip), %rdi    # 0xaf65c0
  27ea87: 48 8d 05 32 7b 87 00         	leaq	0x877b32(%rip), %rax    # 0xaf65c0
  27ea8e: 48 39 f8                     	cmpq	%rdi, %rax
  27ea91: 74 15                        	je	0x27eaa8 <.text+0x28>
  27ea93: 48 8b 05 a6 5a 87 00         	movq	0x875aa6(%rip), %rax    # 0xaf4540 ; ELF relocation: _ITM_deregisterTMCloneTable
  27ea9a: 48 85 c0                     	testq	%rax, %rax
  27ea9d: 74 09                        	je	0x27eaa8 <.text+0x28>
  27ea9f: ff e0                        	jmpq	*%rax
  27eaa1: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27eaa8: c3                           	retq
  27eaa9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27eab0: 48 8d 3d 09 7b 87 00         	leaq	0x877b09(%rip), %rdi    # 0xaf65c0
  27eab7: 48 8d 35 02 7b 87 00         	leaq	0x877b02(%rip), %rsi    # 0xaf65c0
  27eabe: 48 29 fe                     	subq	%rdi, %rsi
  27eac1: 48 89 f0                     	movq	%rsi, %rax
  27eac4: 48 c1 ee 3f                  	shrq	$0x3f, %rsi
  27eac8: 48 c1 f8 03                  	sarq	$0x3, %rax
  27eacc: 48 01 c6                     	addq	%rax, %rsi
  27eacf: 48 d1 fe                     	sarq	%rsi
  27ead2: 74 14                        	je	0x27eae8 <.text+0x68>
  27ead4: 48 8b 05 6d 5a 87 00         	movq	0x875a6d(%rip), %rax    # 0xaf4548 ; ELF relocation: _ITM_registerTMCloneTable
  27eadb: 48 85 c0                     	testq	%rax, %rax
  27eade: 74 08                        	je	0x27eae8 <.text+0x68>
  27eae0: ff e0                        	jmpq	*%rax
  27eae2: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  27eae8: c3                           	retq
  27eae9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27eaf0: f3 0f 1e fa                  	endbr64
  27eaf4: 80 3d 45 8f 87 00 00         	cmpb	$0x0, 0x878f45(%rip)    # 0xaf7a40
  27eafb: 75 2b                        	jne	0x27eb28 <.text+0xa8>
  27eafd: 55                           	pushq	%rbp
  27eafe: 48 83 3d 4a 5a 87 00 00      	cmpq	$0x0, 0x875a4a(%rip)    # 0xaf4550 ; ELF relocation: __cxa_finalize
  27eb06: 48 89 e5                     	movq	%rsp, %rbp
  27eb09: 74 0c                        	je	0x27eb17 <.text+0x97>
  27eb0b: 48 8d 3d ae da 83 00         	leaq	0x83daae(%rip), %rdi    # 0xabc5c0 ; ELF relocation: local pointer 0xabc5c0
  27eb12: e8 89 c6 83 00               	callq	0xabb1a0 <__cxa_finalize@plt>
  27eb17: e8 64 ff ff ff               	callq	0x27ea80 <.text>
  27eb1c: c6 05 1d 8f 87 00 01         	movb	$0x1, 0x878f1d(%rip)    # 0xaf7a40
  27eb23: 5d                           	popq	%rbp
  27eb24: c3                           	retq
  27eb25: 0f 1f 00                     	nopl	(%rax)
  27eb28: c3                           	retq
  27eb29: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  27eb30: f3 0f 1e fa                  	endbr64
  27eb34: e9 77 ff ff ff               	jmp	0x27eab0 <.text+0x30>
  27eb39: cc                           	int3
  27eb3a: cc                           	int3
  27eb3b: cc                           	int3
  27eb3c: cc                           	int3
  27eb3d: cc                           	int3
  27eb3e: cc                           	int3
  27eb3f: cc                           	int3
