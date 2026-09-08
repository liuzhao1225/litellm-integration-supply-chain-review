
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  694080: 48 83 ec 18                  	subq	$0x18, %rsp
  694084: 48 83 ff ff                  	cmpq	$-0x1, %rdi
  694088: 75 30                        	jne	0x6940ba <PyInit__native+0x4179ba>
  69408a: 48 8d 05 57 4c 44 00         	leaq	0x444c57(%rip), %rax    # 0xad8ce8 ; ELF relocation: local pointer 0x11c338
  694091: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  694096: 48 8d 05 23 01 02 00         	leaq	0x20123(%rip), %rax     # 0x6b41c0 <PyInit_pyo3_async_runtimes+0x14930>
  69409d: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  6940a2: 48 8d 3d e6 63 a3 ff         	leaq	-0x5c9c1a(%rip), %rdi   # 0xca48f
  6940a9: 48 8d 15 e0 4d 44 00         	leaq	0x444de0(%rip), %rdx    # 0xad8e90 ; ELF relocation: local pointer 0xc335c
  6940b0: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  6940b5: e8 a6 dc ed ff               	callq	0x571d60 <PyInit__native+0x2f5660>
  6940ba: 48 8d 3d 8f 83 a8 ff         	leaq	-0x577c71(%rip), %rdi   # 0x11c450 ; rodata: 'Attaching a thread to the interpreter is currently prohibited.--- PyO3 is resuming a panic after fetching a PanicException from Python. ---\nPython stack trace below:\ninternal error'
  6940c1: 48 8d 15 e0 4d 44 00         	leaq	0x444de0(%rip), %rdx    # 0xad8ea8 ; ELF relocation: local pointer 0xc335c
  6940c8: be 7d 00 00 00               	movl	$0x7d, %esi
  6940cd: e8 8e dc ed ff               	callq	0x571d60 <PyInit__native+0x2f5660>
