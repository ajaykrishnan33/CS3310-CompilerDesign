	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 28
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $t1, $v0
	move $t0, $t1
	li $t1, 12
	move $a0, $t1
	jal _halloc
	move $t2, $v0
	move $v1, $t2
	sw $v1, -12($fp)
	la $t2, LS_Init
	sw $t2, 12($t0)
	la $t2, LS_Search
	sw $t2, 8($t0)
	la $t2, LS_Print
	sw $t2, 4($t0)
	la $t2, LS_Start
	sw $t2, 0($t0)
	li $t2, 4
	move $t3, $t2
MAIN_L0: 	li $t2, 11
	sub $t3, $t3, 1
	slt $t1, $t3, $t2
	addi $t3, $t3, 1
	beqz $t1, MAIN_L1
	lw $v0, -12($fp)
	add $t1, $v0, $t3
	li $t2, 0
	sw $t2, 0($t1)
	li $t1, 4
	add $t2, $t3, $t1
	move $t3, $t2
	b MAIN_L0
MAIN_L1: 	lw $v1, -12($fp)
	sw $t0, 0($v1)
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 0($t1)
	li $t1, 10
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	jr $ra

	.text
	.globl	LS_Start

LS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 28
	sw $a0, -12($fp)
	move $t1, $a1
	lw $v0, -12($fp)
	move $t2, $v0
	lw $t3, 0($t2)
	lw $t0, 12($t3)
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t2
	move $a1, $t1
	jalr $t0
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $t0, $t3
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 4($t1)
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t1, $v0
	move $t0, $t1
	li $t0, 9999
	move $a0, $t0
	jal _print
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	li $t1, 8
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	li $t1, 12
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	li $t1, 17
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	li $t1, 50
	sw $t0, -16($fp)
	sw $t1, -20($fp)
	sw $t2, -24($fp)
	sw $t3, -28($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -16($fp)
	lw $t1, -20($fp)
	lw $t2, -24($fp)
	lw $t3, -28($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	li $t0, 55
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	jr $ra

	.text
	.globl	LS_Print

LS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 28
	sw $a0, -20($fp)
	li $t2, 1
	move $v1, $t2
	sw $v1, -12($fp)
LS_Print_L2: 	lw $v0, -20($fp)
	lw $t2, 8($v0)
	li $t3, 1
	sub $t1, $t2, $t3
	lw $v0, -12($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t1
	addi $v0, $v0, 1
	beqz $t2, LS_Print_L3
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -24($fp)
	li $t2, 4
	lw $v0, -12($fp)
	mul $t3, $v0, $t2
	move $v1, $t3
	sw $v1, -28($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t3, 0($v0)
	li $t0, 1
	li $t1, 1
	sub $t2, $t3, $t1
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $t1, $v0, $t2
	addi $v0, $v0, 1
	sub $t2, $t0, $t1
	beqz $t2, LS_Print_L4
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
LS_Print_L4: 	nop
	li $t0, 4
	lw $v0, -28($fp)
	add $t1, $v0, $t0
	lw $v0, -24($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $a0, $t1
	jal _print
	li $t0, 1
	lw $v0, -12($fp)
	add $t1, $v0, $t0
	move $v1, $t1
	sw $v1, -12($fp)
	b LS_Print_L2
LS_Print_L3: 	nop
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	jr $ra

	.text
	.globl	LS_Search

LS_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 48
	sw $a0, -28($fp)
	sw $a1, -24($fp)
	li $t3, 1
	move $v1, $t3
	sw $v1, -12($fp)
	li $t3, 0
	move $v1, $t3
	sw $v1, -32($fp)
	li $t3, 0
	move $v1, $t3
	sw $v1, -20($fp)
LS_Search_L5: 	lw $v0, -28($fp)
	lw $t3, 8($v0)
	li $t1, 1
	sub $t0, $t3, $t1
	lw $v0, -12($fp)
	sub $v0, $v0, 1
	slt $t1, $v0, $t0
	addi $v0, $v0, 1
	beqz $t1, LS_Search_L6
	lw $v0, -28($fp)
	lw $v1, 4($v0)
	sw $v1, -36($fp)
	li $t1, 4
	lw $v0, -12($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -40($fp)
	lw $v0, -28($fp)
	lw $v1, 4($v0)
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $t3, 0($v0)
	li $t2, 1
	li $t0, 1
	sub $t1, $t3, $t0
	lw $v0, -40($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $t1
	addi $v0, $v0, 1
	sub $t1, $t2, $t0
	beqz $t1, LS_Search_L7
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
LS_Search_L7: 	nop
	li $t0, 4
	lw $v0, -40($fp)
	add $t1, $v0, $t0
	lw $v0, -36($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $t0, $t1
	li $t1, 1
	lw $v0, -24($fp)
	add $t2, $v0, $t1
	move $t1, $t2
	li $t2, 1
	lw $v0, -24($fp)
	sub $t3, $v0, $t2
	sub $t0, $t0, 1
	slt $t2, $t0, $t3
	addi $t0, $t0, 1
	beqz $t2, LS_Search_L8
	li $t2, 0
	move $v1, $t2
	sw $v1, -44($fp)
	b LS_Search_L9
LS_Search_L8: 	li $v1, 1
	sw $v1, -48($fp)
	li $t3, 1
	sub $t2, $t1, $t3
	sub $t0, $t0, 1
	slt $t1, $t0, $t2
	addi $t0, $t0, 1
	lw $v0, -48($fp)
	sub $t0, $v0, $t1
	beqz $t0, LS_Search_L10
	li $t0, 0
	move $v1, $t0
	sw $v1, -44($fp)
	b LS_Search_L11
LS_Search_L10: 	li $t0, 1
	move $v1, $t0
	sw $v1, -32($fp)
	li $t0, 1
	move $v1, $t0
	sw $v1, -20($fp)
	lw $v0, -28($fp)
	lw $t0, 8($v0)
	move $v1, $t0
	sw $v1, -12($fp)
LS_Search_L11: 	nop
LS_Search_L9: 	nop
	li $t0, 1
	lw $v0, -12($fp)
	add $t1, $v0, $t0
	move $v1, $t1
	sw $v1, -12($fp)
	b LS_Search_L5
LS_Search_L6: 	nop
	lw $v0, -20($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 48
	jr $ra

	.text
	.globl	LS_Init

LS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 60
	sw $a0, -32($fp)
	sw $a1, -24($fp)
	lw $v1, -32($fp)
	lw $v0, -24($fp)
	sw $v0, 8($v1)
	li $t3, 1
	lw $v0, -24($fp)
	add $t2, $v0, $t3
	li $t3, 4
	mul $v1, $t2, $t3
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $a0, $v0
	jal _halloc
	move $t2, $v0
	move $v1, $t2
	sw $v1, -20($fp)
	li $t2, 4
	move $t3, $t2
LS_Init_L12: 	li $t2, 1
	lw $v0, -24($fp)
	add $t1, $v0, $t2
	li $v1, 4
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	mul $t2, $t1, $v0
	li $t1, 1
	sub $t0, $t2, $t1
	sub $t3, $t3, 1
	slt $t1, $t3, $t0
	addi $t3, $t3, 1
	beqz $t1, LS_Init_L13
	lw $v0, -20($fp)
	add $t0, $v0, $t3
	li $t1, 0
	sw $t1, 0($t0)
	li $t0, 4
	add $t1, $t3, $t0
	move $t3, $t1
	b LS_Init_L12
LS_Init_L13: 	li $t0, 4
	lw $v0, -24($fp)
	mul $t1, $v0, $t0
	lw $v1, -20($fp)
	sw $t1, 0($v1)
	lw $v1, -32($fp)
	lw $v0, -20($fp)
	sw $v0, 4($v1)
	li $t0, 1
	move $v1, $t0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	lw $t0, 8($v0)
	li $v1, 1
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	add $t3, $t0, $v0
	move $v1, $t3
	sw $v1, -36($fp)
LS_Init_L14: 	lw $v0, -32($fp)
	lw $t3, 8($v0)
	li $t0, 1
	sub $t2, $t3, $t0
	lw $v0, -44($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $t2
	addi $v0, $v0, 1
	beqz $t0, LS_Init_L15
	li $t0, 2
	lw $v0, -44($fp)
	mul $t2, $t0, $v0
	move $v1, $t2
	sw $v1, -52($fp)
	li $t2, 3
	lw $v0, -36($fp)
	sub $t3, $v0, $t2
	move $v1, $t3
	sw $v1, -48($fp)
	li $t3, 1
	li $t1, 4
	mul $t2, $t3, $t1
	move $t1, $t2
	lw $v0, -32($fp)
	add $t2, $v0, $t1
	lw $v1, 0($t2)
	sw $v1, -56($fp)
	li $t2, 4
	lw $v0, -44($fp)
	mul $t0, $v0, $t2
	move $v1, $t0
	sw $v1, -60($fp)
	li $t0, 1
	li $t3, 4
	mul $t2, $t0, $t3
	move $t1, $t2
	lw $v0, -32($fp)
	add $t0, $v0, $t1
	lw $v1, 0($t0)
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	lw $t0, 0($v0)
	li $t1, 1
	li $t2, 1
	sub $t3, $t0, $t2
	lw $v0, -60($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $t3
	addi $v0, $v0, 1
	sub $t2, $t1, $t0
	beqz $t2, LS_Init_L16
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
LS_Init_L16: 	nop
	li $t0, 4
	lw $v0, -60($fp)
	add $t1, $v0, $t0
	lw $v0, -56($fp)
	add $t0, $v0, $t1
	lw $v0, -52($fp)
	lw $v1, -48($fp)
	add $t1, $v0, $v1
	sw $t1, 0($t0)
	li $t0, 1
	lw $v0, -44($fp)
	add $t1, $v0, $t0
	move $v1, $t1
	sw $v1, -44($fp)
	li $t0, 1
	lw $v0, -36($fp)
	sub $t1, $v0, $t0
	move $v1, $t1
	sw $v1, -36($fp)
	b LS_Init_L14
LS_Init_L15: 	nop
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 60
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
