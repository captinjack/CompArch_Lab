.text 0x00400000
.align 2
.globl main

main: 				# reveres the array and saves the result(used in Assig. 3)
	lw $a0, Size		#Load the size of array into $a0, using lw
	addi $a0, $a0,-1	# initialize index j with size-1
	li $a1, 0 		#initialize index i
	li $t2,4		# t2 contains constant 4, initialize t2
loop:
	mul $t1, $a1, $t2 	# t1 gets i*4
	mul $t4,$a1,$t2		# t4 gets j*4
	lw $a3, Array($t1) 	# a3 = N[i]
	lw $t5, Array($t4)	# t5 = N[j]
	sw $t1, Array($t4)	#store N[j] in the array in location i
	sw $t4, Array($t1)	#store N[i] in the array in location j
	addi $t1,$t1,1		# i = i + 1
	addi $t4,$t4,-1		#j=j-1`1
	bge $a1, $t3,END	# go to ENDif finished
			
	j loop
END:
	li $v0, 10
	syscall

.data 0x10000000
.align 2
Array: .word 2 5 6 7 12 16 25 27
Size: .word 8
