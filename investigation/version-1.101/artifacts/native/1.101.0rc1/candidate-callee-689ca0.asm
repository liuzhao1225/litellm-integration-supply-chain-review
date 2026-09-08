
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  689ca0: 50                           	pushq	%rax
  689ca1: ff 15 79 a9 46 00            	callq	*0x46a979(%rip)         # 0xaf4620 ; ELF relocation: PyUnicode_FromStringAndSize
  689ca7: 48 85 c0                     	testq	%rax, %rax
  689caa: 74 02                        	je	0x689cae <PyInit__native+0x40b16e>
  689cac: 59                           	popq	%rcx
  689cad: c3                           	retq
  689cae: 48 8d 3d fb c0 44 00         	leaq	0x44c0fb(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  689cb5: e8 d6 c3 ff ff               	callq	0x686090 <PyInit__native+0x407550>
