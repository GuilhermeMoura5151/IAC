.data
prompt:    	
.asciiz "Introduza um numero\n"

result:		
.asciiz "O factorial do numero inserido e': "

#############################################
		
.text
		
.globl main

main:		la $a0, prompt		# $a0 = prompt
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		li $v0, 5		#readint - ler um valor do teclado
		syscall
		move $t0, $v0		#inserir o valor na variavel $t0 ---- t0 = n
		
		move $t1, $t0		#i=n
		li $t2, 1		#f=1
		
for:		ble $t1, 0, endfor

		mul $t2, $t2, $t1
		
		sub $t1, $t1, 1
		
		j for
		
endfor:		la $a0, result		# $a0 = prompt
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		move $a0, $t2		# $v0 = f
		li $v0, 1		# $v0 = 4 (syscall "print_int")
		syscall
		
		li $v0, 10
		syscall