	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 36
	li $s0, 16
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	move $v1, $s1
	sw $v1, -20($fp)
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s0, $v0
	move $v1, $s0
	sw $v1, -24($fp)
	la $s0, BBS_Init
	lw $v1, -20($fp)
	sw $s0, 12($v1)
	la $s0, BBS_Print
	lw $v1, -20($fp)
	sw $s0, 8($v1)
	la $s0, BBS_Sort
	lw $v1, -20($fp)
	sw $s0, 4($v1)
	la $s0, BBS_Start
	lw $v1, -20($fp)
	sw $s0, 0($v1)
	li $s0, 4
	move $v1, $s0
	sw $v1, -28($fp)
MAIN_L0: 	li $s0, 11
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, MAIN_L1
	lw $v0, -24($fp)
	lw $v1, -28($fp)
	add $s0, $v0, $v1
	li $s1, 0
	sw $s1, 0($s0)
	li $s0, 4
	lw $v0, -28($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -28($fp)
	b MAIN_L0
MAIN_L1: 	lw $v1, -24($fp)
	lw $v0, -20($fp)
	sw $v0, 0($v1)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 0($s1)
	sw $v1, -32($fp)
	li $s1, 10
	move $a0, $s0
	move $a1, $s1
	lw $v0, -32($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 36
	jr $ra

	.text
	.globl	BBS_Start

BBS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 52
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -20($fp)
	sw $a1, -28($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $s0, 0($v0)
	lw $s1, 12($s0)
	lw $v0, -24($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	move $a1, $v0
	jalr $s1
	move $s0, $v0
	move $v1, $s0
	sw $v1, -32($fp)
	lw $v0, -20($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 8($s1)
	sw $v1, -36($fp)
	move $a0, $s0
	lw $v0, -36($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	li $s0, 99999
	move $a0, $s0
	jal _print
	lw $v0, -20($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 4($s1)
	sw $v1, -44($fp)
	move $a0, $s0
	lw $v0, -44($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -32($fp)
	lw $v0, -20($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 8($s1)
	sw $v1, -48($fp)
	move $a0, $s0
	lw $v0, -48($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 52
	jr $ra

	.text
	.globl	BBS_Sort

BBS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 192
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -20($fp)
	lw $v0, -20($fp)
	lw $s1, 8($v0)
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	li $s1, 0
	li $v1, 1
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	sub $s0, $s1, $v0
	move $v1, $s0
	sw $v1, -36($fp)
BBS_Sort_L2: 	li $v1, 1
	sw $v1, -40($fp)
	lw $v0, -32($fp)
	lw $v1, -40($fp)
	sub $s1, $v0, $v1
	lw $v0, -36($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $s1
	addi $v0, $v0, 1
	beqz $s0, BBS_Sort_L3
	li $v1, 1
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -44($fp)
BBS_Sort_L4: 	lw $v0, -44($fp)
	lw $v1, -32($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $v1
	addi $v0, $v0, 1
	beqz $s1, BBS_Sort_L5
	li $s1, 1
	lw $v0, -44($fp)
	sub $s0, $v0, $s1
	move $s1, $s0
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -52($fp)
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	move $v1, $v0
	sw $v1, -60($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $s1, 0($v0)
	li $v1, 1
	sw $v1, -64($fp)
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -68($fp)
	lw $v0, -60($fp)
	lw $v1, -68($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -64($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L6
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L6: 	nop
	li $s0, 4
	lw $v0, -60($fp)
	add $s1, $v0, $s0
	lw $v0, -52($fp)
	add $s0, $v0, $s1
	lw $s1, 0($s0)
	move $v1, $s1
	sw $v1, -72($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -76($fp)
	li $s0, 4
	lw $v0, -44($fp)
	mul $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -80($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $s1, 0($v0)
	li $v1, 1
	sw $v1, -84($fp)
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -88($fp)
	lw $v0, -80($fp)
	lw $v1, -88($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -84($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L7
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L7: 	nop
	li $s0, 4
	lw $v0, -80($fp)
	add $s1, $v0, $s0
	lw $v0, -76($fp)
	add $s0, $v0, $s1
	lw $s1, 0($s0)
	move $s0, $s1
	li $s1, 1
	lw $v0, -72($fp)
	sub $v1, $v0, $s1
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	sub $s0, $s0, 1
	slt $s1, $s0, $v0
	addi $s0, $s0, 1
	beqz $s1, BBS_Sort_L8
	li $s0, 1
	lw $v0, -44($fp)
	sub $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -96($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -100($fp)
	li $s0, 4
	lw $v0, -96($fp)
	mul $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -104($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	lw $s1, 0($v0)
	li $v1, 1
	sw $v1, -108($fp)
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -112($fp)
	lw $v0, -104($fp)
	lw $v1, -112($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -108($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L10
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L10: 	nop
	li $s0, 4
	lw $v0, -104($fp)
	add $s1, $v0, $s0
	lw $v0, -100($fp)
	add $s0, $v0, $s1
	lw $s1, 0($s0)
	move $v1, $s1
	sw $v1, -116($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	move $v1, $v0
	sw $v1, -128($fp)
	lw $v0, -20($fp)
	lw $v1, -128($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -124($fp)
	li $s1, 4
	lw $v0, -96($fp)
	mul $s0, $v0, $s1
	move $v1, $s0
	sw $v1, -132($fp)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -136($fp)
	lw $v0, -136($fp)
	move $v1, $v0
	sw $v1, -128($fp)
	lw $v0, -20($fp)
	lw $v1, -128($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -140($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -144($fp)
	lw $v0, -132($fp)
	lw $v1, -144($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -140($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L11
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L11: 	nop
	li $s0, 4
	lw $v0, -132($fp)
	add $s1, $v0, $s0
	lw $v0, -124($fp)
	add $v1, $v0, $s1
	sw $v1, -148($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -152($fp)
	li $s0, 4
	lw $v0, -44($fp)
	mul $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -156($fp)
	lw $v0, -20($fp)
	lw $v1, 4($v0)
	sw $v1, -152($fp)
	lw $v0, -152($fp)
	lw $s1, 0($v0)
	li $v1, 1
	sw $v1, -160($fp)
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -164($fp)
	lw $v0, -156($fp)
	lw $v1, -164($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -160($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L12
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L12: 	nop
	li $s0, 4
	lw $v0, -156($fp)
	add $s1, $v0, $s0
	lw $v0, -152($fp)
	add $s0, $v0, $s1
	lw $s1, 0($s0)
	lw $v1, -148($fp)
	sw $s1, 0($v1)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -168($fp)
	lw $v0, -168($fp)
	move $v1, $v0
	sw $v1, -176($fp)
	lw $v0, -20($fp)
	lw $v1, -176($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -172($fp)
	li $s1, 4
	lw $v0, -44($fp)
	mul $s0, $v0, $s1
	move $v1, $s0
	sw $v1, -180($fp)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -184($fp)
	lw $v0, -184($fp)
	move $v1, $v0
	sw $v1, -176($fp)
	lw $v0, -20($fp)
	lw $v1, -176($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -172($fp)
	lw $v0, -172($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -188($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -192($fp)
	lw $v0, -180($fp)
	lw $v1, -192($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -188($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Sort_L13
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Sort_L13: 	nop
	li $s0, 4
	lw $v0, -180($fp)
	add $s1, $v0, $s0
	lw $v0, -172($fp)
	add $s0, $v0, $s1
	lw $v0, -116($fp)
	sw $v0, 0($s0)
	b BBS_Sort_L9
BBS_Sort_L8: 	li $s0, 0
	move $s1, $s0
BBS_Sort_L9: 	nop
	li $s0, 1
	lw $v0, -44($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -44($fp)
	b BBS_Sort_L4
BBS_Sort_L5: 	nop
	li $s0, 1
	lw $v0, -32($fp)
	sub $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -32($fp)
	b BBS_Sort_L2
BBS_Sort_L3: 	nop
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 192
	jr $ra

	.text
	.globl	BBS_Print

BBS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 192
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -24($fp)
	li $v1, 0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -20($fp)
BBS_Print_L14: 	lw $v0, -24($fp)
	lw $s0, 8($v0)
	li $v1, 1
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	sub $s1, $s0, $v0
	move $s0, $s1
	lw $v0, -20($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $s0
	addi $v0, $v0, 1
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	beqz $v0, BBS_Print_L15
	lw $v0, -24($fp)
	lw $v1, 4($v0)
	sw $v1, -48($fp)
	li $s1, 4
	lw $v0, -20($fp)
	mul $v1, $v0, $s1
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -24($fp)
	lw $v1, 4($v0)
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	lw $v1, 0($v0)
	sw $v1, -44($fp)
	li $v1, 1
	sw $v1, -56($fp)
	li $s1, 1
	lw $v0, -44($fp)
	sub $s0, $v0, $s1
	lw $v0, -52($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	lw $v0, -56($fp)
	sub $v1, $v0, $s1
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	beqz $v0, BBS_Print_L16
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Print_L16: 	nop
	li $v1, 4
	sw $v1, -64($fp)
	lw $v0, -52($fp)
	lw $v1, -64($fp)
	add $v1, $v0, $v1
	sw $v1, -68($fp)
	lw $v0, -48($fp)
	lw $v1, -68($fp)
	add $v1, $v0, $v1
	sw $v1, -72($fp)
	lw $v0, -72($fp)
	lw $s0, 0($v0)
	move $a0, $s0
	jal _print
	li $s0, 1
	lw $v0, -20($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -20($fp)
	b BBS_Print_L14
BBS_Print_L15: 	nop
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 192
	jr $ra

	.text
	.globl	BBS_Init

BBS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 364
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -20($fp)
	sw $a1, -24($fp)
	lw $v1, -20($fp)
	lw $v0, -24($fp)
	sw $v0, 8($v1)
	li $s1, 1
	lw $v0, -24($fp)
	add $s0, $v0, $s1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $a0, $v0
	jal _halloc
	move $s0, $v0
	move $v1, $s0
	sw $v1, -36($fp)
	li $s0, 4
	move $v1, $s0
	sw $v1, -40($fp)
BBS_Init_L17: 	li $s0, 1
	lw $v0, -24($fp)
	add $s1, $v0, $s0
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -44($fp)
	li $s0, 1
	lw $v0, -44($fp)
	sub $s1, $v0, $s0
	lw $v0, -40($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $s1
	addi $v0, $v0, 1
	beqz $s0, BBS_Init_L18
	lw $v0, -36($fp)
	lw $v1, -40($fp)
	add $s0, $v0, $v1
	li $s1, 0
	sw $s1, 0($s0)
	li $s0, 4
	lw $v0, -40($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -40($fp)
	b BBS_Init_L17
BBS_Init_L18: 	li $s0, 4
	lw $v0, -24($fp)
	mul $s1, $v0, $s0
	lw $v1, -36($fp)
	sw $s1, 0($v1)
	lw $v1, -20($fp)
	lw $v0, -36($fp)
	sw $v0, 4($v1)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -56($fp)
	lw $v0, -20($fp)
	lw $v1, -56($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -52($fp)
	li $s1, 0
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	move $v1, $v0
	sw $v1, -56($fp)
	lw $v0, -20($fp)
	lw $v1, -56($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -72($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -76($fp)
	lw $v0, -64($fp)
	lw $v1, -76($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -72($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L19
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L19: 	nop
	li $s0, 4
	lw $v0, -64($fp)
	add $s1, $v0, $s0
	lw $v0, -52($fp)
	add $s0, $v0, $s1
	li $s1, 20
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -88($fp)
	lw $v0, -20($fp)
	lw $v1, -88($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -84($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	move $v1, $v0
	sw $v1, -96($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	move $v1, $v0
	sw $v1, -88($fp)
	lw $v0, -20($fp)
	lw $v1, -88($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -104($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -108($fp)
	lw $v0, -96($fp)
	lw $v1, -108($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -104($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L20
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L20: 	nop
	li $s0, 4
	lw $v0, -96($fp)
	add $s1, $v0, $s0
	lw $v0, -84($fp)
	add $s0, $v0, $s1
	li $s1, 7
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -112($fp)
	lw $v0, -112($fp)
	move $v1, $v0
	sw $v1, -120($fp)
	lw $v0, -20($fp)
	lw $v1, -120($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -116($fp)
	li $s1, 2
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	move $v1, $v0
	sw $v1, -128($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -120($fp)
	lw $v0, -20($fp)
	lw $v1, -120($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -116($fp)
	lw $v0, -116($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -136($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -140($fp)
	lw $v0, -128($fp)
	lw $v1, -140($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -136($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L21
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L21: 	nop
	li $s0, 4
	lw $v0, -128($fp)
	add $s1, $v0, $s0
	lw $v0, -116($fp)
	add $s0, $v0, $s1
	li $s1, 12
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -144($fp)
	lw $v0, -144($fp)
	move $v1, $v0
	sw $v1, -152($fp)
	lw $v0, -20($fp)
	lw $v1, -152($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -148($fp)
	li $s1, 3
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -156($fp)
	lw $v0, -156($fp)
	move $v1, $v0
	sw $v1, -160($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -164($fp)
	lw $v0, -164($fp)
	move $v1, $v0
	sw $v1, -152($fp)
	lw $v0, -20($fp)
	lw $v1, -152($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -148($fp)
	lw $v0, -148($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -168($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -172($fp)
	lw $v0, -160($fp)
	lw $v1, -172($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -168($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L22
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L22: 	nop
	li $s0, 4
	lw $v0, -160($fp)
	add $s1, $v0, $s0
	lw $v0, -148($fp)
	add $s0, $v0, $s1
	li $s1, 18
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -176($fp)
	lw $v0, -176($fp)
	move $v1, $v0
	sw $v1, -184($fp)
	lw $v0, -20($fp)
	lw $v1, -184($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -180($fp)
	li $s1, 4
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -188($fp)
	lw $v0, -188($fp)
	move $v1, $v0
	sw $v1, -192($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -196($fp)
	lw $v0, -196($fp)
	move $v1, $v0
	sw $v1, -184($fp)
	lw $v0, -20($fp)
	lw $v1, -184($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -180($fp)
	lw $v0, -180($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -200($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -204($fp)
	lw $v0, -192($fp)
	lw $v1, -204($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -200($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L23
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L23: 	nop
	li $s0, 4
	lw $v0, -192($fp)
	add $s1, $v0, $s0
	lw $v0, -180($fp)
	add $s0, $v0, $s1
	li $s1, 2
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -208($fp)
	lw $v0, -208($fp)
	move $v1, $v0
	sw $v1, -216($fp)
	lw $v0, -20($fp)
	lw $v1, -216($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -212($fp)
	li $s1, 5
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -220($fp)
	lw $v0, -220($fp)
	move $v1, $v0
	sw $v1, -224($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -228($fp)
	lw $v0, -228($fp)
	move $v1, $v0
	sw $v1, -216($fp)
	lw $v0, -20($fp)
	lw $v1, -216($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -212($fp)
	lw $v0, -212($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -232($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -236($fp)
	lw $v0, -224($fp)
	lw $v1, -236($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -232($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L24
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L24: 	nop
	li $s0, 4
	lw $v0, -224($fp)
	add $s1, $v0, $s0
	lw $v0, -212($fp)
	add $s0, $v0, $s1
	li $s1, 11
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -240($fp)
	lw $v0, -240($fp)
	move $v1, $v0
	sw $v1, -248($fp)
	lw $v0, -20($fp)
	lw $v1, -248($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -244($fp)
	li $s1, 6
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -252($fp)
	lw $v0, -252($fp)
	move $v1, $v0
	sw $v1, -256($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -260($fp)
	lw $v0, -260($fp)
	move $v1, $v0
	sw $v1, -248($fp)
	lw $v0, -20($fp)
	lw $v1, -248($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -244($fp)
	lw $v0, -244($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -264($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -268($fp)
	lw $v0, -256($fp)
	lw $v1, -268($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -264($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L25
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L25: 	nop
	li $s0, 4
	lw $v0, -256($fp)
	add $s1, $v0, $s0
	lw $v0, -244($fp)
	add $s0, $v0, $s1
	li $s1, 6
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -272($fp)
	lw $v0, -272($fp)
	move $v1, $v0
	sw $v1, -280($fp)
	lw $v0, -20($fp)
	lw $v1, -280($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -276($fp)
	li $s1, 7
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -284($fp)
	lw $v0, -284($fp)
	move $v1, $v0
	sw $v1, -288($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -292($fp)
	lw $v0, -292($fp)
	move $v1, $v0
	sw $v1, -280($fp)
	lw $v0, -20($fp)
	lw $v1, -280($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -276($fp)
	lw $v0, -276($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -296($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -300($fp)
	lw $v0, -288($fp)
	lw $v1, -300($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -296($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L26
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L26: 	nop
	li $s0, 4
	lw $v0, -288($fp)
	add $s1, $v0, $s0
	lw $v0, -276($fp)
	add $s0, $v0, $s1
	li $s1, 9
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -304($fp)
	lw $v0, -304($fp)
	move $v1, $v0
	sw $v1, -312($fp)
	lw $v0, -20($fp)
	lw $v1, -312($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -308($fp)
	li $s1, 8
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -316($fp)
	lw $v0, -316($fp)
	move $v1, $v0
	sw $v1, -320($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -324($fp)
	lw $v0, -324($fp)
	move $v1, $v0
	sw $v1, -312($fp)
	lw $v0, -20($fp)
	lw $v1, -312($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -308($fp)
	lw $v0, -308($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -328($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -332($fp)
	lw $v0, -320($fp)
	lw $v1, -332($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -328($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L27
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L27: 	nop
	li $s0, 4
	lw $v0, -320($fp)
	add $s1, $v0, $s0
	lw $v0, -308($fp)
	add $s0, $v0, $s1
	li $s1, 19
	sw $s1, 0($s0)
	li $s0, 1
	li $s1, 4
	mul $v1, $s0, $s1
	sw $v1, -336($fp)
	lw $v0, -336($fp)
	move $v1, $v0
	sw $v1, -344($fp)
	lw $v0, -20($fp)
	lw $v1, -344($fp)
	add $s1, $v0, $v1
	lw $v1, 0($s1)
	sw $v1, -340($fp)
	li $s1, 9
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -348($fp)
	lw $v0, -348($fp)
	move $v1, $v0
	sw $v1, -352($fp)
	li $s1, 1
	li $s0, 4
	mul $v1, $s1, $s0
	sw $v1, -356($fp)
	lw $v0, -356($fp)
	move $v1, $v0
	sw $v1, -344($fp)
	lw $v0, -20($fp)
	lw $v1, -344($fp)
	add $s0, $v0, $v1
	lw $v1, 0($s0)
	sw $v1, -340($fp)
	lw $v0, -340($fp)
	lw $s0, 0($v0)
	li $v1, 1
	sw $v1, -360($fp)
	li $s1, 1
	sub $v1, $s0, $s1
	sw $v1, -364($fp)
	lw $v0, -352($fp)
	lw $v1, -364($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -360($fp)
	sub $s1, $v0, $s0
	beqz $s1, BBS_Init_L28
	li $v0, 4
	la $a0, str_er
	syscall
	li $v0, 10
	syscall
BBS_Init_L28: 	nop
	li $s0, 4
	lw $v0, -352($fp)
	add $s1, $v0, $s0
	lw $v0, -340($fp)
	add $s0, $v0, $s1
	li $s1, 5
	sw $s1, 0($s0)
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 364
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
