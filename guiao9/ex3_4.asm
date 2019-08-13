.data
str1:    	
.asciiz "\nInsira a frase1:"
str2:    	
.asciiz "Insira a frase2:"
str3:    	
.asciiz "\nO numero de caracteres da frase1 e':"
str4:    	
.asciiz "\nA frase concatenada e':"

.align 2
frase1:		.space 20

frase2:		.space 20

frase3:		.space 40
#################################################
 .text
 .globl main
 
 main:		la	$a0, str1	# $a0 = str
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
         	la $a0, frase1 		#load byte space into address
         	li $a1, 20 		# allot the byte space for string
		li $v0,8 		#take in input
         	syscall
         	
         	la	$a0, str2	# $a0 = str
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		
         	la $a0, frase2 		#load byte space into address
         	li $a1, 20 		# allot the byte space for string
         	li $v0,8 		#take in input
         	syscall
         	
         	la	$a0, str3	# $a0 = str
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		la	$a0,frase1
		jal	strlen
		move	$a0, $v0	#a0=strlen(str)
		li	$v0, 1
		syscall
		
		
		la	$a1, frase1
		la	$a0,frase3
		jal	strcopy
		move	$a0, $v0	#a0=copy(frase3, frase1)
		
		la	$a1, frase2
		la	$a0,frase3
		jal	strcat
		move	$a0, $v0	#a0=cat(frase3, frase2)
		
		la	$a0, str4	# $a0 = str
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		la	$a0, frase3	# $a0 = str
		li 	$v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
 
 
 		li	$v0,10
		syscall
 
 
 ##################funções######################

### STRCOPY ###
strcopy:	#dst=$a0, src=$a1, i=$t0
		li	$t0, 0		#i=0
	strcopy_while:	lb	$t1, 0($a1)	#t1=*src
			beq	$t1, '\0', end_strwhile
			
			add	$t2, $a0, $t0	#t2=dst+i=dst[i]
			sb	$t1, 0($t2)	#dst[i]=*src
			
			addi	$t0,$t0,1	#i++
			addiu	$a1, $a1, 1	#str++
			
			j	strcopy_while
	
	end_strwhile:	add	$t2, $a0, $t0
			sb	$a0, 0($t2)
		
			move 	$v0, $a0
		
			jr	$ra

### STRLEN ###		
strlen:			#str - $a0, n - $v0
			li	$v0, 0		#n=0

	strlen_while:	lb	$t0, 0($a0)	#t0=*str
			beq	$t0, '\0', end_strlenwhile
			
			addi	$v0,$v0,1	#n++
			addiu	$a0, $a0, 1	#str++
		
			j strlen_while
	end_strlenwhile:	jr	$ra

### STRCAT ###

strcat:	#dst-$a0, src-$a1
	#aux=$s0
	
		subu	$sp, $sp, 8
		sw	$s0, 0($sp)	#guarda $s0 na pilha para devolver mais tarde à função main
		sw	$ra, 4($sp)
		
		move $s0, $a0		#aux=dst
		
		strcat_while:	lb	$t0,0($a0)
				beq $t0, '\0', strcat_end
				
				addiu	$a0,$a0,1
				j	strcat_while
		strcat_end:	jal	strcopy
				move $v0, $s0
		
				lw	$s0,0($sp)
				lw	$ra,4($sp)
				addu	$sp,$sp,8
		
		jr	$ra