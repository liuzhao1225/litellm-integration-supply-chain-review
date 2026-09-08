
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  343c60: 55                           	pushq	%rbp
  343c61: 41 57                        	pushq	%r15
  343c63: 41 56                        	pushq	%r14
  343c65: 41 55                        	pushq	%r13
  343c67: 41 54                        	pushq	%r12
  343c69: 53                           	pushq	%rbx
  343c6a: 48 81 ec 98 01 00 00         	subq	$0x198, %rsp            # imm = 0x198
  343c71: 48 89 d3                     	movq	%rdx, %rbx
  343c74: 49 89 f7                     	movq	%rsi, %r15
  343c77: 49 89 fe                     	movq	%rdi, %r14
  343c7a: 48 8d 3d 47 93 d6 ff         	leaq	-0x296cb9(%rip), %rdi   # 0xacfc8
  343c81: be 08 00 00 00               	movl	$0x8, %esi
  343c86: ff 15 94 09 7b 00            	callq	*0x7b0994(%rip)         # 0xaf4620 ; ELF relocation: PyUnicode_FromStringAndSize
  343c8c: 48 85 c0                     	testq	%rax, %rax
  343c8f: 0f 84 df 03 00 00            	je	0x344074 <PyInit__native+0xc5534>
  343c95: 49 89 c4                     	movq	%rax, %r12
  343c98: 48 89 df                     	movq	%rbx, %rdi
  343c9b: 48 89 c6                     	movq	%rax, %rsi
  343c9e: ff 15 f4 09 7b 00            	callq	*0x7b09f4(%rip)         # 0xaf4698 ; ELF relocation: PyObject_GetAttr
  343ca4: 48 85 c0                     	testq	%rax, %rax
  343ca7: 74 7e                        	je	0x343d27 <PyInit__native+0xc51e7>
  343ca9: 49 89 c5                     	movq	%rax, %r13
  343cac: 4c 89 e7                     	movq	%r12, %rdi
  343caf: ff 15 cb 08 7b 00            	callq	*0x7b08cb(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343cb5: 48 8d bc 24 18 01 00 00      	leaq	0x118(%rsp), %rdi
  343cbd: 4c 89 ee                     	movq	%r13, %rsi
  343cc0: e8 eb e2 34 00               	callq	0x691fb0 <PyInit__native+0x413470>
  343cc5: 48 8d 84 24 20 01 00 00      	leaq	0x120(%rsp), %rax
  343ccd: 83 bc 24 18 01 00 00 01      	cmpl	$0x1, 0x118(%rsp)
  343cd5: 0f 85 32 01 00 00            	jne	0x343e0d <PyInit__native+0xc52cd>
  343cdb: 0f 10 00                     	movups	(%rax), %xmm0
  343cde: 0f 10 48 10                  	movups	0x10(%rax), %xmm1
  343ce2: 0f 10 50 20                  	movups	0x20(%rax), %xmm2
  343ce6: 0f 10 58 30                  	movups	0x30(%rax), %xmm3
  343cea: 0f 29 5c 24 50               	movaps	%xmm3, 0x50(%rsp)
  343cef: 0f 29 54 24 40               	movaps	%xmm2, 0x40(%rsp)
  343cf4: 0f 29 4c 24 30               	movaps	%xmm1, 0x30(%rsp)
  343cf9: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  343cfe: 41 0f 11 5e 38               	movups	%xmm3, 0x38(%r14)
  343d03: 41 0f 11 56 28               	movups	%xmm2, 0x28(%r14)
  343d08: 41 0f 11 4e 18               	movups	%xmm1, 0x18(%r14)
  343d0d: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  343d12: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  343d19: 4c 89 ef                     	movq	%r13, %rdi
  343d1c: ff 15 5e 08 7b 00            	callq	*0x7b085e(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343d22: e9 ff 01 00 00               	jmp	0x343f26 <PyInit__native+0xc53e6>
  343d27: 48 8d 7c 24 68               	leaq	0x68(%rsp), %rdi
  343d2c: e8 ef 1d 34 00               	callq	0x685b20 <PyInit__native+0x406fe0>
  343d31: 83 7c 24 68 01               	cmpl	$0x1, 0x68(%rsp)
  343d36: 0f 85 46 03 00 00            	jne	0x344082 <PyInit__native+0xc5542>
  343d3c: 0f 10 44 24 70               	movups	0x70(%rsp), %xmm0
  343d41: 0f 10 8c 24 80 00 00 00      	movups	0x80(%rsp), %xmm1
  343d49: 0f 10 94 24 90 00 00 00      	movups	0x90(%rsp), %xmm2
  343d51: 0f 10 9c 24 a0 00 00 00      	movups	0xa0(%rsp), %xmm3
  343d59: 0f 29 9c 24 e0 00 00 00      	movaps	%xmm3, 0xe0(%rsp)
  343d61: 0f 29 94 24 d0 00 00 00      	movaps	%xmm2, 0xd0(%rsp)
  343d69: 0f 29 8c 24 c0 00 00 00      	movaps	%xmm1, 0xc0(%rsp)
  343d71: 0f 29 84 24 b0 00 00 00      	movaps	%xmm0, 0xb0(%rsp)
  343d79: 4c 8b bc 24 b0 00 00 00      	movq	0xb0(%rsp), %r15
  343d81: 0f 10 84 24 b8 00 00 00      	movups	0xb8(%rsp), %xmm0
  343d89: 0f 29 84 24 60 01 00 00      	movaps	%xmm0, 0x160(%rsp)
  343d91: 0f 10 84 24 c8 00 00 00      	movups	0xc8(%rsp), %xmm0
  343d99: 0f 29 84 24 70 01 00 00      	movaps	%xmm0, 0x170(%rsp)
  343da1: 0f 10 84 24 d8 00 00 00      	movups	0xd8(%rsp), %xmm0
  343da9: 0f 29 84 24 80 01 00 00      	movaps	%xmm0, 0x180(%rsp)
  343db1: 48 8b 84 24 e8 00 00 00      	movq	0xe8(%rsp), %rax
  343db9: 48 89 84 24 90 01 00 00      	movq	%rax, 0x190(%rsp)
  343dc1: 4c 89 e7                     	movq	%r12, %rdi
  343dc4: ff 15 b6 07 7b 00            	callq	*0x7b07b6(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343dca: 48 8b 84 24 90 01 00 00      	movq	0x190(%rsp), %rax
  343dd2: 49 89 46 40                  	movq	%rax, 0x40(%r14)
  343dd6: 0f 28 84 24 60 01 00 00      	movaps	0x160(%rsp), %xmm0
  343dde: 0f 28 8c 24 70 01 00 00      	movaps	0x170(%rsp), %xmm1
  343de6: 0f 28 94 24 80 01 00 00      	movaps	0x180(%rsp), %xmm2
  343dee: 41 0f 11 56 30               	movups	%xmm2, 0x30(%r14)
  343df3: 41 0f 11 4e 20               	movups	%xmm1, 0x20(%r14)
  343df8: 41 0f 11 46 10               	movups	%xmm0, 0x10(%r14)
  343dfd: 4d 89 7e 08                  	movq	%r15, 0x8(%r14)
  343e01: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  343e08: e9 19 01 00 00               	jmp	0x343f26 <PyInit__native+0xc53e6>
  343e0d: 48 8b 48 10                  	movq	0x10(%rax), %rcx
  343e11: 48 89 4c 24 30               	movq	%rcx, 0x30(%rsp)
  343e16: 0f 10 00                     	movups	(%rax), %xmm0
  343e19: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  343e1e: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  343e22: 48 89 4c 24 10               	movq	%rcx, 0x10(%rsp)
  343e27: 4c 89 ef                     	movq	%r13, %rdi
  343e2a: ff 15 50 07 7b 00            	callq	*0x7b0750(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343e30: 4c 8b 6c 24 08               	movq	0x8(%rsp), %r13
  343e35: 48 8b 74 24 10               	movq	0x10(%rsp), %rsi
  343e3a: 4c 89 ef                     	movq	%r13, %rdi
  343e3d: ff 15 dd 07 7b 00            	callq	*0x7b07dd(%rip)         # 0xaf4620 ; ELF relocation: PyUnicode_FromStringAndSize
  343e43: 48 85 c0                     	testq	%rax, %rax
  343e46: 0f 84 48 02 00 00            	je	0x344094 <PyInit__native+0xc5554>
  343e4c: 49 89 c4                     	movq	%rax, %r12
  343e4f: 49 8b 3f                     	movq	(%r15), %rdi
  343e52: 48 89 c6                     	movq	%rax, %rsi
  343e55: ff 15 3d 08 7b 00            	callq	*0x7b083d(%rip)         # 0xaf4698 ; ELF relocation: PyObject_GetAttr
  343e5b: 48 85 c0                     	testq	%rax, %rax
  343e5e: 0f 84 dd 00 00 00            	je	0x343f41 <PyInit__native+0xc5401>
  343e64: 4c 8b 3d 15 07 7b 00         	movq	0x7b0715(%rip), %r15    # 0xaf4580 ; ELF relocation: _Py_DecRef
  343e6b: 48 89 c7                     	movq	%rax, %rdi
  343e6e: 41 ff d7                     	callq	*%r15
  343e71: 4c 89 e7                     	movq	%r12, %rdi
  343e74: 41 ff d7                     	callq	*%r15
  343e77: 48 89 e0                     	movq	%rsp, %rax
  343e7a: 48 89 44 24 68               	movq	%rax, 0x68(%rsp)
  343e7f: 48 8d 05 da 18 03 00         	leaq	0x318da(%rip), %rax     # 0x375760 <PyInit__native+0xf6c20>
  343e86: 48 89 44 24 70               	movq	%rax, 0x70(%rsp)
  343e8b: 40 b5 01                     	movb	$0x1, %bpl
  343e8e: 48 8d 35 41 37 d8 ff         	leaq	-0x27c8bf(%rip), %rsi   # 0xc75d6
  343e95: 48 8d bc 24 00 01 00 00      	leaq	0x100(%rsp), %rdi
  343e9d: 48 8d 54 24 68               	leaq	0x68(%rsp), %rdx
  343ea2: e8 39 3b 03 00               	callq	0x3779e0 <PyInit__native+0xf8ea0>
  343ea7: 4c 8b a4 24 00 01 00 00      	movq	0x100(%rsp), %r12
  343eaf: 4c 8b bc 24 08 01 00 00      	movq	0x108(%rsp), %r15
  343eb7: 4c 8b ac 24 10 01 00 00      	movq	0x110(%rsp), %r13
  343ebf: bf 18 00 00 00               	movl	$0x18, %edi
  343ec4: ff 15 96 06 7b 00            	callq	*0x7b0696(%rip)         # 0xaf4560 ; ELF relocation: malloc
  343eca: 48 85 c0                     	testq	%rax, %rax
  343ecd: 0f 84 d2 01 00 00            	je	0x3440a5 <PyInit__native+0xc5565>
  343ed3: 4c 89 20                     	movq	%r12, (%rax)
  343ed6: 4c 89 78 08                  	movq	%r15, 0x8(%rax)
  343eda: 4c 89 68 10                  	movq	%r13, 0x10(%rax)
  343ede: 0f 57 c0                     	xorps	%xmm0, %xmm0
  343ee1: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  343ee6: 49 c7 46 18 01 00 00 00      	movq	$0x1, 0x18(%r14)
  343eee: 49 c7 46 20 00 00 00 00      	movq	$0x0, 0x20(%r14)
  343ef6: 49 89 46 28                  	movq	%rax, 0x28(%r14)
  343efa: 48 8d 05 f7 ad 77 00         	leaq	0x77adf7(%rip), %rax    # 0xabecf8 ; ELF relocation: local pointer 0x68c390
  343f01: 49 89 46 30                  	movq	%rax, 0x30(%r14)
  343f05: 41 c7 46 40 03 00 00 00      	movl	$0x3, 0x40(%r14)
  343f0d: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  343f14: 48 83 3c 24 00               	cmpq	$0x0, (%rsp)
  343f19: 74 0b                        	je	0x343f26 <PyInit__native+0xc53e6>
  343f1b: 48 8b 7c 24 08               	movq	0x8(%rsp), %rdi
  343f20: ff 15 4a 06 7b 00            	callq	*0x7b064a(%rip)         # 0xaf4570 ; ELF relocation: free
  343f26: 48 89 df                     	movq	%rbx, %rdi
  343f29: ff 15 51 06 7b 00            	callq	*0x7b0651(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343f2f: 48 81 c4 98 01 00 00         	addq	$0x198, %rsp            # imm = 0x198
  343f36: 5b                           	popq	%rbx
  343f37: 41 5c                        	popq	%r12
  343f39: 41 5d                        	popq	%r13
  343f3b: 41 5e                        	popq	%r14
  343f3d: 41 5f                        	popq	%r15
  343f3f: 5d                           	popq	%rbp
  343f40: c3                           	retq
  343f41: 48 8b 05 58 07 7b 00         	movq	0x7b0758(%rip), %rax    # 0xaf46a0 ; ELF relocation: PyExc_AttributeError
  343f48: 48 8b 38                     	movq	(%rax), %rdi
  343f4b: ff 15 57 07 7b 00            	callq	*0x7b0757(%rip)         # 0xaf46a8 ; ELF relocation: PyErr_ExceptionMatches
  343f51: 85 c0                        	testl	%eax, %eax
  343f53: 74 31                        	je	0x343f86 <PyInit__native+0xc5446>
  343f55: ff 15 55 07 7b 00            	callq	*0x7b0755(%rip)         # 0xaf46b0 ; ELF relocation: PyErr_Clear
  343f5b: 4c 89 e7                     	movq	%r12, %rdi
  343f5e: ff 15 1c 06 7b 00            	callq	*0x7b061c(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  343f64: 31 ed                        	xorl	%ebp, %ebp
  343f66: 4c 89 f7                     	movq	%r14, %rdi
  343f69: 4c 89 fe                     	movq	%r15, %rsi
  343f6c: 48 89 da                     	movq	%rbx, %rdx
  343f6f: e8 6c de 34 00               	callq	0x691de0 <PyInit__native+0x4132a0>
  343f74: 48 83 3c 24 00               	cmpq	$0x0, (%rsp)
  343f79: 74 b4                        	je	0x343f2f <PyInit__native+0xc53ef>
  343f7b: 4c 89 ef                     	movq	%r13, %rdi
  343f7e: ff 15 ec 05 7b 00            	callq	*0x7b05ec(%rip)         # 0xaf4570 ; ELF relocation: free
  343f84: eb a9                        	jmp	0x343f2f <PyInit__native+0xc53ef>
  343f86: 48 8d 7c 24 68               	leaq	0x68(%rsp), %rdi
  343f8b: e8 90 1b 34 00               	callq	0x685b20 <PyInit__native+0x406fe0>
  343f90: 83 7c 24 68 01               	cmpl	$0x1, 0x68(%rsp)
  343f95: 0f 85 1b 01 00 00            	jne	0x3440b6 <PyInit__native+0xc5576>
  343f9b: 0f 10 44 24 70               	movups	0x70(%rsp), %xmm0
  343fa0: 0f 10 8c 24 80 00 00 00      	movups	0x80(%rsp), %xmm1
  343fa8: 0f 10 94 24 90 00 00 00      	movups	0x90(%rsp), %xmm2
  343fb0: 0f 10 9c 24 a0 00 00 00      	movups	0xa0(%rsp), %xmm3
  343fb8: 0f 29 5c 24 50               	movaps	%xmm3, 0x50(%rsp)
  343fbd: 0f 29 54 24 40               	movaps	%xmm2, 0x40(%rsp)
  343fc2: 0f 29 4c 24 30               	movaps	%xmm1, 0x30(%rsp)
  343fc7: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  343fcc: 0f 28 44 24 20               	movaps	0x20(%rsp), %xmm0
  343fd1: 0f 28 4c 24 30               	movaps	0x30(%rsp), %xmm1
  343fd6: 0f 28 54 24 40               	movaps	0x40(%rsp), %xmm2
  343fdb: 0f 28 5c 24 50               	movaps	0x50(%rsp), %xmm3
  343fe0: 0f 11 84 24 1e 01 00 00      	movups	%xmm0, 0x11e(%rsp)
  343fe8: 0f 11 8c 24 2e 01 00 00      	movups	%xmm1, 0x12e(%rsp)
  343ff0: 0f 11 94 24 3e 01 00 00      	movups	%xmm2, 0x13e(%rsp)
  343ff8: 0f 11 9c 24 4e 01 00 00      	movups	%xmm3, 0x14e(%rsp)
  344000: 4c 89 e7                     	movq	%r12, %rdi
  344003: ff 15 77 05 7b 00            	callq	*0x7b0577(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  344009: 0f 10 84 24 1e 01 00 00      	movups	0x11e(%rsp), %xmm0
  344011: 0f 10 8c 24 2e 01 00 00      	movups	0x12e(%rsp), %xmm1
  344019: 0f 10 94 24 3e 01 00 00      	movups	0x13e(%rsp), %xmm2
  344021: 0f 10 9c 24 4e 01 00 00      	movups	0x14e(%rsp), %xmm3
  344029: 0f 11 9c 24 e6 00 00 00      	movups	%xmm3, 0xe6(%rsp)
  344031: 0f 11 94 24 d6 00 00 00      	movups	%xmm2, 0xd6(%rsp)
  344039: 0f 11 8c 24 c6 00 00 00      	movups	%xmm1, 0xc6(%rsp)
  344041: 0f 11 84 24 b6 00 00 00      	movups	%xmm0, 0xb6(%rsp)
  344049: 41 0f 11 5e 38               	movups	%xmm3, 0x38(%r14)
  34404e: 41 0f 11 56 28               	movups	%xmm2, 0x28(%r14)
  344053: 41 0f 11 4e 18               	movups	%xmm1, 0x18(%r14)
  344058: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  34405d: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  344064: 48 83 3c 24 00               	cmpq	$0x0, (%rsp)
  344069: 0f 85 ac fe ff ff            	jne	0x343f1b <PyInit__native+0xc53db>
  34406f: e9 b2 fe ff ff               	jmp	0x343f26 <PyInit__native+0xc53e6>
  344074: 48 8d 3d 35 1d 79 00         	leaq	0x791d35(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  34407b: e8 10 20 34 00               	callq	0x686090 <PyInit__native+0x407550>
  344080: eb 32                        	jmp	0x3440b4 <PyInit__native+0xc5574>
  344082: 48 8d bc 24 b0 00 00 00      	leaq	0xb0(%rsp), %rdi
  34408a: e8 d1 1c 34 00               	callq	0x685d60 <PyInit__native+0x407220>
  34408f: e9 e5 fc ff ff               	jmp	0x343d79 <PyInit__native+0xc5239>
  344094: 40 b5 01                     	movb	$0x1, %bpl
  344097: 48 8d 3d 12 1d 79 00         	leaq	0x791d12(%rip), %rdi    # 0xad5db0 ; ELF relocation: local pointer 0xc7a82
  34409e: e8 ed 1f 34 00               	callq	0x686090 <PyInit__native+0x407550>
  3440a3: eb 0f                        	jmp	0x3440b4 <PyInit__native+0xc5574>
  3440a5: bf 08 00 00 00               	movl	$0x8, %edi
  3440aa: be 18 00 00 00               	movl	$0x18, %esi
  3440af: e8 de 26 03 00               	callq	0x376792 <PyInit__native+0xf7c52>
  3440b4: 0f 0b                        	ud2
  3440b6: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  3440bb: e8 a0 1c 34 00               	callq	0x685d60 <PyInit__native+0x407220>
  3440c0: e9 07 ff ff ff               	jmp	0x343fcc <PyInit__native+0xc548c>
  3440c5: 49 89 c6                     	movq	%rax, %r14
  3440c8: 4c 89 e7                     	movq	%r12, %rdi
  3440cb: ff 15 af 04 7b 00            	callq	*0x7b04af(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  3440d1: 40 b5 01                     	movb	$0x1, %bpl
  3440d4: eb 3e                        	jmp	0x344114 <PyInit__native+0xc55d4>
  3440d6: 49 89 c6                     	movq	%rax, %r14
  3440d9: 4c 89 e7                     	movq	%r12, %rdi
  3440dc: eb 06                        	jmp	0x3440e4 <PyInit__native+0xc55a4>
  3440de: 49 89 c6                     	movq	%rax, %r14
  3440e1: 4c 89 ef                     	movq	%r13, %rdi
  3440e4: ff 15 96 04 7b 00            	callq	*0x7b0496(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  3440ea: 48 89 df                     	movq	%rbx, %rdi
  3440ed: ff 15 8d 04 7b 00            	callq	*0x7b048d(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  3440f3: 4c 89 f7                     	movq	%r14, %rdi
  3440f6: e8 d5 70 77 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  3440fb: 49 89 c6                     	movq	%rax, %r14
  3440fe: 40 b5 01                     	movb	$0x1, %bpl
  344101: 4d 85 e4                     	testq	%r12, %r12
  344104: 74 0e                        	je	0x344114 <PyInit__native+0xc55d4>
  344106: 4c 89 ff                     	movq	%r15, %rdi
  344109: ff 15 61 04 7b 00            	callq	*0x7b0461(%rip)         # 0xaf4570 ; ELF relocation: free
  34410f: eb 03                        	jmp	0x344114 <PyInit__native+0xc55d4>
  344111: 49 89 c6                     	movq	%rax, %r14
  344114: 48 83 3c 24 00               	cmpq	$0x0, (%rsp)
  344119: 74 0b                        	je	0x344126 <PyInit__native+0xc55e6>
  34411b: 48 8b 7c 24 08               	movq	0x8(%rsp), %rdi
  344120: ff 15 4a 04 7b 00            	callq	*0x7b044a(%rip)         # 0xaf4570 ; ELF relocation: free
  344126: 40 84 ed                     	testb	%bpl, %bpl
  344129: 75 0b                        	jne	0x344136 <PyInit__native+0xc55f6>
  34412b: 4c 89 f7                     	movq	%r14, %rdi
  34412e: e8 9d 70 77 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  344133: 49 89 c6                     	movq	%rax, %r14
  344136: 48 89 df                     	movq	%rbx, %rdi
  344139: ff 15 41 04 7b 00            	callq	*0x7b0441(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  34413f: 4c 89 f7                     	movq	%r14, %rdi
  344142: e8 89 70 77 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
