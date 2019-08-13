.data
minus:  .asciiz "texto em minusculas"

maius:	.space 20

#################################################
 .text
 .globl main
 
 
 main:
 # i = $t0
 		la $t1, minus
		la $t4, maius
 		
 		li $t0, 0
 		
while:		add $t2, $t1, $t0	# t3 endereço indice minus 
 		lb $t3, 0($t2)		# minus[i]
 		beq $t3, '\0', endw	# minus[i] != '\0'

if:		bltu $t3, 'a', else
 		bgt $t3, 'z', else
 		
 		addi $t3, $t3, 'A'
 		subi $t3, $t3, 'a'
 		
 		add $t5, $t4, $t0	# t3 endereço indice maius 
 		sb $t3, 0($t5)
 		
 		j endif
 		
else:		add $t5, $t4, $t0	# t3 endereço indice maius 
 		sb $t3, 0($t5)
 			
endif:		add $t0, $t0, 1
 		j while
 		
endw:		la $a0, maius
		li $v0, 4
		syscall
 
 		li $v0, 10
		syscall