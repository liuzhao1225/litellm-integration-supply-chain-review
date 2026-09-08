
<native-member>:	file format elf64-x86-64

Disassembly of section .plt:

0000000000abdd90 <.plt>:
  abdd90: ff 35 82 a9 03 00            	pushq	0x3a982(%rip)           # 0xaf8718
  abdd96: ff 25 84 a9 03 00            	jmpq	*0x3a984(%rip)          # 0xaf8720
  abdd9c: 0f 1f 40 00                  	nopl	(%rax)

0000000000abdda0 <__cxa_finalize@plt>:
  abdda0: ff 25 82 a9 03 00            	jmpq	*0x3a982(%rip)          # 0xaf8728
  abdda6: 68 00 00 00 00               	pushq	$0x0
  abddab: e9 e0 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abddb0 <malloc@plt>:
  abddb0: ff 25 7a a9 03 00            	jmpq	*0x3a97a(%rip)          # 0xaf8730
  abddb6: 68 01 00 00 00               	pushq	$0x1
  abddbb: e9 d0 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abddc0 <memcpy@plt>:
  abddc0: ff 25 72 a9 03 00            	jmpq	*0x3a972(%rip)          # 0xaf8738
  abddc6: 68 02 00 00 00               	pushq	$0x2
  abddcb: e9 c0 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abddd0 <_Unwind_Resume@plt>:
  abddd0: ff 25 6a a9 03 00            	jmpq	*0x3a96a(%rip)          # 0xaf8740
  abddd6: 68 03 00 00 00               	pushq	$0x3
  abdddb: e9 b0 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abdde0 <memmove@plt>:
  abdde0: ff 25 62 a9 03 00            	jmpq	*0x3a962(%rip)          # 0xaf8748
  abdde6: 68 04 00 00 00               	pushq	$0x4
  abddeb: e9 a0 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abddf0 <free@plt>:
  abddf0: ff 25 5a a9 03 00            	jmpq	*0x3a95a(%rip)          # 0xaf8750
  abddf6: 68 05 00 00 00               	pushq	$0x5
  abddfb: e9 90 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde00 <__tls_get_addr@plt>:
  abde00: ff 25 52 a9 03 00            	jmpq	*0x3a952(%rip)          # 0xaf8758
  abde06: 68 06 00 00 00               	pushq	$0x6
  abde0b: e9 80 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde10 <close@plt>:
  abde10: ff 25 4a a9 03 00            	jmpq	*0x3a94a(%rip)          # 0xaf8760
  abde16: 68 07 00 00 00               	pushq	$0x7
  abde1b: e9 70 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde20 <syscall@plt>:
  abde20: ff 25 42 a9 03 00            	jmpq	*0x3a942(%rip)          # 0xaf8768
  abde26: 68 08 00 00 00               	pushq	$0x8
  abde2b: e9 60 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde30 <__errno_location@plt>:
  abde30: ff 25 3a a9 03 00            	jmpq	*0x3a93a(%rip)          # 0xaf8770
  abde36: 68 09 00 00 00               	pushq	$0x9
  abde3b: e9 50 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde40 <calloc@plt>:
  abde40: ff 25 32 a9 03 00            	jmpq	*0x3a932(%rip)          # 0xaf8778
  abde46: 68 0a 00 00 00               	pushq	$0xa
  abde4b: e9 40 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde50 <memset@plt>:
  abde50: ff 25 2a a9 03 00            	jmpq	*0x3a92a(%rip)          # 0xaf8780
  abde56: 68 0b 00 00 00               	pushq	$0xb
  abde5b: e9 30 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde60 <fcntl@plt>:
  abde60: ff 25 22 a9 03 00            	jmpq	*0x3a922(%rip)          # 0xaf8788
  abde66: 68 0c 00 00 00               	pushq	$0xc
  abde6b: e9 20 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde70 <pthread_mutex_lock@plt>:
  abde70: ff 25 1a a9 03 00            	jmpq	*0x3a91a(%rip)          # 0xaf8790
  abde76: 68 0d 00 00 00               	pushq	$0xd
  abde7b: e9 10 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde80 <pthread_mutex_unlock@plt>:
  abde80: ff 25 12 a9 03 00            	jmpq	*0x3a912(%rip)          # 0xaf8798
  abde86: 68 0e 00 00 00               	pushq	$0xe
  abde8b: e9 00 ff ff ff               	jmp	0xabdd90 <.plt>

0000000000abde90 <read@plt>:
  abde90: ff 25 0a a9 03 00            	jmpq	*0x3a90a(%rip)          # 0xaf87a0
  abde96: 68 0f 00 00 00               	pushq	$0xf
  abde9b: e9 f0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdea0 <open@plt>:
  abdea0: ff 25 02 a9 03 00            	jmpq	*0x3a902(%rip)          # 0xaf87a8
  abdea6: 68 10 00 00 00               	pushq	$0x10
  abdeab: e9 e0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdeb0 <munmap@plt>:
  abdeb0: ff 25 fa a8 03 00            	jmpq	*0x3a8fa(%rip)          # 0xaf87b0
  abdeb6: 68 11 00 00 00               	pushq	$0x11
  abdebb: e9 d0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdec0 <pthread_setspecific@plt>:
  abdec0: ff 25 f2 a8 03 00            	jmpq	*0x3a8f2(%rip)          # 0xaf87b8
  abdec6: 68 12 00 00 00               	pushq	$0x12
  abdecb: e9 c0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abded0 <pthread_key_create@plt>:
  abded0: ff 25 ea a8 03 00            	jmpq	*0x3a8ea(%rip)          # 0xaf87c0
  abded6: 68 13 00 00 00               	pushq	$0x13
  abdedb: e9 b0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdee0 <getenv@plt>:
  abdee0: ff 25 e2 a8 03 00            	jmpq	*0x3a8e2(%rip)          # 0xaf87c8
  abdee6: 68 14 00 00 00               	pushq	$0x14
  abdeeb: e9 a0 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdef0 <abort@plt>:
  abdef0: ff 25 da a8 03 00            	jmpq	*0x3a8da(%rip)          # 0xaf87d0
  abdef6: 68 15 00 00 00               	pushq	$0x15
  abdefb: e9 90 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf00 <sysconf@plt>:
  abdf00: ff 25 d2 a8 03 00            	jmpq	*0x3a8d2(%rip)          # 0xaf87d8
  abdf06: 68 16 00 00 00               	pushq	$0x16
  abdf0b: e9 80 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf10 <__assert_fail@plt>:
  abdf10: ff 25 ca a8 03 00            	jmpq	*0x3a8ca(%rip)          # 0xaf87e0
  abdf16: 68 17 00 00 00               	pushq	$0x17
  abdf1b: e9 70 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf20 <memchr@plt>:
  abdf20: ff 25 c2 a8 03 00            	jmpq	*0x3a8c2(%rip)          # 0xaf87e8
  abdf26: 68 18 00 00 00               	pushq	$0x18
  abdf2b: e9 60 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf30 <fwrite@plt>:
  abdf30: ff 25 ba a8 03 00            	jmpq	*0x3a8ba(%rip)          # 0xaf87f0
  abdf36: 68 19 00 00 00               	pushq	$0x19
  abdf3b: e9 50 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf40 <strchr@plt>:
  abdf40: ff 25 b2 a8 03 00            	jmpq	*0x3a8b2(%rip)          # 0xaf87f8
  abdf46: 68 1a 00 00 00               	pushq	$0x1a
  abdf4b: e9 40 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf50 <vsnprintf@plt>:
  abdf50: ff 25 aa a8 03 00            	jmpq	*0x3a8aa(%rip)          # 0xaf8800
  abdf56: 68 1b 00 00 00               	pushq	$0x1b
  abdf5b: e9 30 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf60 <strcmp@plt>:
  abdf60: ff 25 a2 a8 03 00            	jmpq	*0x3a8a2(%rip)          # 0xaf8808
  abdf66: 68 1c 00 00 00               	pushq	$0x1c
  abdf6b: e9 20 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf70 <strtol@plt>:
  abdf70: ff 25 9a a8 03 00            	jmpq	*0x3a89a(%rip)          # 0xaf8810
  abdf76: 68 1d 00 00 00               	pushq	$0x1d
  abdf7b: e9 10 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf80 <sscanf@plt>:
  abdf80: ff 25 92 a8 03 00            	jmpq	*0x3a892(%rip)          # 0xaf8818
  abdf86: 68 1e 00 00 00               	pushq	$0x1e
  abdf8b: e9 00 fe ff ff               	jmp	0xabdd90 <.plt>

0000000000abdf90 <fprintf@plt>:
  abdf90: ff 25 8a a8 03 00            	jmpq	*0x3a88a(%rip)          # 0xaf8820
  abdf96: 68 1f 00 00 00               	pushq	$0x1f
  abdf9b: e9 f0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdfa0 <OPENSSL_memory_alloc@plt>:
  abdfa0: ff 25 82 a8 03 00            	jmpq	*0x3a882(%rip)          # 0xaf8828
  abdfa6: 68 20 00 00 00               	pushq	$0x20
  abdfab: e9 e0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdfb0 <OPENSSL_memory_realloc@plt>:
  abdfb0: ff 25 7a a8 03 00            	jmpq	*0x3a87a(%rip)          # 0xaf8830
  abdfb6: 68 21 00 00 00               	pushq	$0x21
  abdfbb: e9 d0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdfc0 <OPENSSL_memory_free@plt>:
  abdfc0: ff 25 72 a8 03 00            	jmpq	*0x3a872(%rip)          # 0xaf8838
  abdfc6: 68 22 00 00 00               	pushq	$0x22
  abdfcb: e9 c0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdfd0 <OPENSSL_memory_get_size@plt>:
  abdfd0: ff 25 6a a8 03 00            	jmpq	*0x3a86a(%rip)          # 0xaf8840
  abdfd6: 68 23 00 00 00               	pushq	$0x23
  abdfdb: e9 b0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdfe0 <sdallocx@plt>:
  abdfe0: ff 25 62 a8 03 00            	jmpq	*0x3a862(%rip)          # 0xaf8848
  abdfe6: 68 24 00 00 00               	pushq	$0x24
  abdfeb: e9 a0 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abdff0 <nanosleep@plt>:
  abdff0: ff 25 5a a8 03 00            	jmpq	*0x3a85a(%rip)          # 0xaf8850
  abdff6: 68 25 00 00 00               	pushq	$0x25
  abdffb: e9 90 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe000 <perror@plt>:
  abe000: ff 25 52 a8 03 00            	jmpq	*0x3a852(%rip)          # 0xaf8858
  abe006: 68 26 00 00 00               	pushq	$0x26
  abe00b: e9 80 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe010 <ioctl@plt>:
  abe010: ff 25 4a a8 03 00            	jmpq	*0x3a84a(%rip)          # 0xaf8860
  abe016: 68 27 00 00 00               	pushq	$0x27
  abe01b: e9 70 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe020 <getauxval@plt>:
  abe020: ff 25 42 a8 03 00            	jmpq	*0x3a842(%rip)          # 0xaf8868
  abe026: 68 28 00 00 00               	pushq	$0x28
  abe02b: e9 60 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe030 <pthread_rwlock_init@plt>:
  abe030: ff 25 3a a8 03 00            	jmpq	*0x3a83a(%rip)          # 0xaf8870
  abe036: 68 29 00 00 00               	pushq	$0x29
  abe03b: e9 50 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe040 <pthread_rwlock_rdlock@plt>:
  abe040: ff 25 32 a8 03 00            	jmpq	*0x3a832(%rip)          # 0xaf8878
  abe046: 68 2a 00 00 00               	pushq	$0x2a
  abe04b: e9 40 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe050 <pthread_rwlock_wrlock@plt>:
  abe050: ff 25 2a a8 03 00            	jmpq	*0x3a82a(%rip)          # 0xaf8880
  abe056: 68 2b 00 00 00               	pushq	$0x2b
  abe05b: e9 30 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe060 <pthread_rwlock_unlock@plt>:
  abe060: ff 25 22 a8 03 00            	jmpq	*0x3a822(%rip)          # 0xaf8888
  abe066: 68 2c 00 00 00               	pushq	$0x2c
  abe06b: e9 20 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe070 <pthread_rwlock_destroy@plt>:
  abe070: ff 25 1a a8 03 00            	jmpq	*0x3a81a(%rip)          # 0xaf8890
  abe076: 68 2d 00 00 00               	pushq	$0x2d
  abe07b: e9 10 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe080 <pthread_once@plt>:
  abe080: ff 25 12 a8 03 00            	jmpq	*0x3a812(%rip)          # 0xaf8898
  abe086: 68 2e 00 00 00               	pushq	$0x2e
  abe08b: e9 00 fd ff ff               	jmp	0xabdd90 <.plt>

0000000000abe090 <pthread_getspecific@plt>:
  abe090: ff 25 0a a8 03 00            	jmpq	*0x3a80a(%rip)          # 0xaf88a0
  abe096: 68 2f 00 00 00               	pushq	$0x2f
  abe09b: e9 f0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0a0 <mmap@plt>:
  abe0a0: ff 25 02 a8 03 00            	jmpq	*0x3a802(%rip)          # 0xaf88a8
  abe0a6: 68 30 00 00 00               	pushq	$0x30
  abe0ab: e9 e0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0b0 <madvise@plt>:
  abe0b0: ff 25 fa a7 03 00            	jmpq	*0x3a7fa(%rip)          # 0xaf88b0
  abe0b6: 68 31 00 00 00               	pushq	$0x31
  abe0bb: e9 d0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0c0 <__xstat@plt>:
  abe0c0: ff 25 f2 a7 03 00            	jmpq	*0x3a7f2(%rip)          # 0xaf88b8
  abe0c6: 68 32 00 00 00               	pushq	$0x32
  abe0cb: e9 c0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0d0 <__register_atfork@plt>:
  abe0d0: ff 25 ea a7 03 00            	jmpq	*0x3a7ea(%rip)          # 0xaf88c0
  abe0d6: 68 33 00 00 00               	pushq	$0x33
  abe0db: e9 b0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0e0 <__fxstat64@plt>:
  abe0e0: ff 25 e2 a7 03 00            	jmpq	*0x3a7e2(%rip)          # 0xaf88c8
  abe0e6: 68 34 00 00 00               	pushq	$0x34
  abe0eb: e9 a0 fc ff ff               	jmp	0xabdd90 <.plt>

0000000000abe0f0 <__xstat64@plt>:
  abe0f0: ff 25 da a7 03 00            	jmpq	*0x3a7da(%rip)          # 0xaf88d0
  abe0f6: 68 35 00 00 00               	pushq	$0x35
  abe0fb: e9 90 fc ff ff               	jmp	0xabdd90 <.plt>
