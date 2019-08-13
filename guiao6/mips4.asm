.data
.text
		
.globl main

main:		andi	$t2, $t1, 0xf0000000
		srl	$t2, 28
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 24
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 20
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 16
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 12
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 8
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 4
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		###################################
		andi	$t2, $t1, 0xf0000000
		srl	$t2, 0
		li $v0, 34
		syscall
		
		li	$a0, ' '	
		li 	$v0, 11		
		syscall
		
		