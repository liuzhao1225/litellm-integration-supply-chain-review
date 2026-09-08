
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  837296: 55                           	pushq	%rbp
  837297: 48 89 e5                     	movq	%rsp, %rbp
  83729a: 41 56                        	pushq	%r14
  83729c: 53                           	pushq	%rbx
  83729d: 48 b8 4d 4f 5a 00 52 55 53 54	movabsq	$0x54535552005a4f4d, %rax # imm = 0x54535552005A4F4D
  8372a7: 48 39 07                     	cmpq	%rax, (%rdi)
  8372aa: 75 48                        	jne	0x8372f4 <PyInit_pyo3_async_runtimes+0x197a64>
  8372ac: 48 8d 05 46 d0 8f ff         	leaq	-0x702fba(%rip), %rax   # 0x1342f9
  8372b3: 48 39 47 20                  	cmpq	%rax, 0x20(%rdi)
  8372b7: 75 41                        	jne	0x8372fa <PyInit_pyo3_async_runtimes+0x197a6a>
  8372b9: 48 8b 5f 28                  	movq	0x28(%rdi), %rbx
  8372bd: 4c 8b 77 30                  	movq	0x30(%rdi), %r14
  8372c1: ff 15 d1 05 2c 00            	callq	*0x2c05d1(%rip)         # 0xaf7898 ; ELF relocation: free
  8372c7: f0                           	lock
  8372c8: 48 ff 0d f1 3b 2c 00         	decq	0x2c3bf1(%rip)          # 0xafaec0
  8372cf: 48 8d 3d 72 05 2c 00         	leaq	0x2c0572(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  8372d6: e8 25 6b 28 00               	callq	0xabde00 <__tls_get_addr@plt>
  8372db: 48 ff 88 f0 00 00 00         	decq	0xf0(%rax)
  8372e2: c6 80 f8 00 00 00 00         	movb	$0x0, 0xf8(%rax)
  8372e9: 48 89 d8                     	movq	%rbx, %rax
  8372ec: 4c 89 f2                     	movq	%r14, %rdx
  8372ef: 5b                           	popq	%rbx
  8372f0: 41 5e                        	popq	%r14
  8372f2: 5d                           	popq	%rbp
  8372f3: c3                           	retq
  8372f4: ff 15 f6 11 2c 00            	callq	*0x2c11f6(%rip)         # 0xaf84f0 ; ELF relocation: _Unwind_DeleteException
  8372fa: e8 b1 af ff ff               	callq	0x8322b0 <PyInit_pyo3_async_runtimes+0x192a20>
