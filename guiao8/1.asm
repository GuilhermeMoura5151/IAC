 .data
a: .word 0xffffffa5
b: .word 0x000003ab
c: .space 4

 .text
 .globl main
main:

		la $a0, a		# $a0=0x10010000
		la $a1, b		# $a1=0x10010004
		la $a3, c		# $a3=0x10010008
		
		lw $t0, 0($a0)		# $t0=0xffffffa5
		lw $t1, 0($a1)		# $t1=0x000003ab
		
		sll $t1, $t1, 2		# $t1=0x00000eac
		sub $t2, $t0, $t1	# $t2=0xfffff0f9
		
		sw $t2, 0($a3) 		# a3 = t2
