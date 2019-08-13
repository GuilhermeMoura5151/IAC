.data
prompt:    	
.asciiz "Introduza um numero\n"

strh:		
.asciiz "-"

#############################################
		
.text
		
.globl main

main:		la $a0, prompt		# $a0 = prompt
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		li $v0, 5		#readint - ler um valor do teclado
		syscall
		move $t0, $v0		#inserir o valor na variavel $t0
		
		li $t1, 0		#i=0
		
for:		bge $t1, $t0, endfor
		
		la $a0, strh		# $a0 = strh
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall	
		
		add $t1, $t1, 1	
		
		j for

endfor:		li $v0, 10
		syscall