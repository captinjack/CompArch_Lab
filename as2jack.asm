#Jack Mamiye
#129009534
#numberguess.asm

#Program asks user to think of a number, then asks a series of questions until the number is known

main:
li $v0, 4 		#syscall print_string
la $a0, str1	#load address of str1 into $a0
syscall			#syscall

li $t8, 110		#ASCII code for 'n'
li $t9, 121		#ASCII code for 'y'
li $t1, 0		#load 0 into $t1 for lower bound
li $t2, 32		#load 32 into $t2 for upper bound
srl $t3, $t2, 1	#shift $t2 right by 1 bit to get 16 and store in $t3

repeat:
li $v0, 4 		#syscall print_string
la $a0, str2	#load address of str2 into $a0
syscall			#syscall
li $v0, 1 		#syscall print_int
move $a0, $t3	#copy $t3 into $a0
syscall			#syscall
li $v0, 4 		#syscall print_string
la $a0, str3	#load address of str3 into $a0
syscall			#syscall
li $v0, 12		#syscall read_char
syscall			#syscall
move $t0, $v0	#load input into $t0
li $v0, 4 		#syscall print_string
la $a0, str4	#load address of str4 into $a0
syscall			#syscall
beq $t0, $t8, no	#branch to 'no' if input is 'n'
beq $t0, $t9, yes	#branch to 'yes' if input = 'y'

yes:
move $t2, $t3		#copy intermediate value to $t2 (upper bound)
srl $t3, $t2, 1		#shift $t2 right by 1 bit to divide by 2 and store in $t3
sub $t4, $t2, $t1	#subtract $t1 from $t2 and store in $t4
blt $t4, 2, fyes	#branch to fyes if the difference is < 2
b repeat			#unconditional branch to 'repeat'

no:
move $t1, $t3		#copy intermediate val to $t1 (lower bound)
sub $t3, $t2, $t1	#$t3 = $t2-$t1
blt $t3, 2, fno		#branch to 'fno' if $t2-$t1 < 2
srl $t3, $t3, 1		#$t3 = $t3/2
add $t3, $t1, $t3	#$t3 = $t1+$t3
b repeat			#unconditional branch to 'repeat'

fyes:
li $v0, 4 		#syscall print_string
la $a0, str4	#load address of str4 into $a0
syscall			#syscall
li $v0, 4 		#syscall print_string
la $a0, str5	#load address of str5 into $a0
syscall			#syscall
li $v0, 1 		#syscall print_int
move $a0, $t1	#copy $t3 into $a0
syscall			#syscall
j end

fno:
li $v0, 4 		#syscall print_string
la $a0, str4	#load address of str4 into $a0
syscall			#syscall
li $v0, 4 		#syscall print_string
la $a0, str5	#load address of str5 into $a0
syscall			#syscall
li $v0, 1 		#syscall print_int
move $a0, $t1	#copy $t3 into $a0
syscall			#syscall
j end

end:
li $v0, 10 		#syscall exit
syscall			#syscall

.data
str1: .asciiz "Think of an integer between 0 and 32.\n"
str2: .asciiz "Is your number less than "
str3: .asciiz "? (enter 'y' or 'n'):"
str4: .asciiz "\n"
str5: .asciiz "Your number is "
