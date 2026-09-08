
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  356172: 55                           	pushq	%rbp
  356173: 48 89 e5                     	movq	%rsp, %rbp
  356176: 48 89 f8                     	movq	%rdi, %rax
  356179: 48 89 f7                     	movq	%rsi, %rdi
  35617c: 48 89 c6                     	movq	%rax, %rsi
  35617f: e8 6c c1 4d 00               	callq	0x8322f0 <PyInit_pyo3_async_runtimes+0x192a60>
