
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  691de0: 41 57                        	pushq	%r15
  691de2: 41 56                        	pushq	%r14
  691de4: 41 54                        	pushq	%r12
  691de6: 53                           	pushq	%rbx
  691de7: 48 81 ec 98 00 00 00         	subq	$0x98, %rsp
  691dee: 48 89 d3                     	movq	%rdx, %rbx
  691df1: 49 89 f7                     	movq	%rsi, %r15
  691df4: 49 89 fe                     	movq	%rdi, %r14
  691df7: 0f 10 05 72 4d 46 00         	movups	0x464d72(%rip), %xmm0   # 0xaf6b70 ; ELF relocation: local pointer 0xacfc8
  691dfe: 48 8d 44 24 07               	leaq	0x7(%rsp), %rax
  691e03: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  691e08: 0f 11 44 24 10               	movups	%xmm0, 0x10(%rsp)
  691e0d: 48 8b 05 6c 4d 46 00         	movq	0x464d6c(%rip), %rax    # 0xaf6b80
  691e14: 48 83 f8 02                  	cmpq	$0x2, %rax
  691e18: 0f 85 35 01 00 00            	jne	0x691f53 <PyInit__native+0x413413>
  691e1e: 48 8d 05 63 4d 46 00         	leaq	0x464d63(%rip), %rax    # 0xaf6b88
  691e25: 48 8b 30                     	movq	(%rax), %rsi
  691e28: 48 89 df                     	movq	%rbx, %rdi
  691e2b: ff 15 67 28 46 00            	callq	*0x462867(%rip)         # 0xaf4698 ; ELF relocation: PyObject_GetAttr
  691e31: 48 85 c0                     	testq	%rax, %rax
  691e34: 74 6c                        	je	0x691ea2 <PyInit__native+0x413362>
  691e36: 49 89 c4                     	movq	%rax, %r12
  691e39: 48 8b 78 08                  	movq	0x8(%rax), %rdi
  691e3d: ff 15 75 27 46 00            	callq	*0x462775(%rip)         # 0xaf45b8 ; ELF relocation: PyType_GetFlags
  691e43: a9 00 00 00 10               	testl	$0x10000000, %eax       # imm = 0x10000000
  691e48: 0f 85 d0 00 00 00            	jne	0x691f1e <PyInit__native+0x4133de>
  691e4e: 4c 8b 3d 93 28 46 00         	movq	0x462893(%rip), %r15    # 0xaf46e8 ; ELF relocation: PyUnicode_Type
  691e55: 4c 89 ff                     	movq	%r15, %rdi
  691e58: ff 15 62 27 46 00            	callq	*0x462762(%rip)         # 0xaf45c0 ; ELF relocation: _Py_IncRef
  691e5e: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  691e63: 4c 89 e6                     	movq	%r12, %rsi
  691e66: 4c 89 fa                     	movq	%r15, %rdx
  691e69: e8 e2 59 ff ff               	callq	0x687850 <PyInit__native+0x408d10>
  691e6e: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  691e73: 0f 10 4c 24 18               	movups	0x18(%rsp), %xmm1
  691e78: 0f 10 54 24 28               	movups	0x28(%rsp), %xmm2
  691e7d: 0f 10 5c 24 38               	movups	0x38(%rsp), %xmm3
  691e82: 41 0f 11 5e 38               	movups	%xmm3, 0x38(%r14)
  691e87: 41 0f 11 56 28               	movups	%xmm2, 0x28(%r14)
  691e8c: 41 0f 11 4e 18               	movups	%xmm1, 0x18(%r14)
  691e91: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  691e96: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  691e9d: e9 99 00 00 00               	jmp	0x691f3b <PyInit__native+0x4133fb>
  691ea2: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  691ea7: e8 74 3c ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  691eac: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  691eb1: 0f 85 b2 00 00 00            	jne	0x691f69 <PyInit__native+0x413429>
  691eb7: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  691ebc: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  691ec1: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  691ec6: 0f 10 5c 24 40               	movups	0x40(%rsp), %xmm3
  691ecb: 0f 29 9c 24 80 00 00 00      	movaps	%xmm3, 0x80(%rsp)
  691ed3: 0f 29 54 24 70               	movaps	%xmm2, 0x70(%rsp)
  691ed8: 0f 29 4c 24 60               	movaps	%xmm1, 0x60(%rsp)
  691edd: 0f 29 44 24 50               	movaps	%xmm0, 0x50(%rsp)
  691ee2: 48 8b 44 24 50               	movq	0x50(%rsp), %rax
  691ee7: 48 8b 8c 24 88 00 00 00      	movq	0x88(%rsp), %rcx
  691eef: 49 89 4e 40                  	movq	%rcx, 0x40(%r14)
  691ef3: 0f 10 44 24 78               	movups	0x78(%rsp), %xmm0
  691ef8: 41 0f 11 46 30               	movups	%xmm0, 0x30(%r14)
  691efd: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  691f02: 41 0f 11 46 20               	movups	%xmm0, 0x20(%r14)
  691f07: 0f 10 44 24 58               	movups	0x58(%rsp), %xmm0
  691f0c: 41 0f 11 46 10               	movups	%xmm0, 0x10(%r14)
  691f11: 49 89 46 08                  	movq	%rax, 0x8(%r14)
  691f15: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  691f1c: eb 1d                        	jmp	0x691f3b <PyInit__native+0x4133fb>
  691f1e: 4c 89 f7                     	movq	%r14, %rdi
  691f21: 4c 89 fe                     	movq	%r15, %rsi
  691f24: 4c 89 e2                     	movq	%r12, %rdx
  691f27: 48 89 d9                     	movq	%rbx, %rcx
  691f2a: e8 51 f4 ff ff               	callq	0x691380 <PyInit__native+0x412840>
  691f2f: 48 89 df                     	movq	%rbx, %rdi
  691f32: ff 15 48 26 46 00            	callq	*0x462648(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691f38: 4c 89 e3                     	movq	%r12, %rbx
  691f3b: 48 89 df                     	movq	%rbx, %rdi
  691f3e: ff 15 3c 26 46 00            	callq	*0x46263c(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691f44: 48 81 c4 98 00 00 00         	addq	$0x98, %rsp
  691f4b: 5b                           	popq	%rbx
  691f4c: 41 5c                        	popq	%r12
  691f4e: 41 5e                        	popq	%r14
  691f50: 41 5f                        	popq	%r15
  691f52: c3                           	retq
  691f53: 48 8d 3d 26 4c 46 00         	leaq	0x464c26(%rip), %rdi    # 0xaf6b80
  691f5a: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  691f5f: e8 3c 58 ff ff               	callq	0x6877a0 <PyInit__native+0x408c60>
  691f64: e9 bc fe ff ff               	jmp	0x691e25 <PyInit__native+0x4132e5>
  691f69: 48 8d 7c 24 50               	leaq	0x50(%rsp), %rdi
  691f6e: e8 ed 3d ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  691f73: e9 6a ff ff ff               	jmp	0x691ee2 <PyInit__native+0x4133a2>
  691f78: 49 89 c6                     	movq	%rax, %r14
  691f7b: 48 89 df                     	movq	%rbx, %rdi
  691f7e: ff 15 fc 25 46 00            	callq	*0x4625fc(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691f84: 4c 89 e3                     	movq	%r12, %rbx
  691f87: 48 89 df                     	movq	%rbx, %rdi
  691f8a: ff 15 f0 25 46 00            	callq	*0x4625f0(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691f90: 4c 89 f7                     	movq	%r14, %rdi
  691f93: e8 38 92 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  691f98: 49 89 c6                     	movq	%rax, %r14
  691f9b: 48 89 df                     	movq	%rbx, %rdi
  691f9e: ff 15 dc 25 46 00            	callq	*0x4625dc(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691fa4: 4c 89 f7                     	movq	%r14, %rdi
  691fa7: e8 24 92 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
