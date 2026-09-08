
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000694280 <PyInit_pyo3_async_runtimes>:
  834136: 55                           	pushq	%rbp
  834137: 48 89 e5                     	movq	%rsp, %rbp
  83413a: 41 56                        	pushq	%r14
  83413c: 53                           	pushq	%rbx
  83413d: 48 b8 4d 4f 5a 00 52 55 53 54	movabsq	$0x54535552005a4f4d, %rax # imm = 0x54535552005A4F4D
  834147: 48 39 07                     	cmpq	%rax, (%rdi)
  83414a: 75 48                        	jne	0x834194 <PyInit_pyo3_async_runtimes+0x19ff14>
  83414c: 48 8d 05 94 f9 8f ff         	leaq	-0x70066c(%rip), %rax   # 0x133ae7
  834153: 48 39 47 20                  	cmpq	%rax, 0x20(%rdi)
  834157: 75 41                        	jne	0x83419a <PyInit_pyo3_async_runtimes+0x19ff1a>
  834159: 48 8b 5f 28                  	movq	0x28(%rdi), %rbx
  83415d: 4c 8b 77 30                  	movq	0x30(%rdi), %r14
  834161: ff 15 09 04 2c 00            	callq	*0x2c0409(%rip)         # 0xaf4570 ; ELF relocation: free
  834167: f0                           	lock
  834168: 48 ff 0d 51 3a 2c 00         	decq	0x2c3a51(%rip)          # 0xaf7bc0
  83416f: 48 8d 3d b2 03 2c 00         	leaq	0x2c03b2(%rip), %rdi    # 0xaf4528 ; ELF relocation: local pointer 0x0
  834176: e8 85 70 28 00               	callq	0xabb200 <__tls_get_addr@plt>
  83417b: 48 ff 88 18 01 00 00         	decq	0x118(%rax)
  834182: c6 80 20 01 00 00 00         	movb	$0x0, 0x120(%rax)
  834189: 48 89 d8                     	movq	%rbx, %rax
  83418c: 4c 89 f2                     	movq	%r14, %rdx
  83418f: 5b                           	popq	%rbx
  834190: 41 5e                        	popq	%r14
  834192: 5d                           	popq	%rbp
  834193: c3                           	retq
  834194: ff 15 36 10 2c 00            	callq	*0x2c1036(%rip)         # 0xaf51d0 ; ELF relocation: _Unwind_DeleteException
  83419a: e8 b1 af ff ff               	callq	0x82f150 <PyInit_pyo3_async_runtimes+0x19aed0>
