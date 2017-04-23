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
	la $t2, QS_Init
	sw $t2, 12($t0)
	la $t2, QS_Print
	sw $t2, 8($t0)
	la $t2, QS_Sort
	sw $t2, 4($t0)
	la $t2, QS_Start
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
	.globl	QS_Start

QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 40
	sw $a0, -12($fp)
	move $t1, $a1
	lw $v0, -12($fp)
	move $t2, $v0
	lw $t3, 0($t2)
	lw $t0, 12($t3)
	sw $t0, -28($fp)
	sw $t1, -32($fp)
	sw $t2, -36($fp)
	sw $t3, -40($fp)
	move $a0, $t2
	move $a1, $t1
	jalr $t0
	lw $t0, -28($fp)
	lw $t1, -32($fp)
	lw $t2, -36($fp)
	lw $t3, -40($fp)
	move $t3, $v0
	move $t0, $t3
	lw $v0, -12($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 8($t2)
	sw $t0, -28($fp)
	sw $t1, -32($fp)
	sw $t2, -36($fp)
	sw $t3, -40($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -28($fp)
	lw $t1, -32($fp)
	lw $t2, -36($fp)
	lw $t3, -40($fp)
	move $t2, $v0
	move $t0, $t2
	li $t1, 9999
	move $a0, $t1
	jal _print
	lw $v0, -12($fp)
	lw $t1, 8($v0)
	li $t2, 1
	sub $t3, $t1, $t2
	move $t0, $t3
	lw $v0, -12($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 4($t2)
	li $t2, 0
	sw $t0, -28($fp)
	sw $t1, -32($fp)
	sw $t2, -36($fp)
	sw $t3, -40($fp)
	move $a0, $t1
	move $a1, $t2
	move $a2, $t0
	jalr $t3
	lw $t0, -28($fp)
	lw $t1, -32($fp)
	lw $t2, -36($fp)
	lw $t3, -40($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $v1, 0($v0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $t3, 8($v0)
	sw $t0, -28($fp)
	sw $t1, -32($fp)
	sw $t2, -36($fp)
	sw $t3, -40($fp)
	lw $v0, -24($fp)
	move $a0, $v0
	jalr $t3
	lw $t0, -28($fp)
	lw $t1, -32($fp)
	lw $t2, -36($fp)
	lw $t3, -40($fp)
	move $t1, $v0
	move $t0, $t1
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 40
	jr $ra

	.text
	.globl	QS_Sort

QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 148
	sw $a0, -16($fp)
	sw $a1, -20($fp)
	sw $a2, -12($fp)
	li $t3, 0
	move $v1, $t3
	sw $v1, -24($fp)
	li $t3, 1
	lw $v0, -12($fp)
	sub $t0, $v0, $t3
	move $t3, $t0
	lw $v0, -20($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $t3
	addi $v0, $v0, 1
	beqz $t0, QS_Sort_L2
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	li $t3, 4
	lw $v0, -12($fp)
	mul $t1, $v0, $t3
	move $t3, $t1
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $t1, 0($v0)
	li $t2, 1
	sub $t0, $t1, $t2
	move $t1, $t0
	li $t0, 1
	sub $t3, $t3, 1
	slt $t2, $t3, $t1
	addi $t3, $t3, 1
	sub $t1, $t0, $t2
	beqz $t1, QS_Sort_L4
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L4: 	nop
	li $t0, 4
	add $t1, $t3, $t0
	lw $v0, -28($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $v1, $t1
	sw $v1, -44($fp)
	li $t1, 1
	lw $v0, -20($fp)
	sub $t2, $v0, $t1
	move $v1, $t2
	sw $v1, -32($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	li $t3, 1
	move $v1, $t3
	sw $v1, -40($fp)
QS_Sort_L5: 	lw $v0, -40($fp)
	beqz $v0, QS_Sort_L6
	li $t3, 1
	move $v1, $t3
	sw $v1, -48($fp)
QS_Sort_L7: 	lw $v0, -48($fp)
	beqz $v0, QS_Sort_L8
	li $t3, 1
	lw $v0, -32($fp)
	add $t1, $v0, $t3
	move $v1, $t1
	sw $v1, -32($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -52($fp)
	li $t3, 4
	lw $v0, -32($fp)
	mul $t0, $v0, $t3
	move $t3, $t0
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $t0, 0($v0)
	li $t2, 1
	sub $t1, $t0, $t2
	move $t0, $t1
	li $t1, 1
	sub $t3, $t3, 1
	slt $t2, $t3, $t0
	addi $t3, $t3, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L9
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L9: 	nop
	li $t0, 4
	add $t1, $t3, $t0
	lw $v0, -52($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $v1, $t1
	sw $v1, -56($fp)
	li $t1, 1
	lw $v0, -44($fp)
	sub $t2, $v0, $t1
	move $t1, $t2
	li $t2, 1
	lw $v0, -56($fp)
	sub $v0, $v0, 1
	slt $t3, $v0, $t1
	addi $v0, $v0, 1
	sub $t1, $t2, $t3
	beqz $t1, QS_Sort_L10
	li $t1, 0
	move $v1, $t1
	sw $v1, -48($fp)
	b QS_Sort_L11
QS_Sort_L10: 	li $t1, 1
	move $v1, $t1
	sw $v1, -48($fp)
QS_Sort_L11: 	nop
	b QS_Sort_L7
QS_Sort_L8: 	nop
	li $t1, 1
	move $v1, $t1
	sw $v1, -48($fp)
QS_Sort_L12: 	lw $v0, -48($fp)
	beqz $v0, QS_Sort_L13
	li $t1, 1
	lw $v0, -36($fp)
	sub $t2, $v0, $t1
	move $v1, $t2
	sw $v1, -36($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -60($fp)
	li $t2, 4
	lw $v0, -36($fp)
	mul $t3, $v0, $t2
	move $t2, $t3
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	lw $t3, 0($v0)
	li $t0, 1
	sub $t1, $t3, $t0
	move $t0, $t1
	li $t1, 1
	sub $t2, $t2, 1
	slt $t3, $t2, $t0
	addi $t2, $t2, 1
	sub $t0, $t1, $t3
	beqz $t0, QS_Sort_L14
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L14: 	nop
	li $t0, 4
	add $t1, $t2, $t0
	lw $v0, -60($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $v1, $t1
	sw $v1, -56($fp)
	li $t0, 1
	lw $v0, -56($fp)
	sub $t1, $v0, $t0
	move $t0, $t1
	li $t1, 1
	lw $v0, -44($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L15
	li $t0, 0
	move $v1, $t0
	sw $v1, -48($fp)
	b QS_Sort_L16
QS_Sort_L15: 	li $t0, 1
	move $v1, $t0
	sw $v1, -48($fp)
QS_Sort_L16: 	nop
	b QS_Sort_L12
QS_Sort_L13: 	nop
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -64($fp)
	li $t1, 4
	lw $v0, -32($fp)
	mul $t2, $v0, $t1
	move $t1, $t2
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -64($fp)
	lw $v0, -64($fp)
	lw $t2, 0($v0)
	li $t3, 1
	sub $t0, $t2, $t3
	move $t2, $t0
	li $t0, 1
	sub $t1, $t1, 1
	slt $t3, $t1, $t2
	addi $t1, $t1, 1
	sub $t2, $t0, $t3
	beqz $t2, QS_Sort_L17
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L17: 	nop
	li $t0, 4
	add $t2, $t1, $t0
	lw $v0, -64($fp)
	add $t0, $v0, $t2
	lw $t1, 0($t0)
	move $v1, $t1
	sw $v1, -24($fp)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -68($fp)
	li $t1, 4
	lw $v0, -32($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -72($fp)
	li $t3, 1
	li $t2, 4
	mul $t1, $t3, $t2
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -72($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L18
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L18: 	nop
	li $t0, 4
	lw $v0, -72($fp)
	add $t1, $v0, $t0
	lw $v0, -68($fp)
	add $v1, $v0, $t1
	sw $v1, -76($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -80($fp)
	li $t2, 4
	lw $v0, -36($fp)
	mul $t3, $v0, $t2
	move $t2, $t3
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	lw $t3, 0($v0)
	li $t0, 1
	sub $t1, $t3, $t0
	move $t0, $t1
	li $t1, 1
	sub $t2, $t2, 1
	slt $t3, $t2, $t0
	addi $t2, $t2, 1
	sub $t0, $t1, $t3
	beqz $t0, QS_Sort_L19
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L19: 	nop
	li $t0, 4
	add $t1, $t2, $t0
	lw $v0, -80($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	lw $v1, -76($fp)
	sw $t1, 0($v1)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -84($fp)
	li $t1, 4
	lw $v0, -36($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -88($fp)
	li $t3, 1
	li $t2, 4
	mul $t1, $t3, $t2
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -88($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L20
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L20: 	nop
	li $t0, 4
	lw $v0, -88($fp)
	add $t1, $v0, $t0
	lw $v0, -84($fp)
	add $t0, $v0, $t1
	lw $v0, -24($fp)
	sw $v0, 0($t0)
	lw $v0, -36($fp)
	lw $v1, -32($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $v1
	addi $v0, $v0, 1
	beqz $t0, QS_Sort_L21
	li $t0, 0
	move $v1, $t0
	sw $v1, -40($fp)
	b QS_Sort_L22
QS_Sort_L21: 	li $t0, 1
	move $v1, $t0
	sw $v1, -40($fp)
QS_Sort_L22: 	nop
	b QS_Sort_L5
QS_Sort_L6: 	nop
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -92($fp)
	li $t1, 4
	lw $v0, -36($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -96($fp)
	li $t3, 1
	li $t2, 4
	mul $t1, $t3, $t2
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -96($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L23
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L23: 	nop
	li $t0, 4
	lw $v0, -96($fp)
	add $t1, $v0, $t0
	lw $v0, -92($fp)
	add $v1, $v0, $t1
	sw $v1, -100($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -104($fp)
	li $t2, 4
	lw $v0, -32($fp)
	mul $t3, $v0, $t2
	move $t2, $t3
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -104($fp)
	lw $v0, -104($fp)
	lw $t3, 0($v0)
	li $t0, 1
	sub $t1, $t3, $t0
	move $t0, $t1
	li $t1, 1
	sub $t2, $t2, 1
	slt $t3, $t2, $t0
	addi $t2, $t2, 1
	sub $t0, $t1, $t3
	beqz $t0, QS_Sort_L24
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L24: 	nop
	li $t0, 4
	add $t1, $t2, $t0
	lw $v0, -104($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	lw $v1, -100($fp)
	sw $t1, 0($v1)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -108($fp)
	li $t1, 4
	lw $v0, -32($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -112($fp)
	li $t3, 1
	li $t2, 4
	mul $t1, $t3, $t2
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -108($fp)
	lw $v0, -108($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -112($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L25
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L25: 	nop
	li $t0, 4
	lw $v0, -112($fp)
	add $t1, $v0, $t0
	lw $v0, -108($fp)
	add $v1, $v0, $t1
	sw $v1, -116($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -120($fp)
	li $t2, 4
	lw $v0, -12($fp)
	mul $t3, $v0, $t2
	move $t2, $t3
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	lw $t3, 0($v0)
	li $t0, 1
	sub $t1, $t3, $t0
	move $t0, $t1
	li $t1, 1
	sub $t2, $t2, 1
	slt $t3, $t2, $t0
	addi $t2, $t2, 1
	sub $t0, $t1, $t3
	beqz $t0, QS_Sort_L26
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L26: 	nop
	li $t0, 4
	add $t1, $t2, $t0
	lw $v0, -120($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	lw $v1, -116($fp)
	sw $t1, 0($v1)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -124($fp)
	li $t1, 4
	lw $v0, -12($fp)
	mul $t3, $v0, $t1
	move $v1, $t3
	sw $v1, -128($fp)
	li $t3, 1
	li $t2, 4
	mul $t1, $t3, $t2
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -128($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Sort_L27
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Sort_L27: 	nop
	li $t0, 4
	lw $v0, -128($fp)
	add $t1, $v0, $t0
	lw $v0, -124($fp)
	add $t0, $v0, $t1
	lw $v0, -24($fp)
	sw $v0, 0($t0)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 4($t1)
	li $t1, 1
	lw $v0, -32($fp)
	sub $t3, $v0, $t1
	sw $t0, -136($fp)
	sw $t1, -140($fp)
	sw $t2, -144($fp)
	sw $t3, -148($fp)
	move $a0, $t0
	lw $v0, -20($fp)
	move $a1, $v0
	move $a2, $t3
	jalr $t2
	lw $t0, -136($fp)
	lw $t1, -140($fp)
	lw $t2, -144($fp)
	lw $t3, -148($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -132($fp)
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 4($t2)
	li $t2, 1
	lw $v0, -32($fp)
	add $t0, $v0, $t2
	sw $t0, -136($fp)
	sw $t1, -140($fp)
	sw $t2, -144($fp)
	sw $t3, -148($fp)
	move $a0, $t1
	move $a1, $t0
	lw $v0, -12($fp)
	move $a2, $v0
	jalr $t3
	lw $t0, -136($fp)
	lw $t1, -140($fp)
	lw $t2, -144($fp)
	lw $t3, -148($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -132($fp)
	b QS_Sort_L3
QS_Sort_L2: 	li $t0, 0
	move $v1, $t0
	sw $v1, -132($fp)
QS_Sort_L3: 	nop
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 148
	jr $ra

	.text
	.globl	QS_Print

QS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 124
	sw $a0, -16($fp)
	li $t2, 0
	move $v1, $t2
	sw $v1, -12($fp)
QS_Print_L28: 	lw $v0, -16($fp)
	lw $v1, 8($v0)
	sw $v1, -24($fp)
	li $t3, 1
	lw $v0, -24($fp)
	sub $t0, $v0, $t3
	move $t3, $t0
	lw $v0, -12($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $t3
	addi $v0, $v0, 1
	beqz $t0, QS_Print_L29
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	li $t3, 4
	lw $v0, -12($fp)
	mul $t1, $v0, $t3
	move $t3, $t1
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $t1, 0($v0)
	li $t2, 1
	sub $t0, $t1, $t2
	move $t1, $t0
	li $t0, 1
	sub $t3, $t3, 1
	slt $t2, $t3, $t1
	addi $t3, $t3, 1
	sub $t1, $t0, $t2
	beqz $t1, QS_Print_L30
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Print_L30: 	nop
	li $t0, 4
	add $t1, $t3, $t0
	lw $v0, -28($fp)
	add $t0, $v0, $t1
	lw $t1, 0($t0)
	move $a0, $t1
	jal _print
	li $t0, 1
	lw $v0, -12($fp)
	add $t1, $v0, $t0
	move $v1, $t1
	sw $v1, -12($fp)
	b QS_Print_L28
QS_Print_L29: 	nop
	li $v1, 0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 124
	jr $ra

	.text
	.globl	QS_Init

QS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 164
	sw $a0, -16($fp)
	sw $a1, -20($fp)
	lw $v1, -16($fp)
	lw $v0, -20($fp)
	sw $v0, 8($v1)
	li $v1, 1
	sw $v1, -24($fp)
	lw $v0, -20($fp)
	lw $v1, -24($fp)
	add $t2, $v0, $v1
	li $t0, 4
	mul $t1, $t2, $t0
	move $a0, $t1
	jal _halloc
	move $t0, $v0
	move $v1, $t0
	sw $v1, -28($fp)
	li $t0, 4
	move $t2, $t0
QS_Init_L31: 	li $t0, 1
	lw $v0, -20($fp)
	add $t3, $v0, $t0
	li $t0, 4
	mul $t1, $t3, $t0
	li $t0, 1
	sub $t3, $t1, $t0
	sub $t2, $t2, 1
	slt $t0, $t2, $t3
	addi $t2, $t2, 1
	beqz $t0, QS_Init_L32
	lw $v0, -28($fp)
	add $t0, $v0, $t2
	li $t1, 0
	sw $t1, 0($t0)
	li $t0, 4
	add $t1, $t2, $t0
	move $t2, $t1
	b QS_Init_L31
QS_Init_L32: 	li $t0, 4
	lw $v0, -20($fp)
	mul $t1, $v0, $t0
	lw $v1, -28($fp)
	sw $t1, 0($v1)
	lw $v1, -16($fp)
	lw $v0, -28($fp)
	sw $v0, 4($v1)
	li $t0, 1
	li $v1, 4
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	mul $t2, $t0, $v0
	move $t0, $t2
	lw $v0, -16($fp)
	add $t2, $v0, $t0
	lw $v1, 0($t2)
	sw $v1, -36($fp)
	li $t2, 0
	li $t1, 4
	mul $t3, $t2, $t1
	move $v1, $t3
	sw $v1, -40($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -40($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L33
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L33: 	nop
	li $t0, 4
	lw $v0, -40($fp)
	add $t1, $v0, $t0
	lw $v0, -36($fp)
	add $t0, $v0, $t1
	li $t1, 20
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -44($fp)
	li $t1, 1
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -48($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -48($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L34
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L34: 	nop
	li $t0, 4
	lw $v0, -48($fp)
	add $t1, $v0, $t0
	lw $v0, -44($fp)
	add $t0, $v0, $t1
	li $t1, 7
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -52($fp)
	li $t1, 2
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -56($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -56($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L35
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L35: 	nop
	li $t0, 4
	lw $v0, -56($fp)
	add $t1, $v0, $t0
	lw $v0, -52($fp)
	add $t0, $v0, $t1
	li $t1, 12
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -60($fp)
	li $t1, 3
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -64($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -64($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L36
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L36: 	nop
	li $t0, 4
	lw $v0, -64($fp)
	add $t1, $v0, $t0
	lw $v0, -60($fp)
	add $t0, $v0, $t1
	li $t1, 18
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -68($fp)
	li $t1, 4
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -72($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -72($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L37
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L37: 	nop
	li $t0, 4
	lw $v0, -72($fp)
	add $t1, $v0, $t0
	lw $v0, -68($fp)
	add $t0, $v0, $t1
	li $t1, 2
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -76($fp)
	li $t1, 5
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -80($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -80($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L38
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L38: 	nop
	li $t0, 4
	lw $v0, -80($fp)
	add $t1, $v0, $t0
	lw $v0, -76($fp)
	add $t0, $v0, $t1
	li $t1, 11
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -84($fp)
	li $t1, 6
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -88($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -88($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L39
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L39: 	nop
	li $t0, 4
	lw $v0, -88($fp)
	add $t1, $v0, $t0
	lw $v0, -84($fp)
	add $t0, $v0, $t1
	li $t1, 6
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -92($fp)
	li $t1, 7
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -96($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -96($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L40
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L40: 	nop
	li $t0, 4
	lw $v0, -96($fp)
	add $t1, $v0, $t0
	lw $v0, -92($fp)
	add $t0, $v0, $t1
	li $t1, 9
	sw $t1, 0($t0)
	li $t0, 1
	li $t1, 4
	mul $t2, $t0, $t1
	move $t0, $t2
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -100($fp)
	li $t1, 8
	li $t3, 4
	mul $t2, $t1, $t3
	move $v1, $t2
	sw $v1, -104($fp)
	li $t2, 1
	li $t3, 4
	mul $t1, $t2, $t3
	move $t0, $t1
	lw $v0, -16($fp)
	add $t1, $v0, $t0
	lw $v1, 0($t1)
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	lw $t0, 0($v0)
	li $t1, 1
	sub $t2, $t0, $t1
	move $t0, $t2
	li $t1, 1
	lw $v0, -104($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t0
	addi $v0, $v0, 1
	sub $t0, $t1, $t2
	beqz $t0, QS_Init_L41
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L41: 	nop
	li $v1, 4
	sw $v1, -108($fp)
	lw $v0, -104($fp)
	lw $v1, -108($fp)
	add $t1, $v0, $v1
	lw $v0, -100($fp)
	add $v1, $v0, $t1
	sw $v1, -112($fp)
	li $t1, 19
	lw $v1, -112($fp)
	sw $t1, 0($v1)
	li $t1, 1
	li $t3, 4
	mul $t0, $t1, $t3
	move $t1, $t0
	lw $v0, -16($fp)
	add $t0, $v0, $t1
	lw $t3, 0($t0)
	li $t0, 9
	li $t2, 4
	mul $v1, $t0, $t2
	sw $v1, -116($fp)
	lw $v0, -116($fp)
	move $t0, $v0
	li $t2, 1
	li $v1, 4
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	mul $v1, $t2, $v0
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	move $t1, $v0
	lw $v0, -16($fp)
	add $v1, $v0, $t1
	sw $v1, -128($fp)
	lw $v0, -128($fp)
	lw $t3, 0($v0)
	lw $t1, 0($t3)
	li $v1, 1
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	sub $v1, $t1, $v0
	sw $v1, -136($fp)
	lw $v0, -136($fp)
	move $v1, $v0
	sw $v1, -140($fp)
	li $v1, 1
	sw $v1, -144($fp)
	lw $v0, -140($fp)
	sub $t0, $t0, 1
	slt $v1, $t0, $v0
	addi $t0, $t0, 1
	sw $v1, -148($fp)
	lw $v0, -144($fp)
	lw $v1, -148($fp)
	sub $v1, $v0, $v1
	sw $v1, -152($fp)
	lw $v0, -152($fp)
	beqz $v0, QS_Init_L42
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
QS_Init_L42: 	nop
	li $v1, 4
	sw $v1, -156($fp)
	lw $v0, -156($fp)
	add $v1, $t0, $v0
	sw $v1, -160($fp)
	lw $v0, -160($fp)
	add $t0, $t3, $v0
	li $v1, 5
	sw $v1, -164($fp)
	lw $v0, -164($fp)
	sw $v0, 0($t0)
	li $t3, 0
	move $v0, $t3
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 164
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
