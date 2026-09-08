
<native-member>:	file format elf64-x86-64

Disassembly of section .plt:

0000000000ab5650 <.plt>:
  ab5650: ff 35 92 a6 03 00            	pushq	0x3a692(%rip)           # 0xaefce8
  ab5656: ff 25 94 a6 03 00            	jmpq	*0x3a694(%rip)          # 0xaefcf0
  ab565c: 0f 1f 40 00                  	nopl	(%rax)

0000000000ab5660 <__cxa_finalize@plt>:
  ab5660: ff 25 92 a6 03 00            	jmpq	*0x3a692(%rip)          # 0xaefcf8
  ab5666: 68 00 00 00 00               	pushq	$0x0
  ab566b: e9 e0 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5670 <malloc@plt>:
  ab5670: ff 25 8a a6 03 00            	jmpq	*0x3a68a(%rip)          # 0xaefd00
  ab5676: 68 01 00 00 00               	pushq	$0x1
  ab567b: e9 d0 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5680 <memcpy@plt>:
  ab5680: ff 25 82 a6 03 00            	jmpq	*0x3a682(%rip)          # 0xaefd08
  ab5686: 68 02 00 00 00               	pushq	$0x2
  ab568b: e9 c0 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5690 <_Unwind_Resume@plt>:
  ab5690: ff 25 7a a6 03 00            	jmpq	*0x3a67a(%rip)          # 0xaefd10
  ab5696: 68 03 00 00 00               	pushq	$0x3
  ab569b: e9 b0 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56a0 <free@plt>:
  ab56a0: ff 25 72 a6 03 00            	jmpq	*0x3a672(%rip)          # 0xaefd18
  ab56a6: 68 04 00 00 00               	pushq	$0x4
  ab56ab: e9 a0 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56b0 <memmove@plt>:
  ab56b0: ff 25 6a a6 03 00            	jmpq	*0x3a66a(%rip)          # 0xaefd20
  ab56b6: 68 05 00 00 00               	pushq	$0x5
  ab56bb: e9 90 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56c0 <__tls_get_addr@plt>:
  ab56c0: ff 25 62 a6 03 00            	jmpq	*0x3a662(%rip)          # 0xaefd28
  ab56c6: 68 06 00 00 00               	pushq	$0x6
  ab56cb: e9 80 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56d0 <close@plt>:
  ab56d0: ff 25 5a a6 03 00            	jmpq	*0x3a65a(%rip)          # 0xaefd30
  ab56d6: 68 07 00 00 00               	pushq	$0x7
  ab56db: e9 70 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56e0 <__errno_location@plt>:
  ab56e0: ff 25 52 a6 03 00            	jmpq	*0x3a652(%rip)          # 0xaefd38
  ab56e6: 68 08 00 00 00               	pushq	$0x8
  ab56eb: e9 60 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab56f0 <syscall@plt>:
  ab56f0: ff 25 4a a6 03 00            	jmpq	*0x3a64a(%rip)          # 0xaefd40
  ab56f6: 68 09 00 00 00               	pushq	$0x9
  ab56fb: e9 50 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5700 <calloc@plt>:
  ab5700: ff 25 42 a6 03 00            	jmpq	*0x3a642(%rip)          # 0xaefd48
  ab5706: 68 0a 00 00 00               	pushq	$0xa
  ab570b: e9 40 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5710 <memset@plt>:
  ab5710: ff 25 3a a6 03 00            	jmpq	*0x3a63a(%rip)          # 0xaefd50
  ab5716: 68 0b 00 00 00               	pushq	$0xb
  ab571b: e9 30 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5720 <fcntl@plt>:
  ab5720: ff 25 32 a6 03 00            	jmpq	*0x3a632(%rip)          # 0xaefd58
  ab5726: 68 0c 00 00 00               	pushq	$0xc
  ab572b: e9 20 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5730 <pthread_mutex_lock@plt>:
  ab5730: ff 25 2a a6 03 00            	jmpq	*0x3a62a(%rip)          # 0xaefd60
  ab5736: 68 0d 00 00 00               	pushq	$0xd
  ab573b: e9 10 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5740 <pthread_mutex_unlock@plt>:
  ab5740: ff 25 22 a6 03 00            	jmpq	*0x3a622(%rip)          # 0xaefd68
  ab5746: 68 0e 00 00 00               	pushq	$0xe
  ab574b: e9 00 ff ff ff               	jmp	0xab5650 <.plt>

0000000000ab5750 <read@plt>:
  ab5750: ff 25 1a a6 03 00            	jmpq	*0x3a61a(%rip)          # 0xaefd70
  ab5756: 68 0f 00 00 00               	pushq	$0xf
  ab575b: e9 f0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5760 <open@plt>:
  ab5760: ff 25 12 a6 03 00            	jmpq	*0x3a612(%rip)          # 0xaefd78
  ab5766: 68 10 00 00 00               	pushq	$0x10
  ab576b: e9 e0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5770 <munmap@plt>:
  ab5770: ff 25 0a a6 03 00            	jmpq	*0x3a60a(%rip)          # 0xaefd80
  ab5776: 68 11 00 00 00               	pushq	$0x11
  ab577b: e9 d0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5780 <pthread_setspecific@plt>:
  ab5780: ff 25 02 a6 03 00            	jmpq	*0x3a602(%rip)          # 0xaefd88
  ab5786: 68 12 00 00 00               	pushq	$0x12
  ab578b: e9 c0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5790 <pthread_key_create@plt>:
  ab5790: ff 25 fa a5 03 00            	jmpq	*0x3a5fa(%rip)          # 0xaefd90
  ab5796: 68 13 00 00 00               	pushq	$0x13
  ab579b: e9 b0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57a0 <getenv@plt>:
  ab57a0: ff 25 f2 a5 03 00            	jmpq	*0x3a5f2(%rip)          # 0xaefd98
  ab57a6: 68 14 00 00 00               	pushq	$0x14
  ab57ab: e9 a0 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57b0 <abort@plt>:
  ab57b0: ff 25 ea a5 03 00            	jmpq	*0x3a5ea(%rip)          # 0xaefda0
  ab57b6: 68 15 00 00 00               	pushq	$0x15
  ab57bb: e9 90 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57c0 <sysconf@plt>:
  ab57c0: ff 25 e2 a5 03 00            	jmpq	*0x3a5e2(%rip)          # 0xaefda8
  ab57c6: 68 16 00 00 00               	pushq	$0x16
  ab57cb: e9 80 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57d0 <__assert_fail@plt>:
  ab57d0: ff 25 da a5 03 00            	jmpq	*0x3a5da(%rip)          # 0xaefdb0
  ab57d6: 68 17 00 00 00               	pushq	$0x17
  ab57db: e9 70 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57e0 <memchr@plt>:
  ab57e0: ff 25 d2 a5 03 00            	jmpq	*0x3a5d2(%rip)          # 0xaefdb8
  ab57e6: 68 18 00 00 00               	pushq	$0x18
  ab57eb: e9 60 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab57f0 <fwrite@plt>:
  ab57f0: ff 25 ca a5 03 00            	jmpq	*0x3a5ca(%rip)          # 0xaefdc0
  ab57f6: 68 19 00 00 00               	pushq	$0x19
  ab57fb: e9 50 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5800 <strchr@plt>:
  ab5800: ff 25 c2 a5 03 00            	jmpq	*0x3a5c2(%rip)          # 0xaefdc8
  ab5806: 68 1a 00 00 00               	pushq	$0x1a
  ab580b: e9 40 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5810 <vsnprintf@plt>:
  ab5810: ff 25 ba a5 03 00            	jmpq	*0x3a5ba(%rip)          # 0xaefdd0
  ab5816: 68 1b 00 00 00               	pushq	$0x1b
  ab581b: e9 30 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5820 <strcmp@plt>:
  ab5820: ff 25 b2 a5 03 00            	jmpq	*0x3a5b2(%rip)          # 0xaefdd8
  ab5826: 68 1c 00 00 00               	pushq	$0x1c
  ab582b: e9 20 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5830 <strtol@plt>:
  ab5830: ff 25 aa a5 03 00            	jmpq	*0x3a5aa(%rip)          # 0xaefde0
  ab5836: 68 1d 00 00 00               	pushq	$0x1d
  ab583b: e9 10 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5840 <sscanf@plt>:
  ab5840: ff 25 a2 a5 03 00            	jmpq	*0x3a5a2(%rip)          # 0xaefde8
  ab5846: 68 1e 00 00 00               	pushq	$0x1e
  ab584b: e9 00 fe ff ff               	jmp	0xab5650 <.plt>

0000000000ab5850 <fprintf@plt>:
  ab5850: ff 25 9a a5 03 00            	jmpq	*0x3a59a(%rip)          # 0xaefdf0
  ab5856: 68 1f 00 00 00               	pushq	$0x1f
  ab585b: e9 f0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5860 <OPENSSL_memory_alloc@plt>:
  ab5860: ff 25 92 a5 03 00            	jmpq	*0x3a592(%rip)          # 0xaefdf8
  ab5866: 68 20 00 00 00               	pushq	$0x20
  ab586b: e9 e0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5870 <OPENSSL_memory_realloc@plt>:
  ab5870: ff 25 8a a5 03 00            	jmpq	*0x3a58a(%rip)          # 0xaefe00
  ab5876: 68 21 00 00 00               	pushq	$0x21
  ab587b: e9 d0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5880 <OPENSSL_memory_free@plt>:
  ab5880: ff 25 82 a5 03 00            	jmpq	*0x3a582(%rip)          # 0xaefe08
  ab5886: 68 22 00 00 00               	pushq	$0x22
  ab588b: e9 c0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5890 <OPENSSL_memory_get_size@plt>:
  ab5890: ff 25 7a a5 03 00            	jmpq	*0x3a57a(%rip)          # 0xaefe10
  ab5896: 68 23 00 00 00               	pushq	$0x23
  ab589b: e9 b0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58a0 <sdallocx@plt>:
  ab58a0: ff 25 72 a5 03 00            	jmpq	*0x3a572(%rip)          # 0xaefe18
  ab58a6: 68 24 00 00 00               	pushq	$0x24
  ab58ab: e9 a0 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58b0 <nanosleep@plt>:
  ab58b0: ff 25 6a a5 03 00            	jmpq	*0x3a56a(%rip)          # 0xaefe20
  ab58b6: 68 25 00 00 00               	pushq	$0x25
  ab58bb: e9 90 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58c0 <perror@plt>:
  ab58c0: ff 25 62 a5 03 00            	jmpq	*0x3a562(%rip)          # 0xaefe28
  ab58c6: 68 26 00 00 00               	pushq	$0x26
  ab58cb: e9 80 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58d0 <ioctl@plt>:
  ab58d0: ff 25 5a a5 03 00            	jmpq	*0x3a55a(%rip)          # 0xaefe30
  ab58d6: 68 27 00 00 00               	pushq	$0x27
  ab58db: e9 70 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58e0 <getauxval@plt>:
  ab58e0: ff 25 52 a5 03 00            	jmpq	*0x3a552(%rip)          # 0xaefe38
  ab58e6: 68 28 00 00 00               	pushq	$0x28
  ab58eb: e9 60 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab58f0 <pthread_rwlock_init@plt>:
  ab58f0: ff 25 4a a5 03 00            	jmpq	*0x3a54a(%rip)          # 0xaefe40
  ab58f6: 68 29 00 00 00               	pushq	$0x29
  ab58fb: e9 50 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5900 <pthread_rwlock_rdlock@plt>:
  ab5900: ff 25 42 a5 03 00            	jmpq	*0x3a542(%rip)          # 0xaefe48
  ab5906: 68 2a 00 00 00               	pushq	$0x2a
  ab590b: e9 40 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5910 <pthread_rwlock_wrlock@plt>:
  ab5910: ff 25 3a a5 03 00            	jmpq	*0x3a53a(%rip)          # 0xaefe50
  ab5916: 68 2b 00 00 00               	pushq	$0x2b
  ab591b: e9 30 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5920 <pthread_rwlock_unlock@plt>:
  ab5920: ff 25 32 a5 03 00            	jmpq	*0x3a532(%rip)          # 0xaefe58
  ab5926: 68 2c 00 00 00               	pushq	$0x2c
  ab592b: e9 20 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5930 <pthread_rwlock_destroy@plt>:
  ab5930: ff 25 2a a5 03 00            	jmpq	*0x3a52a(%rip)          # 0xaefe60
  ab5936: 68 2d 00 00 00               	pushq	$0x2d
  ab593b: e9 10 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5940 <pthread_once@plt>:
  ab5940: ff 25 22 a5 03 00            	jmpq	*0x3a522(%rip)          # 0xaefe68
  ab5946: 68 2e 00 00 00               	pushq	$0x2e
  ab594b: e9 00 fd ff ff               	jmp	0xab5650 <.plt>

0000000000ab5950 <pthread_getspecific@plt>:
  ab5950: ff 25 1a a5 03 00            	jmpq	*0x3a51a(%rip)          # 0xaefe70
  ab5956: 68 2f 00 00 00               	pushq	$0x2f
  ab595b: e9 f0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab5960 <mmap@plt>:
  ab5960: ff 25 12 a5 03 00            	jmpq	*0x3a512(%rip)          # 0xaefe78
  ab5966: 68 30 00 00 00               	pushq	$0x30
  ab596b: e9 e0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab5970 <madvise@plt>:
  ab5970: ff 25 0a a5 03 00            	jmpq	*0x3a50a(%rip)          # 0xaefe80
  ab5976: 68 31 00 00 00               	pushq	$0x31
  ab597b: e9 d0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab5980 <__xstat@plt>:
  ab5980: ff 25 02 a5 03 00            	jmpq	*0x3a502(%rip)          # 0xaefe88
  ab5986: 68 32 00 00 00               	pushq	$0x32
  ab598b: e9 c0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab5990 <__register_atfork@plt>:
  ab5990: ff 25 fa a4 03 00            	jmpq	*0x3a4fa(%rip)          # 0xaefe90
  ab5996: 68 33 00 00 00               	pushq	$0x33
  ab599b: e9 b0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab59a0 <__fxstat64@plt>:
  ab59a0: ff 25 f2 a4 03 00            	jmpq	*0x3a4f2(%rip)          # 0xaefe98
  ab59a6: 68 34 00 00 00               	pushq	$0x34
  ab59ab: e9 a0 fc ff ff               	jmp	0xab5650 <.plt>

0000000000ab59b0 <__xstat64@plt>:
  ab59b0: ff 25 ea a4 03 00            	jmpq	*0x3a4ea(%rip)          # 0xaefea0
  ab59b6: 68 35 00 00 00               	pushq	$0x35
  ab59bb: e9 90 fc ff ff               	jmp	0xab5650 <.plt>
