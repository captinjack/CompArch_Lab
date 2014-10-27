#Jack Mamiye
#129009534
#as6jack.asm

#Calculates the largest element of a floating-point array

main:
li $t0, 4		#load 4 into $t0
li $t9, 0		#initialize counter to 0
li $s2, 9		#$s1 = 9
la $s1, Array		#load the address of Array into $s1	
li.s $f5, -340277175000000000000000000000000000000	#load minimum float #value into $t5 #(initialize)

loop:
beq $t9, $s2, end	#branch to end if we’ve reached the end of the array
mul $t1, $t9, $t0	#$t1 = $t9(count)*4
add $t1, $t1, $s1	#$t1 = $t1+address
l.s $f6, 0($t1)		#load the value at the address into $t5
c.lt.s $f6, $f5		#set condition bit to 1 if $t6 < $t5
bc1f SET		#if $t6 >= $t5, branch to SET
addi $t9, $t9, 1	#$t9 = $t9+1
j loop:			#jump to loop
SET:
mov.s $f5, $f6		#load $t6 into $t5 if $t6 > $t5
j loop:


end:
li $v0, 4 		#syscall print_string
la $a0, str1		#load address of str1 into $a0
syscall			#syscall

li $v0, 2		#syscall print_float
mov.s $f12, $f5		#$f12 = $f5
syscall			#syscall

li $v0, 10		#syscall exit
syscall			#syscall

.data
Array: .float 8.37, 0.566, 1.2, 98.55, 2.2, -9.76, 23.498, -987.09, 88.65, 867.5309
str1: .asciiz "The largest element of the array is: "

