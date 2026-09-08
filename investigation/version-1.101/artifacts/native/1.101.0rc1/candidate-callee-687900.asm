
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  687900: 41 57                        	pushq	%r15
  687902: 41 56                        	pushq	%r14
  687904: 53                           	pushq	%rbx
  687905: 4c 8b 3f                     	movq	(%rdi), %r15
  687908: 48 8b 5f 08                  	movq	0x8(%rdi), %rbx
  68790c: 48 8d 3d 15 cc 46 00         	leaq	0x46cc15(%rip), %rdi    # 0xaf4528 ; ELF relocation: local pointer 0x0
  687913: e8 e8 38 43 00               	callq	0xabb200 <__tls_get_addr@plt>
  687918: 49 89 c6                     	movq	%rax, %r14
  68791b: 48 83 b8 d8 00 00 00 00      	cmpq	$0x0, 0xd8(%rax)
  687923: 7e 24                        	jle	0x687949 <PyInit__native+0x408e09>
  687925: 4c 89 ff                     	movq	%r15, %rdi
  687928: ff 15 52 cc 46 00            	callq	*0x46cc52(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  68792e: 49 8d 86 d8 00 00 00         	leaq	0xd8(%r14), %rax
  687935: 48 83 38 00                  	cmpq	$0x0, (%rax)
  687939: 7e 18                        	jle	0x687953 <PyInit__native+0x408e13>
  68793b: 48 89 df                     	movq	%rbx, %rdi
  68793e: 5b                           	popq	%rbx
  68793f: 41 5e                        	popq	%r14
  687941: 41 5f                        	popq	%r15
  687943: ff 25 37 cc 46 00            	jmpq	*0x46cc37(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  687949: 4c 89 ff                     	movq	%r15, %rdi
  68794c: e8 0f ea ff ff               	callq	0x686360 <PyInit__native+0x407820>
  687951: eb db                        	jmp	0x68792e <PyInit__native+0x408dee>
  687953: 48 89 df                     	movq	%rbx, %rdi
  687956: 5b                           	popq	%rbx
  687957: 41 5e                        	popq	%r14
  687959: 41 5f                        	popq	%r15
  68795b: e9 00 ea ff ff               	jmp	0x686360 <PyInit__native+0x407820>
  687960: 49 89 c6                     	movq	%rax, %r14
  687963: 48 89 df                     	movq	%rbx, %rdi
  687966: e8 a5 eb ff ff               	callq	0x686510 <PyInit__native+0x4079d0>
  68796b: 4c 89 f7                     	movq	%r14, %rdi
  68796e: e8 5d 38 43 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  687973: e8 94 e4 f0 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
