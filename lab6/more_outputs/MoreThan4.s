	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 56
	li $t0, 1
	slti $t1, $t0, 1
	li $a1, 1
	slt $a0, $a1, $t0
	add $t1, $t1, $a0
	move $a0, $t1
	jal _print
	li $t0, 8
	move $a0, $t0
	jal _halloc
	move $t1, $v0
	move $t0, $t1
	li $t1, 4
	move $a0, $t1
	jal _halloc
	move $t2, $v0
	move $t1, $t2
	la $t2, MT4_Change
	sw $t2, 4($t0)
	la $t2, MT4_Start
	sw $t2, 0($t0)
	sw $t0, 0($t1)
	move $t0, $t1
	lw $t1, 0($t0)
	lw $t2, 0($t1)
	li $t1, 1
	li $t3, 2
	li $v1, 3
	sw $v1, -12($fp)
	li $v1, 4
	sw $v1, -16($fp)
	li $v1, 5
	sw $v1, -20($fp)
	li $v1, 6
	sw $v1, -24($fp)
	sw $t0, -32($fp)
	sw $t1, -36($fp)
	sw $t2, -40($fp)
	sw $t3, -44($fp)
	move $a0, $t0
	move $a1, $t1
	move $a2, $t3
	lw $v0, -12($fp)
	move $a3, $v0
	lw $v0, -16($fp)
	sw $v0, 0($sp)
	lw $v0, -20($fp)
	sw $v0, 4($sp)
	lw $v0, -24($fp)
	sw $v0, 8($sp)
	jalr $t2
	lw $t0, -32($fp)
	lw $t1, -36($fp)
	lw $t2, -40($fp)
	lw $t3, -44($fp)
	move $v1, $v0
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	move $a0, $v0
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 56
	jr $ra

	.text
	.globl	MT4_Start

MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 76
	sw $a0, -12($fp)
	sw $a1, -16($fp)
	move $t2, $a2
	move $t3, $a3
	lw $t0, 4($fp)
	lw $t1, 8($fp)
	lw $v0, -16($fp)
	move $a0, $v0
	jal _print
	move $a0, $t2
	jal _print
	move $a0, $t3
	jal _print
	lw $v0, 0($fp)
	move $a0, $v0
	jal _print
	move $a0, $t0
	jal _print
	move $a0, $t1
	jal _print
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $v1, 0($v0)
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	sw $t0, -40($fp)
	sw $t1, -44($fp)
	sw $t2, -48($fp)
	sw $t3, -52($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	move $a1, $t1
	move $a2, $t0
	lw $v0, 0($fp)
	move $a3, $v0
	sw $t3, 0($sp)
	sw $t2, 4($sp)
	lw $v0, -16($fp)
	sw $v0, 8($sp)
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -40($fp)
	lw $t1, -44($fp)
	lw $t2, -48($fp)
	lw $t3, -52($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $t0, $v0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 76
	jr $ra

	.text
	.globl	MT4_Change

MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 52
	sw $a0, -12($fp)
	sw $a1, -16($fp)
	move $t2, $a2
	move $t3, $a3
	lw $t0, 4($fp)
	lw $t1, 8($fp)
	lw $v0, -16($fp)
	move $a0, $v0
	jal _print
	move $a0, $t2
	jal _print
	move $a0, $t3
	jal _print
	lw $v0, 0($fp)
	move $a0, $v0
	jal _print
	move $a0, $t0
	jal _print
	move $a0, $t1
	jal _print
	li $v1, 0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 52
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
