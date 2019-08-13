	.data
strvalores:    	
.asciiz "Introduza dois numeros: \n"

strsoma:		
.asciiz "A soma dos numeros e': \n"

#############################################

.text
		
.globl main

main:		la	$a0, strvalores	# $a0 = prompt
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		li $v0, 5		#ler um valor do teclado
		syscall
		move $t0, $v0		#inserir o valor na variavel $t0
		
		li $v0, 5		#ler um valor do teclado
		syscall
		move $t1, $v0		#inserir o valor na variavel $t1
		
		add $t2, $t0, $t1
		
		la $a0, strsoma		#imprimir label strpar
		li $v0, 4
		syscall
		
		move $a0, $t2		#imprimir valor
		li $v0, 36
		syscall
		
		li $v0, 10
		syscall			#exit()

