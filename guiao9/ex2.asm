.data

str:    	
.asciiz "Adeus"

#################################################
 .text
 .globl main

main:	la	$a0, str	# $a0 = str
	li 	$v0, 4		# $v0 = 4 (syscall "print_str")
	syscall

	la	$a0,str
	jal	strlen
	move	$a0, $v0	#a0=strlen(str)
	
	li	$v0, 1
	syscall
	
	
	li	$v0,10
	syscall




strlen:			#str - $a0, n - $v0
			li	$v0, 0		#n=0

	strlen_while:	lb	$t0, 0($a0)	#t0=*str
			beq	$t0, '\0', end_strwhile
			
			addi	$v0,$v0,1	#n++
			addiu	$a0, $a0, 1	#str++
		
			j strlen_while
	end_strwhile:	jr	$ra
	
