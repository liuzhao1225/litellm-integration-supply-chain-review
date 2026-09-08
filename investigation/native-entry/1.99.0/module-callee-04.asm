
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  697250: 41 57                        	pushq	%r15
  697252: 41 56                        	pushq	%r14
  697254: 41 54                        	pushq	%r12
  697256: 53                           	pushq	%rbx
  697257: 48 81 ec 98 00 00 00         	subq	$0x98, %rsp
  69725e: 48 89 d3                     	movq	%rdx, %rbx
  697261: 49 89 f7                     	movq	%rsi, %r15
  697264: 49 89 fe                     	movq	%rdi, %r14
  697267: 0f 10 05 e2 a1 45 00         	movups	0x45a1e2(%rip), %xmm0   # 0xaf1450 ; ELF relocation: local pointer 0xaad70
  69726e: 48 8d 44 24 07               	leaq	0x7(%rsp), %rax
  697273: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  697278: 0f 11 44 24 10               	movups	%xmm0, 0x10(%rsp)
  69727d: 48 8b 05 dc a1 45 00         	movq	0x45a1dc(%rip), %rax    # 0xaf1460
  697284: 48 83 f8 02                  	cmpq	$0x2, %rax
  697288: 0f 85 35 01 00 00            	jne	0x6973c3 <PyInit__native+0x41c8c3>
  69728e: 48 8d 05 d3 a1 45 00         	leaq	0x45a1d3(%rip), %rax    # 0xaf1468
  697295: 48 8b 30                     	movq	(%rax), %rsi
  697298: 48 89 df                     	movq	%rbx, %rdi
  69729b: ff 15 2f 7e 45 00            	callq	*0x457e2f(%rip)         # 0xaef0d0 ; ELF relocation: PyObject_GetAttr
  6972a1: 48 85 c0                     	testq	%rax, %rax
  6972a4: 74 6c                        	je	0x697312 <PyInit__native+0x41c812>
  6972a6: 49 89 c4                     	movq	%rax, %r12
  6972a9: 48 8b 78 08                  	movq	0x8(%rax), %rdi
  6972ad: ff 15 45 81 45 00            	callq	*0x458145(%rip)         # 0xaef3f8 ; ELF relocation: PyType_GetFlags
  6972b3: a9 00 00 00 10               	testl	$0x10000000, %eax       # imm = 0x10000000
  6972b8: 0f 85 d0 00 00 00            	jne	0x69738e <PyInit__native+0x41c88e>
  6972be: 4c 8b 3d 3b 81 45 00         	movq	0x45813b(%rip), %r15    # 0xaef400 ; ELF relocation: PyUnicode_Type
  6972c5: 4c 89 ff                     	movq	%r15, %rdi
  6972c8: ff 15 fa 7c 45 00            	callq	*0x457cfa(%rip)         # 0xaeefc8 ; ELF relocation: _Py_IncRef
  6972ce: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  6972d3: 4c 89 e6                     	movq	%r12, %rsi
  6972d6: 4c 89 fa                     	movq	%r15, %rdx
  6972d9: e8 c2 5c ff ff               	callq	0x68cfa0 <PyInit__native+0x4124a0>
  6972de: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  6972e3: 0f 10 4c 24 18               	movups	0x18(%rsp), %xmm1
  6972e8: 0f 10 54 24 28               	movups	0x28(%rsp), %xmm2
  6972ed: 0f 10 5c 24 38               	movups	0x38(%rsp), %xmm3
  6972f2: 41 0f 11 5e 38               	movups	%xmm3, 0x38(%r14)
  6972f7: 41 0f 11 56 28               	movups	%xmm2, 0x28(%r14)
  6972fc: 41 0f 11 4e 18               	movups	%xmm1, 0x18(%r14)
  697301: 41 0f 11 46 08               	movups	%xmm0, 0x8(%r14)
  697306: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  69730d: e9 99 00 00 00               	jmp	0x6973ab <PyInit__native+0x41c8ab>
  697312: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  697317: e8 54 3f ff ff               	callq	0x68b270 <PyInit__native+0x410770>
  69731c: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  697321: 0f 85 b2 00 00 00            	jne	0x6973d9 <PyInit__native+0x41c8d9>
  697327: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  69732c: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  697331: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  697336: 0f 10 5c 24 40               	movups	0x40(%rsp), %xmm3
  69733b: 0f 29 9c 24 80 00 00 00      	movaps	%xmm3, 0x80(%rsp)
  697343: 0f 29 54 24 70               	movaps	%xmm2, 0x70(%rsp)
  697348: 0f 29 4c 24 60               	movaps	%xmm1, 0x60(%rsp)
  69734d: 0f 29 44 24 50               	movaps	%xmm0, 0x50(%rsp)
  697352: 48 8b 44 24 50               	movq	0x50(%rsp), %rax
  697357: 48 8b 8c 24 88 00 00 00      	movq	0x88(%rsp), %rcx
  69735f: 49 89 4e 40                  	movq	%rcx, 0x40(%r14)
  697363: 0f 10 44 24 78               	movups	0x78(%rsp), %xmm0
  697368: 41 0f 11 46 30               	movups	%xmm0, 0x30(%r14)
  69736d: 0f 10 44 24 68               	movups	0x68(%rsp), %xmm0
  697372: 41 0f 11 46 20               	movups	%xmm0, 0x20(%r14)
  697377: 0f 10 44 24 58               	movups	0x58(%rsp), %xmm0
  69737c: 41 0f 11 46 10               	movups	%xmm0, 0x10(%r14)
  697381: 49 89 46 08                  	movq	%rax, 0x8(%r14)
  697385: 49 c7 06 01 00 00 00         	movq	$0x1, (%r14)
  69738c: eb 1d                        	jmp	0x6973ab <PyInit__native+0x41c8ab>
  69738e: 4c 89 f7                     	movq	%r14, %rdi
  697391: 4c 89 fe                     	movq	%r15, %rsi
  697394: 4c 89 e2                     	movq	%r12, %rdx
  697397: 48 89 d9                     	movq	%rbx, %rcx
  69739a: e8 71 f6 ff ff               	callq	0x696a10 <PyInit__native+0x41bf10>
  69739f: 48 89 df                     	movq	%rbx, %rdi
  6973a2: ff 15 00 7c 45 00            	callq	*0x457c00(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  6973a8: 4c 89 e3                     	movq	%r12, %rbx
  6973ab: 48 89 df                     	movq	%rbx, %rdi
  6973ae: ff 15 f4 7b 45 00            	callq	*0x457bf4(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  6973b4: 48 81 c4 98 00 00 00         	addq	$0x98, %rsp
  6973bb: 5b                           	popq	%rbx
  6973bc: 41 5c                        	popq	%r12
  6973be: 41 5e                        	popq	%r14
  6973c0: 41 5f                        	popq	%r15
  6973c2: c3                           	retq
  6973c3: 48 8d 3d 96 a0 45 00         	leaq	0x45a096(%rip), %rdi    # 0xaf1460
  6973ca: 48 8d 74 24 08               	leaq	0x8(%rsp), %rsi
  6973cf: e8 1c 5b ff ff               	callq	0x68cef0 <PyInit__native+0x4123f0>
  6973d4: e9 bc fe ff ff               	jmp	0x697295 <PyInit__native+0x41c795>
  6973d9: 48 8d 7c 24 50               	leaq	0x50(%rsp), %rdi
  6973de: e8 cd 40 ff ff               	callq	0x68b4b0 <PyInit__native+0x4109b0>
  6973e3: e9 6a ff ff ff               	jmp	0x697352 <PyInit__native+0x41c852>
  6973e8: 49 89 c6                     	movq	%rax, %r14
  6973eb: 48 89 df                     	movq	%rbx, %rdi
  6973ee: ff 15 b4 7b 45 00            	callq	*0x457bb4(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  6973f4: 4c 89 e3                     	movq	%r12, %rbx
  6973f7: 48 89 df                     	movq	%rbx, %rdi
  6973fa: ff 15 a8 7b 45 00            	callq	*0x457ba8(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  697400: 4c 89 f7                     	movq	%r14, %rdi
  697403: e8 88 e2 41 00               	callq	0xab5690 <_Unwind_Resume@plt>
  697408: 49 89 c6                     	movq	%rax, %r14
  69740b: 48 89 df                     	movq	%rbx, %rdi
  69740e: ff 15 94 7b 45 00            	callq	*0x457b94(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  697414: 4c 89 f7                     	movq	%r14, %rdi
  697417: e8 74 e2 41 00               	callq	0xab5690 <_Unwind_Resume@plt>
