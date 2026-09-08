
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  33b942: 55                           	pushq	%rbp
  33b943: 48 89 e5                     	movq	%rsp, %rbp
  33b946: 48 89 f8                     	movq	%rdi, %rax
  33b949: 48 89 f7                     	movq	%rsi, %rdi
  33b94c: 48 89 c6                     	movq	%rax, %rsi
  33b94f: e8 ec e5 4e 00               	callq	0x829f40 <PyInit_pyo3_async_runtimes+0x1908e0>
