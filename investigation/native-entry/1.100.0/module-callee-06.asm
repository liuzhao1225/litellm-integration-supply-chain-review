
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  2bf370: 41 57                        	pushq	%r15
  2bf372: 41 56                        	pushq	%r14
  2bf374: 41 54                        	pushq	%r12
  2bf376: 53                           	pushq	%rbx
  2bf377: 50                           	pushq	%rax
  2bf378: 4c 89 c3                     	movq	%r8, %rbx
  2bf37b: 49 89 f7                     	movq	%rsi, %r15
  2bf37e: 49 89 fc                     	movq	%rdi, %r12
  2bf381: 48 89 d7                     	movq	%rdx, %rdi
  2bf384: 48 89 ce                     	movq	%rcx, %rsi
  2bf387: ff 15 ab 85 83 00            	callq	*0x8385ab(%rip)         # 0xaf7938 ; ELF relocation: PyUnicode_FromStringAndSize
  2bf38d: 48 85 c0                     	testq	%rax, %rax
  2bf390: 74 34                        	je	0x2bf3c6 <PyInit__native+0x42cc6>
  2bf392: 49 89 c6                     	movq	%rax, %r14
  2bf395: 4c 89 e7                     	movq	%r12, %rdi
  2bf398: 4c 89 fe                     	movq	%r15, %rsi
  2bf39b: 48 89 c2                     	movq	%rax, %rdx
  2bf39e: 48 89 d9                     	movq	%rbx, %rcx
  2bf3a1: e8 ca d7 3d 00               	callq	0x69cb70 <PyInit__native+0x420470>
  2bf3a6: 4c 8b 3d fb 84 83 00         	movq	0x8384fb(%rip), %r15    # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf3ad: 48 89 df                     	movq	%rbx, %rdi
  2bf3b0: 41 ff d7                     	callq	*%r15
  2bf3b3: 4c 89 f7                     	movq	%r14, %rdi
  2bf3b6: 4c 89 f8                     	movq	%r15, %rax
  2bf3b9: 48 83 c4 08                  	addq	$0x8, %rsp
  2bf3bd: 5b                           	popq	%rbx
  2bf3be: 41 5c                        	popq	%r12
  2bf3c0: 41 5e                        	popq	%r14
  2bf3c2: 41 5f                        	popq	%r15
  2bf3c4: ff e0                        	jmpq	*%rax
  2bf3c6: 48 8d 3d 3b 9e 81 00         	leaq	0x819e3b(%rip), %rdi    # 0xad9208 ; ELF relocation: local pointer 0xd4bd6
  2bf3cd: e8 ee 23 3d 00               	callq	0x6917c0 <PyInit__native+0x4150c0>
  2bf3d2: 0f 0b                        	ud2
  2bf3d4: 49 89 c7                     	movq	%rax, %r15
  2bf3d7: 48 89 df                     	movq	%rbx, %rdi
  2bf3da: ff 15 c8 84 83 00            	callq	*0x8384c8(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf3e0: 4c 89 f7                     	movq	%r14, %rdi
  2bf3e3: ff 15 bf 84 83 00            	callq	*0x8384bf(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf3e9: 4c 89 ff                     	movq	%r15, %rdi
  2bf3ec: e8 df e9 7f 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  2bf3f1: 49 89 c7                     	movq	%rax, %r15
  2bf3f4: 49 89 de                     	movq	%rbx, %r14
  2bf3f7: 4c 89 f7                     	movq	%r14, %rdi
  2bf3fa: ff 15 a8 84 83 00            	callq	*0x8384a8(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf400: 4c 89 ff                     	movq	%r15, %rdi
  2bf403: e8 c8 e9 7f 00               	callq	0xabddd0 <_Unwind_Resume@plt>
