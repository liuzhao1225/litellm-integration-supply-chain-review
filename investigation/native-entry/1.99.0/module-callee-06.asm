
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  2afe70: 41 57                        	pushq	%r15
  2afe72: 41 56                        	pushq	%r14
  2afe74: 41 54                        	pushq	%r12
  2afe76: 53                           	pushq	%rbx
  2afe77: 50                           	pushq	%rax
  2afe78: 4c 89 c3                     	movq	%r8, %rbx
  2afe7b: 49 89 f7                     	movq	%rsi, %r15
  2afe7e: 49 89 fc                     	movq	%rdi, %r12
  2afe81: 48 89 d7                     	movq	%rdx, %rdi
  2afe84: 48 89 ce                     	movq	%rcx, %rsi
  2afe87: ff 15 6b f1 83 00            	callq	*0x83f16b(%rip)         # 0xaeeff8 ; ELF relocation: PyUnicode_FromStringAndSize
  2afe8d: 48 85 c0                     	testq	%rax, %rax
  2afe90: 74 34                        	je	0x2afec6 <PyInit__native+0x353c6>
  2afe92: 49 89 c6                     	movq	%rax, %r14
  2afe95: 4c 89 e7                     	movq	%r12, %rdi
  2afe98: 4c 89 fe                     	movq	%r15, %rsi
  2afe9b: 48 89 c2                     	movq	%rax, %rdx
  2afe9e: 48 89 d9                     	movq	%rbx, %rcx
  2afea1: e8 6a 6b 3e 00               	callq	0x696a10 <PyInit__native+0x41bf10>
  2afea6: 4c 8b 3d fb f0 83 00         	movq	0x83f0fb(%rip), %r15    # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2afead: 48 89 df                     	movq	%rbx, %rdi
  2afeb0: 41 ff d7                     	callq	*%r15
  2afeb3: 4c 89 f7                     	movq	%r14, %rdi
  2afeb6: 4c 89 f8                     	movq	%r15, %rax
  2afeb9: 48 83 c4 08                  	addq	$0x8, %rsp
  2afebd: 5b                           	popq	%rbx
  2afebe: 41 5c                        	popq	%r12
  2afec0: 41 5e                        	popq	%r14
  2afec2: 41 5f                        	popq	%r15
  2afec4: ff e0                        	jmpq	*%rax
  2afec6: 48 8d 3d 63 0b 82 00         	leaq	0x820b63(%rip), %rdi    # 0xad0a30 ; ELF relocation: local pointer 0xd39ea
  2afecd: e8 0e b9 3d 00               	callq	0x68b7e0 <PyInit__native+0x410ce0>
  2afed2: 0f 0b                        	ud2
  2afed4: 49 89 c7                     	movq	%rax, %r15
  2afed7: 48 89 df                     	movq	%rbx, %rdi
  2afeda: ff 15 c8 f0 83 00            	callq	*0x83f0c8(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2afee0: 4c 89 f7                     	movq	%r14, %rdi
  2afee3: ff 15 bf f0 83 00            	callq	*0x83f0bf(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2afee9: 4c 89 ff                     	movq	%r15, %rdi
  2afeec: e8 9f 57 80 00               	callq	0xab5690 <_Unwind_Resume@plt>
  2afef1: 49 89 c7                     	movq	%rax, %r15
  2afef4: 49 89 de                     	movq	%rbx, %r14
  2afef7: 4c 89 f7                     	movq	%r14, %rdi
  2afefa: ff 15 a8 f0 83 00            	callq	*0x83f0a8(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2aff00: 4c 89 ff                     	movq	%r15, %rdi
  2aff03: e8 88 57 80 00               	callq	0xab5690 <_Unwind_Resume@plt>
