#f0 general purpose float
#f1 radious
#f2 pi
#f3 surface area
#f4 4.0
#f5 1.33333333333
#f6 vol


main:
	li $v0, 4
	la $a0, input
	syscall
	li $v0, 6
	syscall
	mov.s $f1,$f0
	li.s $f2, 3.14159 #PI
	mul.s $f3, $f1,$f1
	mul.s $f3, $f2,$f3
	li.s $f4, 4.0
	mul.s $f3,$f3,$f4 #finished surface area formula
	li.s $f5, 1.33333333333
	mul.s $f6,$f2,$f5
	mul.s $f6,$f1,$f6
	mul.s $f6,$f1,$f6
	mul.s $f6,$f1,$f6 #finished volume

	li $v0, 4
	la $a0, outsur
	syscall

	mov.s $f12,$f3
	li $v0,2
	syscall
	
	li $v0, 4
	la $a0, outvol
	syscall

	
	mov.s $f12,$f6
	li $v0,2
	syscall
 
	li $v0,10
	syscall

	


.data
input: .asciiz "Enter the radious for the volume and suface area of a sphere\n"
outsur: .asciiz "\nThe Sufface area is:\n"
outvol: .asciiz "\nThe volume is:\n"
