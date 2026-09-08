
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  69d5d0: 41 57                        	pushq	%r15
  69d5d2: 41 56                        	pushq	%r14
  69d5d4: 41 54                        	pushq	%r12
  69d5d6: 53                           	pushq	%rbx
  69d5d7: 48 81 ec 98 00 00 00         	subq	$0x98, %rsp
  69d5de: 48 89 d3                     	movq	%rdx, %rbx
  69d5e1: 49 89 f7                     	movq	%rsi, %r15
  69d5e4: 49 89 fe                     	movq	%rdi, %r14
  69d5e7: 0f 10 05 92 c8 45 00         	movups	0x45c892(%rip), %xmm0   # 0xaf9e80 ; ELF relocation: local pointer 0xaef08
  69d5ee: 48 8d 44 24 07               	leaq	0x7(%rsp), %rax
  69d5f3: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  69d5f8: 0f 11 44 24 10               	movups	%xmm0, 0x10(%rsp)
  69d5fd: 48 8b 05 8c c8 45 00         	movq	0x45c88c(%rip), %rax    # 0xaf9e90
  69d604: 48 83 f8 02                  	cmpq	$0x2, %rax
  69d608: 0f 85 35 01 00 00            	jne	0x69d743 <PyInit__native+0x421043>
  69d60e: 48 8d 05 83 c8 45 00         	leaq	0x45c883(%rip), %rax    # 0xaf9e98
  69d615: 48 8b 30                     	movq	(%rax), %rsi
  69d618: 48 89 df                     	movq	%rbx, %rdi
  69d61b: ff 15 97 a3 45 00            	callq	*0x45a397(%rip)         # 0xaf79b8 ; ELF relocation: PyObject_GetAttr
  69d621: 48 85 c0                     	testq	%rax, %rax
  69d624: 74 6c                        	je	0x69d692 <PyInit__native+0x420f92>
  69d626: 49 89 c4                     	movq	%rax, %r12
  69d629: 48 8b 78 08                  	movq	0x8(%rax), %rdi
  69d62d: ff 15 a5 a2 45 00            	callq	*0x45a2a5(%rip)         # 0xaf78d8 ; ELF relocation: PyType_GetFlags
  69d633: a9 00 00 00 10               	testl	$0x10000000, %eax       # imm = 0x10000000
  69d638: 0f 85 d0 00 00 00            	jne	0x69d70e <PyInit__native+0x42100e>
  69d63e: 4c 8b 3d c3 a3 45 00         	movq	0x45a3c3(%rip), %r15    # 0xaf7a08 ; ELF relocation: PyUnicode_Type
  69d645: 4c 89 ff                     	movq	%r15, %rdi
  69d648: ff 15 92 a2 45 00            	callq	*0x45a292(%rip)         # 0xaf78e0 ; ELF relocation: _Py_IncRef
  69d64e: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69d653: 4c 89 e6                     	movq	%r12, %rsi
  69d656: 4c 89 fa                     	movq	%r15, %rdx
  69d659: e8 22 59 ff ff               	callq	0x692f80 <PyInit__native+0x416880>
  69d65e: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  69d663: 0f 10 4c 24 18               	movups	0x18(%rsp), %xmm1
  69d668: 0f 10 54 24 28               	movups	0x28(%rsp), %xmm2
  69d66d: 0f 10 5c 24 38               	movups	0x38(%rsp), %xmm3
  69d672: 41 0f 11 5e 38               	movups	%xmm3, 0x38(%r14)
  69d677: 41 0f 11 56 28               	movups	%xmm2, 0x28(%r14)
  69d67c: 41 0f 11 4e 18               	movups	%xmm1, 0x18(%r14)
  69d681: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  69d686: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  69d68d: e9 99 00 00 00               	jmp	0x69d72b <PyInit__native+0x42102b>
  69d692: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69d697: e8 b4 3b ff ff               	callq	0x691250 <PyInit__native+0x414b50>
  69d69c: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  69d6a1: 0f 85 b2 00 00 00            	jne	0x69d759 <PyInit__native+0x421059>
  69d6a7: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  69d6ac: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  69d6b1: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  69d6b6: 0f 10 5c 24 40               	movups	0x40(%rsp), %xmm3
  69d6bb: 0f 29 9c 24 80 00 00 00      	movaps	%xmm3, 0x80(%rsp)
  69d6c3: 0f 29 54 24 70               	movaps	%xmm2, 0x70(%rsp)
  69d6c8: 0f 29 4c 24 60               	movaps	%xmm1, 0x60(%rsp)
  69d6cd: 0f 29 44 24 50               	movaps	%xmm0, 0x50(%rsp)
  69d6d2: 48 8b 44 24 50               	movq	0x50(%rsp), %rax
  69d6d7: 48 8b 8c 24 88 00 00 00      	movq	0x88(%rsp), %rcx
  69d6df: 49 89 4e 40                  	movq	%rcx, 0x40(%r14)
  69d6e3: 0f 10 44 24 78               	movups	0x78(%rsp), %xmm0
  69d6e8: 41 0f 11 46 30               	movups	%xmm0, 0x30(%r14)
  69d6ed: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  69d6f2: 41 0f 11 46 20               	movups	%xmm0, 0x20(%r14)
  69d6f7: 0f 10 44 24 58               	movups	0x58(%rsp), %xmm0
  69d6fc: 41 0f 11 46 10               	movups	%xmm0, 0x10(%r14)
  69d701: 49 89 46 08                  	movq	%rax, 0x8(%r14)
  69d705: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  69d70c: eb 1d                        	jmp	0x69d72b <PyInit__native+0x42102b>
  69d70e: 4c 89 f7                     	movq	%r14, %rdi
  69d711: 4c 89 fe                     	movq	%r15, %rsi
  69d714: 4c 89 e2                     	movq	%r12, %rdx
  69d717: 48 89 d9                     	movq	%rbx, %rcx
  69d71a: e8 51 f4 ff ff               	callq	0x69cb70 <PyInit__native+0x420470>
  69d71f: 48 89 df                     	movq	%rbx, %rdi
  69d722: ff 15 80 a1 45 00            	callq	*0x45a180(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d728: 4c 89 e3                     	movq	%r12, %rbx
  69d72b: 48 89 df                     	movq	%rbx, %rdi
  69d72e: ff 15 74 a1 45 00            	callq	*0x45a174(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d734: 48 81 c4 98 00 00 00         	addq	$0x98, %rsp
  69d73b: 5b                           	popq	%rbx
  69d73c: 41 5c                        	popq	%r12
  69d73e: 41 5e                        	popq	%r14
  69d740: 41 5f                        	popq	%r15
  69d742: c3                           	retq
  69d743: 48 8d 3d 46 c7 45 00         	leaq	0x45c746(%rip), %rdi    # 0xaf9e90
  69d74a: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  69d74f: e8 7c 57 ff ff               	callq	0x692ed0 <PyInit__native+0x4167d0>
  69d754: e9 bc fe ff ff               	jmp	0x69d615 <PyInit__native+0x420f15>
  69d759: 48 8d 7c 24 50               	leaq	0x50(%rsp), %rdi
  69d75e: e8 2d 3d ff ff               	callq	0x691490 <PyInit__native+0x414d90>
  69d763: e9 6a ff ff ff               	jmp	0x69d6d2 <PyInit__native+0x420fd2>
  69d768: 49 89 c6                     	movq	%rax, %r14
  69d76b: 48 89 df                     	movq	%rbx, %rdi
  69d76e: ff 15 34 a1 45 00            	callq	*0x45a134(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d774: 4c 89 e3                     	movq	%r12, %rbx
  69d777: 48 89 df                     	movq	%rbx, %rdi
  69d77a: ff 15 28 a1 45 00            	callq	*0x45a128(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d780: 4c 89 f7                     	movq	%r14, %rdi
  69d783: e8 48 06 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  69d788: 49 89 c6                     	movq	%rax, %r14
  69d78b: 48 89 df                     	movq	%rbx, %rdi
  69d78e: ff 15 14 a1 45 00            	callq	*0x45a114(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d794: 4c 89 f7                     	movq	%r14, %rdi
  69d797: e8 34 06 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
