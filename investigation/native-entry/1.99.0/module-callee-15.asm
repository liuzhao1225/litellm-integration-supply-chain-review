
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68ee90: 55                           	pushq	%rbp
  68ee91: 41 57                        	pushq	%r15
  68ee93: 41 56                        	pushq	%r14
  68ee95: 41 55                        	pushq	%r13
  68ee97: 41 54                        	pushq	%r12
  68ee99: 53                           	pushq	%rbx
  68ee9a: 48 83 ec 18                  	subq	$0x18, %rsp
  68ee9e: 49 89 d6                     	movq	%rdx, %r14
  68eea1: 48 89 f3                     	movq	%rsi, %rbx
  68eea4: 49 89 ff                     	movq	%rdi, %r15
  68eea7: 4c 8b 62 18                  	movq	0x18(%rdx), %r12
  68eeab: 48 89 e7                     	movq	%rsp, %rdi
  68eeae: 41 ff d4                     	callq	*%r12
  68eeb1: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  68eeb6: 66 0f 74 05 f2 c1 a1 ff      	pcmpeqb	-0x5e3e0e(%rip), %xmm0  # 0xab0b0
  68eebe: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  68eec2: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  68eec7: 75 4b                        	jne	0x68ef14 <PyInit__native+0x414414>
  68eec9: 4c 8b 63 10                  	movq	0x10(%rbx), %r12
  68eecd: 4d 85 e4                     	testq	%r12, %r12
  68eed0: 0f 84 a6 00 00 00            	je	0x68ef7c <PyInit__native+0x41447c>
  68eed6: 48 8b 6b 08                  	movq	0x8(%rbx), %rbp
  68eeda: 4c 89 e7                     	movq	%r12, %rdi
  68eedd: ff 15 7d 00 46 00            	callq	*0x46007d(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68eee3: 48 85 c0                     	testq	%rax, %rax
  68eee6: 0f 84 96 01 00 00            	je	0x68f082 <PyInit__native+0x414582>
  68eeec: 49 89 c5                     	movq	%rax, %r13
  68eeef: 48 89 c7                     	movq	%rax, %rdi
  68eef2: 48 89 ee                     	movq	%rbp, %rsi
  68eef5: 4c 89 e2                     	movq	%r12, %rdx
  68eef8: ff 15 6a 00 46 00            	callq	*0x46006a(%rip)         # 0xaeef68 ; ELF relocation: memcpy
  68eefe: bf 18 00 00 00               	movl	$0x18, %edi
  68ef03: ff 15 57 00 46 00            	callq	*0x460057(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68ef09: 48 85 c0                     	testq	%rax, %rax
  68ef0c: 0f 85 d1 00 00 00            	jne	0x68efe3 <PyInit__native+0x4144e3>
  68ef12: eb 7e                        	jmp	0x68ef92 <PyInit__native+0x414492>
  68ef14: 48 89 e7                     	movq	%rsp, %rdi
  68ef17: 48 89 de                     	movq	%rbx, %rsi
  68ef1a: 41 ff d4                     	callq	*%r12
  68ef1d: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  68ef22: 66 0f 74 05 b6 d0 a1 ff      	pcmpeqb	-0x5e2f4a(%rip), %xmm0  # 0xabfe0
  68ef2a: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  68ef2e: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  68ef33: 75 18                        	jne	0x68ef4d <PyInit__native+0x41444d>
  68ef35: 4c 8b 63 08                  	movq	0x8(%rbx), %r12
  68ef39: 4d 85 e4                     	testq	%r12, %r12
  68ef3c: 79 68                        	jns	0x68efa6 <PyInit__native+0x4144a6>
  68ef3e: 31 ff                        	xorl	%edi, %edi
  68ef40: 4c 89 e6                     	movq	%r12, %rsi
  68ef43: e8 f0 c8 ca ff               	callq	0x33b838 <PyInit__native+0xc0d38>
  68ef48: e9 33 01 00 00               	jmp	0x68f080 <PyInit__native+0x414580>
  68ef4d: bf 10 00 00 00               	movl	$0x10, %edi
  68ef52: ff 15 08 00 46 00            	callq	*0x460008(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68ef58: 48 85 c0                     	testq	%rax, %rax
  68ef5b: 0f 84 10 01 00 00            	je	0x68f071 <PyInit__native+0x414571>
  68ef61: 48 8d 0d d7 bf a8 ff         	leaq	-0x574029(%rip), %rcx   # 0x11af3f ; rodata: 'panic from Rust codePython major version missingPython minor version missingassertion failed: patch_str.is_none()Python major version not an integerassertion failed: self.has_trave'
  68ef68: 48 89 08                     	movq	%rcx, (%rax)
  68ef6b: 48 c7 40 08 14 00 00 00      	movq	$0x14, 0x8(%rax)
  68ef73: 48 8d 0d ae 13 44 00         	leaq	0x4413ae(%rip), %rcx    # 0xad0328
  68ef7a: eb 79                        	jmp	0x68eff5 <PyInit__native+0x4144f5>
  68ef7c: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  68ef82: bf 18 00 00 00               	movl	$0x18, %edi
  68ef87: ff 15 d3 ff 45 00            	callq	*0x45ffd3(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68ef8d: 48 85 c0                     	testq	%rax, %rax
  68ef90: 75 51                        	jne	0x68efe3 <PyInit__native+0x4144e3>
  68ef92: bf 08 00 00 00               	movl	$0x8, %edi
  68ef97: be 18 00 00 00               	movl	$0x18, %esi
  68ef9c: e8 a1 c9 ca ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  68efa1: e9 da 00 00 00               	jmp	0x68f080 <PyInit__native+0x414580>
  68efa6: 0f 84 9e 00 00 00            	je	0x68f04a <PyInit__native+0x41454a>
  68efac: 48 8b 2b                     	movq	(%rbx), %rbp
  68efaf: 4c 89 e7                     	movq	%r12, %rdi
  68efb2: ff 15 a8 ff 45 00            	callq	*0x45ffa8(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68efb8: 48 85 c0                     	testq	%rax, %rax
  68efbb: 0f 84 c1 00 00 00            	je	0x68f082 <PyInit__native+0x414582>
  68efc1: 49 89 c5                     	movq	%rax, %r13
  68efc4: 48 89 c7                     	movq	%rax, %rdi
  68efc7: 48 89 ee                     	movq	%rbp, %rsi
  68efca: 4c 89 e2                     	movq	%r12, %rdx
  68efcd: ff 15 95 ff 45 00            	callq	*0x45ff95(%rip)         # 0xaeef68 ; ELF relocation: memcpy
  68efd3: bf 18 00 00 00               	movl	$0x18, %edi
  68efd8: ff 15 82 ff 45 00            	callq	*0x45ff82(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68efde: 48 85 c0                     	testq	%rax, %rax
  68efe1: 74 7d                        	je	0x68f060 <PyInit__native+0x414560>
  68efe3: 4c 89 20                     	movq	%r12, (%rax)
  68efe6: 4c 89 68 08                  	movq	%r13, 0x8(%rax)
  68efea: 4c 89 60 10                  	movq	%r12, 0x10(%rax)
  68efee: 48 8d 0d 53 13 44 00         	leaq	0x441353(%rip), %rcx    # 0xad0348 ; ELF relocation: local pointer 0x38ee50
  68eff5: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  68eff9: f3 41 0f 7f 07               	movdqu	%xmm0, (%r15)
  68effe: 49 c7 47 10 01 00 00 00      	movq	$0x1, 0x10(%r15)
  68f006: 49 c7 47 18 00 00 00 00      	movq	$0x0, 0x18(%r15)
  68f00e: 49 89 47 20                  	movq	%rax, 0x20(%r15)
  68f012: 49 89 4f 28                  	movq	%rcx, 0x28(%r15)
  68f016: 41 c7 47 38 03 00 00 00      	movl	$0x3, 0x38(%r15)
  68f01e: 49 8b 06                     	movq	(%r14), %rax
  68f021: 48 85 c0                     	testq	%rax, %rax
  68f024: 74 05                        	je	0x68f02b <PyInit__native+0x41452b>
  68f026: 48 89 df                     	movq	%rbx, %rdi
  68f029: ff d0                        	callq	*%rax
  68f02b: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  68f030: 74 09                        	je	0x68f03b <PyInit__native+0x41453b>
  68f032: 48 89 df                     	movq	%rbx, %rdi
  68f035: ff 15 35 ff 45 00            	callq	*0x45ff35(%rip)         # 0xaeef70 ; ELF relocation: free
  68f03b: 48 83 c4 18                  	addq	$0x18, %rsp
  68f03f: 5b                           	popq	%rbx
  68f040: 41 5c                        	popq	%r12
  68f042: 41 5d                        	popq	%r13
  68f044: 41 5e                        	popq	%r14
  68f046: 41 5f                        	popq	%r15
  68f048: 5d                           	popq	%rbp
  68f049: c3                           	retq
  68f04a: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  68f050: bf 18 00 00 00               	movl	$0x18, %edi
  68f055: ff 15 05 ff 45 00            	callq	*0x45ff05(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68f05b: 48 85 c0                     	testq	%rax, %rax
  68f05e: 75 83                        	jne	0x68efe3 <PyInit__native+0x4144e3>
  68f060: bf 08 00 00 00               	movl	$0x8, %edi
  68f065: be 18 00 00 00               	movl	$0x18, %esi
  68f06a: e8 d3 c8 ca ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  68f06f: eb 0f                        	jmp	0x68f080 <PyInit__native+0x414580>
  68f071: bf 08 00 00 00               	movl	$0x8, %edi
  68f076: be 10 00 00 00               	movl	$0x10, %esi
  68f07b: e8 c2 c8 ca ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  68f080: 0f 0b                        	ud2
  68f082: bf 01 00 00 00               	movl	$0x1, %edi
  68f087: e9 b4 fe ff ff               	jmp	0x68ef40 <PyInit__native+0x414440>
  68f08c: 49 89 c7                     	movq	%rax, %r15
  68f08f: eb 25                        	jmp	0x68f0b6 <PyInit__native+0x4145b6>
  68f091: eb 00                        	jmp	0x68f093 <PyInit__native+0x414593>
  68f093: 49 89 c7                     	movq	%rax, %r15
  68f096: 4d 85 e4                     	testq	%r12, %r12
  68f099: 74 0e                        	je	0x68f0a9 <PyInit__native+0x4145a9>
  68f09b: 4c 89 ef                     	movq	%r13, %rdi
  68f09e: ff 15 cc fe 45 00            	callq	*0x45fecc(%rip)         # 0xaeef70 ; ELF relocation: free
  68f0a4: eb 03                        	jmp	0x68f0a9 <PyInit__native+0x4145a9>
  68f0a6: 49 89 c7                     	movq	%rax, %r15
  68f0a9: 49 8b 06                     	movq	(%r14), %rax
  68f0ac: 48 85 c0                     	testq	%rax, %rax
  68f0af: 74 05                        	je	0x68f0b6 <PyInit__native+0x4145b6>
  68f0b1: 48 89 df                     	movq	%rbx, %rdi
  68f0b4: ff d0                        	callq	*%rax
  68f0b6: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  68f0bb: 74 09                        	je	0x68f0c6 <PyInit__native+0x4145c6>
  68f0bd: 48 89 df                     	movq	%rbx, %rdi
  68f0c0: ff 15 aa fe 45 00            	callq	*0x45feaa(%rip)         # 0xaeef70 ; ELF relocation: free
  68f0c6: 4c 89 ff                     	movq	%r15, %rdi
  68f0c9: e8 c2 65 42 00               	callq	0xab5690 <_Unwind_Resume@plt>
  68f0ce: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  68f0d3: 74 09                        	je	0x68f0de <PyInit__native+0x4145de>
  68f0d5: 48 89 df                     	movq	%rbx, %rdi
  68f0d8: ff 15 92 fe 45 00            	callq	*0x45fe92(%rip)         # 0xaeef70 ; ELF relocation: free
  68f0de: e8 c9 b6 ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
