# Example: Bubble-sort for ProcSim
# use datapath: 3_MIPS R2000 5 all jmp and addi.xml
.register $t0 20
.register $t1 17
.register $t2 10
.register $t3 -1
.register $t4 18
.register $t5 -2
# init memory values
main: 	sw 	$t0,  0($zero)	# 20
	sw 	$t1,  4($zero)	# 17
	sw 	$t2,  8($zero)	# 10
	sw 	$t3, 12($zero)	# -1
	sw 	$t4, 16($zero)	# 18
	sw 	$t5, 20($zero)	# -2
# start the sorting process	
# $t2=flag; $t3=i; $t4=j; $t5 = array
	addi 	$t5,$zero,0  	# $t5 = array 
	addi 	$t4,$zero,5   	# j = SIZE-1
do: 	addi 	$t2,$zero,1 	# do { flag = 1
	add 	$t3,$zero,$zero # i = 0
wh: 	slt 	$t1,$t3,$t4	# while(i < j)
	beq 	$t1,$zero,endw 	# {
	add 	$t6,$t3,$t3	# $t6 = i+i = 2i
	add 	$t6,$t6,$t6 	# $t6 = 2i+2i = 4i
	add 	$t6,$t6,$t5 	# $t6 = array + 4i ->&array[i] 
	lw 	$t7,0($t6) 	# $t7 = array[i]
	lw 	$t8,4($t6) 	# $t8 = array[i+1]
	slt 	$t1,$t8,$t7	#
	beq 	$t1,$zero,endif # if(array[i+1] < array[i]) {
	sw 	$t7,4($t6) 	# swap values
	sw 	$t8,0($t6)	#  array[i+1] <-> array[i]
	addi 	$t2,$zero,0 	#  flag = 0 (values swapped)
endif:	addi 	$t3,$t3,1 	# } i++
	j 	wh 		# }
endw:	addi 	$t4,$t4,-1 	# j--
	beq 	$t2,$zero,do 	# } while(flag==0)
exit:				# done!
