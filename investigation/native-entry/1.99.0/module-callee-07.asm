
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68e0a0: 48 83 ec 18                  	subq	$0x18, %rsp
  68e0a4: 48 83 ff ff                  	cmpq	$-0x1, %rdi
  68e0a8: 75 30                        	jne	0x68e0da <PyInit__native+0x4135da>
  68e0aa: 48 8d 05 5f 24 44 00         	leaq	0x44245f(%rip), %rax    # 0xad0510 ; ELF relocation: local pointer 0x11aff6
  68e0b1: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  68e0b6: 48 8d 05 83 2c f1 ff         	leaq	-0xed37d(%rip), %rax    # 0x5a0d40 <PyInit__native+0x326240>
  68e0bd: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  68e0c2: 48 8d 3d 27 b4 a3 ff         	leaq	-0x5c4bd9(%rip), %rdi   # 0xc94f0
  68e0c9: 48 8d 15 e8 25 44 00         	leaq	0x4425e8(%rip), %rdx    # 0xad06b8 ; ELF relocation: local pointer 0xc2168
  68e0d0: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  68e0d5: e8 56 73 ec ff               	callq	0x555430 <PyInit__native+0x2da930>
  68e0da: 48 8d 3d 2d d0 a8 ff         	leaq	-0x572fd3(%rip), %rdi   # 0x11b10e ; rodata: 'Attaching a thread to the interpreter is currently prohibited.--- PyO3 is resuming a panic after fetching a PanicException from Python. ---\nPython stack trace below:\ninternal error'
  68e0e1: 48 8d 15 e8 25 44 00         	leaq	0x4425e8(%rip), %rdx    # 0xad06d0 ; ELF relocation: local pointer 0xc2168
  68e0e8: be 7d 00 00 00               	movl	$0x7d, %esi
  68e0ed: e8 3e 73 ec ff               	callq	0x555430 <PyInit__native+0x2da930>
