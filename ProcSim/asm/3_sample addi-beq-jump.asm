# Example3
# Puts the 20 times table into memory starting from -100 
# going up to 500, at every word location. 
# The memory now acts like an array

main:	addi $t3, $0, -100	# start val
	addi $t4, $0, 500	# max number
loop:	sw   $t3, 0($t0)	# store number at the new address
	addi $t0, $t0, 4	# increment address
	addi $t3, $t3, 20	# increment number val
	beq  $t3, $t4, exit	# check if reached max
	j    loop		# start again
exit:
