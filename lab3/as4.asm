#f3 b
#f4 0.5
#f5 epsilon
#f6 .000001
main:
	li.s $f1, 1.0
	li.s $f4, 0.5
	li.s $f6, 0.000001
	li $v0, 4
	la $a0, input
	syscall
	li $v0, 6
	syscall
	mov.s $f3,$f0
	loop:
	div.s $f2,$f3,$f1
	add.s $f2, $f2, $f1
	mul.s $f2,$f2,$f4
	
	#check to see if <E
	sub.s $f5,$f2,$f1
	abs.s $f5,$f5
	c.lt.s $f5, $f6
	bclt endprg 



	mov.s $f1,$f2
	b loop
	
	endprg:
	li $v0, 4
	la $a0, input
	syscall
	mov.s $f12, $f2
	li $v0, 2
	syscall
	li $v0, 10
	syscall
	

.data 
input: .asciiz "Enter the number you would like the sqrt of:\n"
output: .asciiz "The ans is:\n"
