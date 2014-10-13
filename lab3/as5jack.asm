#Jack Mamiye
#129009534
#as5jack.asm

#Calculates the surface area and volume of a sphere
main:
li $v0, 4 		#syscall print_string
la $a0, str1	#load address of str1 into $a0
syscall			#syscall
li $v0, 6		#syscall read_float
syscall			#syscall

mov.s $f1, $f0			#copy $f0 to $f1
li.s $f5, 3.141592653	#load Pi into $f5
li.s $f4, 4.0			#load 4 into $f4

mul.s $f2, $f1, $f1		#$f2 = $f1^2
mul.s $f2, $f2, $f5		#$f2 = $f2*Pi
mul.s $f2, $f2, $f4		#$f2 = $f2*4

li $v0, 4 		#syscall print_string
la $a0, str2	#load address of str2 into $a0
syscall			#syscall
li $v0, 4 		#syscall print_string
la $a0, str3	#load address of str3 into $a0
syscall			#syscall
li $v0, 2		#syscall print_float
mov.s $f12, $f2	#$f12 = $f2
syscall			#syscall

li.s $f2, 1.33333333333	#$f2=4/3
mul.s $f3, $f1, $f1		#$f3 = $f1^2
mul.s $f3, $f3, $f1		#$f3 = $f3*$f1 ($f1^3)
mul.s $f2, $f2, $f5		#$f2 = (4/3)*Pi
mul.s $f2, $f2, $f3		#$f2 = (4/3)*Pi*r^3

li $v0, 4 		#syscall print_string
la $a0, str2	#load address of str2 into $a0
syscall			#syscall
li $v0, 4 		#syscall print_string
la $a0, str4	#load address of str4 into $a0
syscall			#syscall
li $v0, 2		#syscall print_float
mov.s $f12, $f2	#$f12 = $f2
syscall			#syscall

li $v0, 10		#syscall exit
syscall			#syscall

.data
str1: .asciiz "Enter radius: "
str2: .asciiz "\n"
str3: .asciiz "Surface area = "
str4: .asciiz "Volume = "
