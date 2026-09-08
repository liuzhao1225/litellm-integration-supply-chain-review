
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  6975f0: 48 83 ec 18                  	subq	$0x18, %rsp
  6975f4: 48 89 7c 24 08               	movq	%rdi, 0x8(%rsp)
  6975f9: 48 8d 05 40 97 f0 ff         	leaq	-0xf68c0(%rip), %rax    # 0x5a0d40 <PyInit__native+0x326240>
  697600: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  697605: 48 8d 3d e4 1e a3 ff         	leaq	-0x5ce11c(%rip), %rdi   # 0xc94f0
  69760c: 48 8d 15 65 92 43 00         	leaq	0x439265(%rip), %rdx    # 0xad0878 ; ELF relocation: local pointer 0xd087b
  697613: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  697618: e8 13 de eb ff               	callq	0x555430 <PyInit__native+0x2da930>
