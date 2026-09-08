
<native-member>:	file format elf64-x86-64

Disassembly of section .init:

000000000027ea54 <.init>:
  27ea54: f3 0f 1e fa                  	endbr64
  27ea58: 48 83 ec 08                  	subq	$0x8, %rsp
  27ea5c: 48 8b 05 d5 5a 87 00         	movq	0x875ad5(%rip), %rax    # 0xaf4538 ; ELF relocation: __gmon_start__
  27ea63: 48 85 c0                     	testq	%rax, %rax
  27ea66: 74 02                        	je	0x27ea6a <.init+0x16>
  27ea68: ff d0                        	callq	*%rax
  27ea6a: 48 83 c4 08                  	addq	$0x8, %rsp
  27ea6e: c3                           	retq
