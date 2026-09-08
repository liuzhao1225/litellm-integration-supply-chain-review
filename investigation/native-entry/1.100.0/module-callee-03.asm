
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  691250: 55                           	pushq	%rbp
  691251: 41 57                        	pushq	%r15
  691253: 41 56                        	pushq	%r14
  691255: 41 54                        	pushq	%r12
  691257: 53                           	pushq	%rbx
  691258: 48 81 ec 80 00 00 00         	subq	$0x80, %rsp
  69125f: 48 89 fb                     	movq	%rdi, %rbx
  691262: 48 c7 44 24 18 00 00 00 00   	movq	$0x0, 0x18(%rsp)
  69126b: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  691274: 48 c7 44 24 20 00 00 00 00   	movq	$0x0, 0x20(%rsp)
  69127d: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  691282: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  691287: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  69128c: ff 15 ae 6b 46 00            	callq	*0x466bae(%rip)         # 0xaf7e40 ; ELF relocation: PyErr_Fetch
  691292: 48 83 7c 24 18 00            	cmpq	$0x0, 0x18(%rsp)
  691298: 0f 84 f5 00 00 00            	je	0x691393 <PyInit__native+0x414c93>
  69129e: 4c 8d 7c 24 18               	leaq	0x18(%rsp), %r15
  6912a3: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  6912a8: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  6912ad: 4c 89 ff                     	movq	%r15, %rdi
  6912b0: ff 15 92 6b 46 00            	callq	*0x466b92(%rip)         # 0xaf7e48 ; ELF relocation: PyErr_NormalizeException
  6912b6: 4c 8b 64 24 18               	movq	0x18(%rsp), %r12
  6912bb: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  6912c0: 4d 85 f6                     	testq	%r14, %r14
  6912c3: 40 0f 94 c5                  	sete	%bpl
  6912c7: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  6912cc: 4d 85 e4                     	testq	%r12, %r12
  6912cf: 0f 84 cf 00 00 00            	je	0x6913a4 <PyInit__native+0x414ca4>
  6912d5: 48 85 ff                     	testq	%rdi, %rdi
  6912d8: 0f 84 f4 00 00 00            	je	0x6913d2 <PyInit__native+0x414cd2>
  6912de: 4c 89 64 24 60               	movq	%r12, 0x60(%rsp)
  6912e3: 48 89 7c 24 68               	movq	%rdi, 0x68(%rsp)
  6912e8: 48 c7 44 24 70 00 00 00 00   	movq	$0x0, 0x70(%rsp)
  6912f1: 4c 89 74 24 78               	movq	%r14, 0x78(%rsp)
  6912f6: 4c 8b 77 08                  	movq	0x8(%rdi), %r14
  6912fa: 48 8b 05 b7 9a 46 00         	movq	0x469ab7(%rip), %rax    # 0xafadb8
  691301: 48 83 f8 02                  	cmpq	$0x2, %rax
  691305: 0f 85 e1 00 00 00            	jne	0x6913ec <PyInit__native+0x414cec>
  69130b: 4c 3b 35 ae 9a 46 00         	cmpq	0x469aae(%rip), %r14    # 0xafadc0
  691312: 0f 84 e3 00 00 00            	je	0x6913fb <PyInit__native+0x414cfb>
  691318: 0f 10 44 24 60               	movups	0x60(%rsp), %xmm0
  69131d: 0f 10 4c 24 70               	movups	0x70(%rsp), %xmm1
  691322: 0f 11 4c 24 48               	movups	%xmm1, 0x48(%rsp)
  691327: 0f 11 44 24 38               	movups	%xmm0, 0x38(%rsp)
  69132c: c7 44 24 58 03 00 00 00      	movl	$0x3, 0x58(%rsp)
  691334: 0f 57 c0                     	xorps	%xmm0, %xmm0
  691337: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  69133c: 48 c7 44 24 30 01 00 00 00   	movq	$0x1, 0x30(%rsp)
  691345: 8b 44 24 58                  	movl	0x58(%rsp), %eax
  691349: 85 c0                        	testl	%eax, %eax
  69134b: 0f 85 b4 00 00 00            	jne	0x691405 <PyInit__native+0x414d05>
  691351: 0f 28 44 24 20               	movaps	0x20(%rsp), %xmm0
  691356: 48 8b 44 24 30               	movq	0x30(%rsp), %rax
  69135b: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  691360: 0f 28 4c 24 40               	movaps	0x40(%rsp), %xmm1
  691365: 48 8b 54 24 50               	movq	0x50(%rsp), %rdx
  69136a: 48 89 53 38                  	movq	%rdx, 0x38(%rbx)
  69136e: 8b 54 24 58                  	movl	0x58(%rsp), %edx
  691372: 89 53 40                     	movl	%edx, 0x40(%rbx)
  691375: 8b 54 24 5c                  	movl	0x5c(%rsp), %edx
  691379: 89 53 44                     	movl	%edx, 0x44(%rbx)
  69137c: 0f 11 4b 28                  	movups	%xmm1, 0x28(%rbx)
  691380: 48 89 43 18                  	movq	%rax, 0x18(%rbx)
  691384: 48 89 4b 20                  	movq	%rcx, 0x20(%rbx)
  691388: 0f 11 43 08                  	movups	%xmm0, 0x8(%rbx)
  69138c: b8 01 00 00 00               	movl	$0x1, %eax
  691391: eb 2c                        	jmp	0x6913bf <PyInit__native+0x414cbf>
  691393: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  691398: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  69139d: 4d 85 f6                     	testq	%r14, %r14
  6913a0: 40 0f 94 c5                  	sete	%bpl
  6913a4: 48 85 ff                     	testq	%rdi, %rdi
  6913a7: 74 06                        	je	0x6913af <PyInit__native+0x414caf>
  6913a9: ff 15 f9 64 46 00            	callq	*0x4664f9(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  6913af: 40 84 ed                     	testb	%bpl, %bpl
  6913b2: 75 09                        	jne	0x6913bd <PyInit__native+0x414cbd>
  6913b4: 4c 89 f7                     	movq	%r14, %rdi
  6913b7: ff 15 eb 64 46 00            	callq	*0x4664eb(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  6913bd: 31 c0                        	xorl	%eax, %eax
  6913bf: 48 89 03                     	movq	%rax, (%rbx)
  6913c2: 48 81 c4 80 00 00 00         	addq	$0x80, %rsp
  6913c9: 5b                           	popq	%rbx
  6913ca: 41 5c                        	popq	%r12
  6913cc: 41 5e                        	popq	%r14
  6913ce: 41 5f                        	popq	%r15
  6913d0: 5d                           	popq	%rbp
  6913d1: c3                           	retq
  6913d2: 48 8d 3d 68 ad a8 ff         	leaq	-0x575298(%rip), %rdi   # 0x11c141 ; rodata: 'normalized exception value missingThe Python interpreter is not initialized and the `auto-initialize` feature is not enabled.\n\nConsider calling `Python::initialize()` before attemp'
  6913d9: 48 8d 15 68 76 44 00         	leaq	0x447668(%rip), %rdx    # 0xad8a48 ; ELF relocation: local pointer 0xcf97d
  6913e0: be 22 00 00 00               	movl	$0x22, %esi
  6913e5: e8 f6 5b ee ff               	callq	0x576fe0 <PyInit__native+0x2fa8e0>
  6913ea: 0f 0b                        	ud2
  6913ec: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  6913f1: e8 ea 0b 00 00               	callq	0x691fe0 <PyInit__native+0x4158e0>
  6913f6: e9 10 ff ff ff               	jmp	0x69130b <PyInit__native+0x414c0b>
  6913fb: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  691400: e8 eb 0c 00 00               	callq	0x6920f0 <PyInit__native+0x4159f0>
  691405: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  69140a: c6 44 24 18 01               	movb	$0x1, 0x18(%rsp)
  69140f: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  691414: 48 8d 0d b5 74 44 00         	leaq	0x4474b5(%rip), %rcx    # 0xad88d0
  69141b: 4c 8d 05 06 79 44 00         	leaq	0x447906(%rip), %r8     # 0xad8d28 ; ELF relocation: local pointer 0xcf97d
  691422: 48 8d 54 24 10               	leaq	0x10(%rsp), %rdx
  691427: 31 f6                        	xorl	%esi, %esi
  691429: e8 52 20 1a 00               	callq	0x833480 <PyInit_pyo3_async_runtimes+0x193bf0>
  69142e: e9 1e ff ff ff               	jmp	0x691351 <PyInit__native+0x414c51>
  691433: 48 89 c3                     	movq	%rax, %rbx
  691436: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  69143b: e8 40 0c 00 00               	callq	0x692080 <PyInit__native+0x415980>
  691440: eb 32                        	jmp	0x691474 <PyInit__native+0x414d74>
  691442: e8 95 5c ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  691447: 48 89 c3                     	movq	%rax, %rbx
  69144a: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  69144f: e8 7c fc ff ff               	callq	0x6910d0 <PyInit__native+0x4149d0>
  691454: eb 1e                        	jmp	0x691474 <PyInit__native+0x414d74>
  691456: e8 81 5c ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  69145b: 48 89 c3                     	movq	%rax, %rbx
  69145e: 4c 89 e7                     	movq	%r12, %rdi
  691461: e8 ea 25 00 00               	callq	0x693a50 <PyInit__native+0x417350>
  691466: 4d 85 f6                     	testq	%r14, %r14
  691469: 74 09                        	je	0x691474 <PyInit__native+0x414d74>
  69146b: 4c 89 f7                     	movq	%r14, %rdi
  69146e: ff 15 34 64 46 00            	callq	*0x466434(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  691474: 48 89 df                     	movq	%rbx, %rdi
  691477: e8 54 c9 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  69147c: e8 5b 5c ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
