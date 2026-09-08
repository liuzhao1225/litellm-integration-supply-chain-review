
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  6860d0: 53                           	pushq	%rbx
  6860d1: 48 83 ec 20                  	subq	$0x20, %rsp
  6860d5: 48 83 7f 10 01               	cmpq	$0x1, 0x10(%rdi)
  6860da: 75 52                        	jne	0x68612e <PyInit__native+0x4075ee>
  6860dc: 48 89 f8                     	movq	%rdi, %rax
  6860df: 48 8b 7f 18                  	movq	0x18(%rdi), %rdi
  6860e3: 48 8b 70 20                  	movq	0x20(%rax), %rsi
  6860e7: 48 8b 50 28                  	movq	0x28(%rax), %rdx
  6860eb: 48 85 ff                     	testq	%rdi, %rdi
  6860ee: 74 1a                        	je	0x68610a <PyInit__native+0x4075ca>
  6860f0: 48 8b 40 30                  	movq	0x30(%rax), %rax
  6860f4: 48 c1 ea 20                  	shrq	$0x20, %rdx
  6860f8: 84 d2                        	testb	%dl, %dl
  6860fa: 75 4a                        	jne	0x686146 <PyInit__native+0x407606>
  6860fc: 48 89 c2                     	movq	%rax, %rdx
  6860ff: 48 83 c4 20                  	addq	$0x20, %rsp
  686103: 5b                           	popq	%rbx
  686104: ff 25 2e ea 46 00            	jmpq	*0x46ea2e(%rip)         # 0xaf4b38 ; ELF relocation: PyErr_Restore
  68610a: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  68610f: e8 bc 00 00 00               	callq	0x6861d0 <PyInit__native+0x407690>
  686114: 48 8b 7c 24 08               	movq	0x8(%rsp), %rdi
  686119: 48 8b 74 24 10               	movq	0x10(%rsp), %rsi
  68611e: 48 8b 54 24 18               	movq	0x18(%rsp), %rdx
  686123: 48 83 c4 20                  	addq	$0x20, %rsp
  686127: 5b                           	popq	%rbx
  686128: ff 25 0a ea 46 00            	jmpq	*0x46ea0a(%rip)         # 0xaf4b38 ; ELF relocation: PyErr_Restore
  68612e: 48 8d 3d b5 4b a9 ff         	leaq	-0x56b44b(%rip), %rdi   # 0x11acea ; rodata: 'PyErr state should never be invalid outside of normalizationException type missingException value missingargumentswaskeywordpositionalAttaching a thread to the interpreter is curre'
  686135: 48 8d 15 0c f8 44 00         	leaq	0x44f80c(%rip), %rdx    # 0xad5948 ; ELF relocation: local pointer 0xcfcb7
  68613c: be 3c 00 00 00               	movl	$0x3c, %esi
  686141: e8 ca fb f0 ff               	callq	0x595d10 <PyInit__native+0x3171d0>
  686146: 48 89 04 24                  	movq	%rax, (%rsp)
  68614a: 48 8d 3d 51 0f ab ff         	leaq	-0x54f0af(%rip), %rdi   # 0x1370a2 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  686151: 48 8d 0d a8 f5 44 00         	leaq	0x44f5a8(%rip), %rcx    # 0xad5700 ; ELF relocation: local pointer 0x686190
  686158: 4c 8d 05 c1 f8 44 00         	leaq	0x44f8c1(%rip), %r8     # 0xad5a20 ; ELF relocation: local pointer 0xcfcb7
  68615f: 48 89 e2                     	movq	%rsp, %rdx
  686162: be 2b 00 00 00               	movl	$0x2b, %esi
  686167: e8 e4 fb f0 ff               	callq	0x595d50 <PyInit__native+0x317210>
  68616c: 0f 0b                        	ud2
  68616e: 48 89 c3                     	movq	%rax, %rbx
  686171: 48 89 e7                     	movq	%rsp, %rdi
  686174: e8 17 00 00 00               	callq	0x686190 <PyInit__native+0x407650>
  686179: 48 89 df                     	movq	%rbx, %rdi
  68617c: e8 4f 50 43 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  686181: e8 86 fc f0 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
