
<native-member>:	file format elf64-x86-64

Disassembly of section .init:

000000000027c614 <.init>:
  27c614: f3 0f 1e fa                  	endbr64
  27c618: 48 83 ec 08                  	subq	$0x8, %rsp
  27c61c: 48 8b 05 35 b2 87 00         	movq	0x87b235(%rip), %rax    # 0xaf7858
  27c623: 48 85 c0                     	testq	%rax, %rax
  27c626: 74 02                        	je	0x27c62a <.init+0x16>
  27c628: ff d0                        	callq	*%rax
  27c62a: 48 83 c4 08                  	addq	$0x8, %rsp
  27c62e: c3                           	retq
