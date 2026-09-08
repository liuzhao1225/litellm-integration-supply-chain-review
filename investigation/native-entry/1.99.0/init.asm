
<native-member>:	file format elf64-x86-64

Disassembly of section .init:

000000000027a9fc <.init>:
  27a9fc: f3 0f 1e fa                  	endbr64
  27aa00: 48 83 ec 08                  	subq	$0x8, %rsp
  27aa04: 48 8b 05 2d 45 87 00         	movq	0x87452d(%rip), %rax    # 0xaeef38
  27aa0b: 48 85 c0                     	testq	%rax, %rax
  27aa0e: 74 02                        	je	0x27aa12 <.init+0x16>
  27aa10: ff d0                        	callq	*%rax
  27aa12: 48 83 c4 08                  	addq	$0x8, %rsp
  27aa16: c3                           	retq
