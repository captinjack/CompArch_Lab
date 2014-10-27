#
#biggest.asm

#Calculates the largest element of a floating-point array

main:
li $t0, 4		#load 4 into $t0
li $t9, 0		#initialize counter to 0
la $s1, Array		#load the address of Array into $s1	
loop:
mul $t1, $t9, $t0	#$t1 = $t9(count)*4
add	$t1, $t1, $s1	#$t1 = $t1+address
l.s $t5, 0($t1)		#load $


end:
li $v0, 4 		#syscall print_string
la $a0, str1	#load address of str1 into $a0
syscall			#syscall

li $v0, 2		#syscall print_float
mov.s $f12, $f2	#$f12 = $f2
syscall			#syscall

li $v0, 10
syscall

.data
Array: .float 8.37, 0.566, 1.2, 98.55, 2.2, -9.76, 23.498, -987.09, 88.65, 867.5309
str1: .asciiz "The largest element of the array is: "
