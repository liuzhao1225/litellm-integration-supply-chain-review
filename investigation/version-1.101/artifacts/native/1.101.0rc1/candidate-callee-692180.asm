
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  692180: 48 83 ec 18                  	subq	$0x18, %rsp
  692184: 48 89 7c 24 08               	movq	%rdi, 0x8(%rsp)
  692189: 48 8d 05 30 74 f8 ff         	leaq	-0x78bd0(%rip), %rax    # 0x6195c0 <PyInit__native+0x39aa80>
  692190: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  692195: 48 8d 3d 76 66 a3 ff         	leaq	-0x5c998a(%rip), %rdi   # 0xc8812
  69219c: 48 8d 15 55 3a 44 00         	leaq	0x443a55(%rip), %rdx    # 0xad5bf8 ; ELF relocation: local pointer 0xc7a28
  6921a3: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  6921a8: e8 e3 e8 ef ff               	callq	0x590a90 <PyInit__native+0x311f50>
