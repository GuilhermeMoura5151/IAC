# Example1
# Testing R-format arithmetic operators

# init registers
.register $t0 -10
.register $t1 5
.register $t2 3

main:	add $t3, $t1, $t1	# 5+5
	add $t4, $t1, $t0	# 5+-10
	sub $t5, $t1, $t2	# 5-3
	sub $t6, $t2, $t1	# 3-5
	and $t7, $t2, $t1	# 011 AND 101
exit: 

