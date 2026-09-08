
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  688950: 48 83 ec 18                  	subq	$0x18, %rsp
  688954: 48 83 ff ff                  	cmpq	$-0x1, %rdi
  688958: 75 30                        	jne	0x68898a <PyInit__native+0x409e4a>
  68895a: 48 8d 05 2f cf 44 00         	leaq	0x44cf2f(%rip), %rax    # 0xad5890 ; ELF relocation: local pointer 0x11ac58
  688961: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  688966: 48 8d 05 53 0c f9 ff         	leaq	-0x6f3ad(%rip), %rax    # 0x6195c0 <PyInit__native+0x39aa80>
  68896d: 48 89 44 24 10               	movq	%rax, 0x10(%rsp)
  688972: 48 8d 3d 99 fe a3 ff         	leaq	-0x5c0167(%rip), %rdi   # 0xc8812
  688979: 48 8d 15 b8 d0 44 00         	leaq	0x44d0b8(%rip), %rdx    # 0xad5a38 ; ELF relocation: local pointer 0xd45ef
  688980: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  688985: e8 06 81 f0 ff               	callq	0x590a90 <PyInit__native+0x311f50>
  68898a: 48 8d 3d df 23 a9 ff         	leaq	-0x56dc21(%rip), %rdi   # 0x11ad70 ; rodata: 'Attaching a thread to the interpreter is currently prohibited.--- PyO3 is resuming a panic after fetching a PanicException from Python. ---\nPython stack trace below:\ninternal error'
  688991: 48 8d 15 b8 d0 44 00         	leaq	0x44d0b8(%rip), %rdx    # 0xad5a50 ; ELF relocation: local pointer 0xd45ef
  688998: be 7d 00 00 00               	movl	$0x7d, %esi
  68899d: e8 ee 80 f0 ff               	callq	0x590a90 <PyInit__native+0x311f50>
