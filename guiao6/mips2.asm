	.data
	
	
	.text
	.globl main
main:	sll	$t1, $t0, 4	# Shift esquerda
	srl	$t2, $t0, 4	# Shift direita l�gico
	sra	$t3, $t0, 4	# Shift direita aritm�tico
	


	li $v0, 10
	syscall			#exit()
