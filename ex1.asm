#LAB1Ex1
.data 0x10000000
.text 0x00400000
.globl main

main:
	addi $10,$0,8 	#adds the intermidait value of 8 and the register (R0) and places the result in R10
	li $11,5	#Loads the intermidait value of 5 into register(R11)
	add $8,$0,$10	#adds the two register values of (R0,R10 respecivly) and stores the value into R8
	add $9,$0,$0	#multiplies R0 by 2 and stores the value in R9
	li $12,1	#Load the intermiedate value of 1 into register R12

mulloop:
	beq $8,$0,mulexit	#Branch if to mulexit label if R8 = R0
	sub $8,$8,$12		#This is the else logic-- Subtract the values of R8 and R12 and store in R8
	add $9,$9,$11		#Adds the values of R9 and R11 and store the vaules in R9
	j mulloop		#jump unconditionally to the label mulloop

mulexit:
	li $2,10	#Load the intermideate value of 10 into R2
	syscall		#System call, ends the program
