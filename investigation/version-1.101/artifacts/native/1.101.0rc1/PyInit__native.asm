
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  27eb40: 48 8d 3d 89 7a 87 00         	leaq	0x877a89(%rip), %rdi    # 0xaf65d0
  27eb47: ff 25 0b 5a 87 00            	jmpq	*0x875a0b(%rip)         # 0xaf4558 ; ELF relocation: PyModuleDef_Init
