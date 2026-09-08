
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  82eee6: 55                           	pushq	%rbp
  82eee7: 48 89 e5                     	movq	%rsp, %rbp
  82eeea: 41 56                        	pushq	%r14
  82eeec: 53                           	pushq	%rbx
  82eeed: 48 b8 4d 4f 5a 00 52 55 53 54	movabsq	$0x54535552005a4f4d, %rax # imm = 0x54535552005A4F4D
  82eef7: 48 39 07                     	cmpq	%rax, (%rdi)
  82eefa: 75 48                        	jne	0x82ef44 <PyInit_pyo3_async_runtimes+0x1958e4>
  82eefc: 48 8d 05 be 3f 90 ff         	leaq	-0x6fc042(%rip), %rax   # 0x132ec1
  82ef03: 48 39 47 20                  	cmpq	%rax, 0x20(%rdi)
  82ef07: 75 41                        	jne	0x82ef4a <PyInit_pyo3_async_runtimes+0x1958ea>
  82ef09: 48 8b 5f 28                  	movq	0x28(%rdi), %rbx
  82ef0d: 4c 8b 77 30                  	movq	0x30(%rdi), %r14
  82ef11: ff 15 59 00 2c 00            	callq	*0x2c0059(%rip)         # 0xaeef70 ; ELF relocation: free
  82ef17: f0                           	lock
  82ef18: 48 ff 0d 21 35 2c 00         	decq	0x2c3521(%rip)          # 0xaf2440
  82ef1f: 48 8d 3d 02 00 2c 00         	leaq	0x2c0002(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  82ef26: e8 95 67 28 00               	callq	0xab56c0 <__tls_get_addr@plt>
  82ef2b: 48 ff 88 f0 00 00 00         	decq	0xf0(%rax)
  82ef32: c6 80 f8 00 00 00 00         	movb	$0x0, 0xf8(%rax)
  82ef39: 48 89 d8                     	movq	%rbx, %rax
  82ef3c: 4c 89 f2                     	movq	%r14, %rdx
  82ef3f: 5b                           	popq	%rbx
  82ef40: 41 5e                        	popq	%r14
  82ef42: 5d                           	popq	%rbp
  82ef43: c3                           	retq
  82ef44: ff 15 76 0b 2c 00            	callq	*0x2c0b76(%rip)         # 0xaefac0 ; ELF relocation: _Unwind_DeleteException
  82ef4a: e8 b1 af ff ff               	callq	0x829f00 <PyInit_pyo3_async_runtimes+0x1908a0>
