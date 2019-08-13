.data

prompt:    	
.asciiz "Introduza um numero\n"

strpar:		
.asciiz "O numero e' par\n"
strimp:		
.asciiz "O numero e' impar\n"

#############################################
		
.text
		
.globl main

main:

		la $a0, prompt		# $a0 = prompt
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		li $v0, 5		#readint - ler um valor do teclado
		syscall
		move $t0, $v0		#inserir o valor na variavel $t0
		
		and $t1, $t0, 1		#BITWISE $t1 com valor -- $t0 and 1 == par  $t1=( a & 1 )
		
if:		bnez $t1, else1		#if, diferente de 0, $t1!= 0
		
		
		la $a0, strpar		# $a0 = strpar
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		j endif			# saltar para ENDIF
			
		
else1:		la $a0, strimp		# $a0 = strimp
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
endif:		li $v0, 10
		syscall