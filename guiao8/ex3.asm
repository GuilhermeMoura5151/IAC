.data
prompt1:  .asciiz "Introduza uma string\n"
result:  .asciiz "O número de carateres numéricos: "

str:	.space 40

#################################################
 .text
 .globl main
 
 
 main:
  # i = $t0
  # n = $t1
  		li $t0, 0
  		li $t1, 0
  		
  		la $a0, prompt1		# $a0 = prompt1
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall
		
		li $v0,8 		#take in input
         	la $a0, str 		#load byte space into address
         	li $a1, 40 		# allot the byte space for string
         	move $t2,$a0 		#save string to t2
         	syscall
         	
for:		add $t4, $t2, $t0	# t2 endereço indice str 
 		lb $t5, 0($t4)		# str[i]
 		beq $t5, '\0', endfor	# str[i] != '\0'	        	
         	
if:		
   
         	
endfor:        	move $a0, $t2		# $a0 = prompt1
		li $v0, 4		# $v0 = 4 (syscall "print_str")
		syscall