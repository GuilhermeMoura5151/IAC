.data
prompt:    	
.asciiz "Introduza um numero\n"

result:		
.asciiz "O fatorial do numero inserido e': "

#############################################
		
.text
		
.globl main

main:		
		la	$a0, prompt	# $a0 = prompt
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
	
		
		li $v0, 5		#ler um valor do teclado
		syscall
		move $t0, $v0		#inserir o valor na variavel $a0
		
		
		la $a0, ($t0)
		jal factorial
		move $t3, $v0
		
		move $a0, $t3		#imprimir f
		li $v0, 1
		syscall	
		
		li	$v0,10
		syscall


factorial:	li $v0, 1		#res=1
		
		for1:		move $t1, $a0
				ble $t1, 0, endf     	#ble  t1 <= 0
				
				mul $v0, $v0, $t1	#res = res*i;
	
				sub $t1, $t1, 1
	
				j for1
				
		endf:		jr $ra
