
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  341a40: 48 83 ec 18                  	subq	$0x18, %rsp
  341a44: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  341a4d: 48 8d 05 1c 67 d9 ff         	leaq	-0x2698e4(%rip), %rax   # 0xd8170
  341a54: 48 89 04 24                  	movq	%rax, (%rsp)
  341a58: 48 8d 05 b9 d8 77 00         	leaq	0x77d8b9(%rip), %rax    # 0xabf318 ; ELF relocation: local pointer 0xabf238
  341a5f: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  341a64: 48 8d 35 35 4d 7b 00         	leaq	0x7b4d35(%rip), %rsi    # 0xaf67a0
  341a6b: 48 8d 15 9e 0b f6 ff         	leaq	-0x9f462(%rip), %rdx    # 0x2a2610 <PyInit__native+0x23ad0>
  341a72: 48 8d 0d 77 60 d9 ff         	leaq	-0x269f89(%rip), %rcx   # 0xd7af0 ; rodata: 'ResponsesWebSocketConnectionInvalid UTF8cached_tokenscache_creation_tokenstext_tokensprompt_tokenscompletion_tokenstotal_tokensprompt_tokens_detailsfinish_reasoncreatedJSON number '
  341a79: 49 89 e1                     	movq	%rsp, %r9
  341a7c: 41 b8 1c 00 00 00            	movl	$0x1c, %r8d
  341a82: e8 d9 8a 34 00               	callq	0x68a560 <PyInit__native+0x40ba20>
  341a87: 48 83 c4 18                  	addq	$0x18, %rsp
  341a8b: c3                           	retq
