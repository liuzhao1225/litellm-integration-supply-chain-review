
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  376792: 55                           	pushq	%rbp
  376793: 48 89 e5                     	movq	%rsp, %rbp
  376796: 48 89 f8                     	movq	%rdi, %rax
  376799: 48 89 f7                     	movq	%rsi, %rdi
  37679c: 48 89 c6                     	movq	%rax, %rsi
  37679f: e8 ec 89 4b 00               	callq	0x82f190 <PyInit_pyo3_async_runtimes+0x19af10>
