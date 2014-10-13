#t1 input1
#t2 input2
#t3 and output
#t4 or output
#t5 nand output
#t6 xor output

main:
la $a0, input1
li $v0, 4
syscall
li $v0, 5
syscall
move $t0,$v0
la $a0, input2
li $v0, 4
syscall
li $v0, 5
syscall
move $t1,$v0
and $t3, $t1,$t2
or $t4, $t1,$t2
#nand is not and
not $t5, $t3
#xor is NAND AND OR
and $t6,$t5,$t4
la $a0, outand
li $v0, 4
syscall
move $a0,$t3
li $v0,1
syscall
la $a0, newln
li $v0, 4
syscall
la $a0, outor
li $v0, 4
syscall
move $a0,$t4
li $v0,1
syscall
la $a0, newln
li $v0, 4
syscall
la $a0, outnand
li $v0, 4
syscall
move $a0,$t5
li $v0,1
syscall
la $a0, newln
li $v0, 4
syscall
la $a0, outxor
li $v0, 4
syscall
move $a0,$t6
li $v0,1
syscall
la $a0, newln
li $v0, 4
syscall
li $v0,10
syscall


.data
input1: .asciiz "Enter in first number\n"
input2: .asciiz "Enter in second number\n"
outand: .asciiz "Output of AND\n"
outor: .asciiz "Output of OR\n"
outnand: .asciiz "Output of NAND\n"
outxor: .asciiz "Output of XOR\n"
newln: .asciiz "\n"
