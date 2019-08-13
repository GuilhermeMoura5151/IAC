# Example2
# Puts the 2 times table into memory starting from 2
# going up to 20, at every word location. 
# The memory now acts like an array, storing the values {0,2,4,...,18,20}

# init registers
.register $t0 0		# addr
.register $t1 4		# increm addr
.register $t2 2		# number increm
.register $t3 0		# number val
.register $t4 20	# max number
.register $t5 -1	# lw test

# main loop
main: add $t3, $t3, $t2	# incrememnt number val
	sw  $t3, 0($t0)		# store number at the new address
	add $t0, $t0, $t1	# increment address
	beq $t3, $t4, load	# check if reached max
	beq $0, $0, main	# start again
load: lw  $t5,  -4($t0)   # grab last value
exit: 

