
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  69d970: 48 83 ec 18                  	subq	$0x18, %rsp
  69d974: 48 89 7c 24 08               	movq	%rdi, 0x8(%rsp)
  69d979: 48 8d 05 40 68 01 00         	leaq	0x16840(%rip), %rax     # 0x6b41c0 <PyInit_pyo3_async_runtimes+0x14930>
  69d980: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  69d985: 48 8d 3d 03 cb a2 ff         	leaq	-0x5d34fd(%rip), %rdi   # 0xca48f
  69d98c: 48 8d 15 bd b6 43 00         	leaq	0x43b6bd(%rip), %rdx    # 0xad9050 ; ELF relocation: local pointer 0xd1901
  69d993: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  69d998: e8 c3 43 ed ff               	callq	0x571d60 <PyInit__native+0x2f5660>
