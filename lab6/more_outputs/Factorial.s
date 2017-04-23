	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 24
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	move $s0, $s1
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s2, $v0
	move $s1, $s2
	la $s2, Fac_ComputeFac
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	move $s0, $s1
	lw $s1, 0($s0)
	lw $s2, 0($s1)
	li $s1, 10
	move $a0, $s0
	move $a1, $s1
	jalr $s2
	move $s3, $v0
	move $a0, $s3
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	Fac_ComputeFac

Fac_ComputeFac:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 32
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $s2, -20($fp)
	sw $s3, -24($fp)
	move $s0, $a0
	sw $a1, -32($fp)
	li $s2, 0
	lw $v0, -32($fp)
	sub $v0, $v0, 1
	slt $s3, $v0, $s2
	addi $v0, $v0, 1
	beqz $s3, Fac_ComputeFac_L2
	li $s2, 1
	move $v1, $s2
	sw $v1, -28($fp)
	b Fac_ComputeFac_L3
Fac_ComputeFac_L2: 	move $s2, $s0
	lw $s0, 0($s2)
	lw $s3, 0($s0)
	li $s0, 1
	lw $v0, -32($fp)
	sub $s1, $v0, $s0
	move $a0, $s2
	move $a1, $s1
	jalr $s3
	move $s0, $v0
	lw $v0, -32($fp)
	mul $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -28($fp)
Fac_ComputeFac_L3: 	nop
	lw $v1, -28($fp)
	move $v0, $v1
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $s2, -20($fp)
	lw $s3, -24($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 32
	jr $ra


	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	jr $ra

	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	jr $ra

	.data
	.align	0
newl:	.asciiz "\n"

	.data
	.align	0
str_er:	.asciiz "ERROR: abnormal termination\n"
