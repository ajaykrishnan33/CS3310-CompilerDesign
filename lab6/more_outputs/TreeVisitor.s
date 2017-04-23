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
	move $v1, $s1
	sw $v1, -20($fp)
	li $s1, 4
	move $a0, $s1
	jal _halloc
	move $s0, $v0
	move $s1, $s0
	la $s0, TV_Start
	lw $v1, -20($fp)
	sw $s0, 0($v1)
	lw $v0, -20($fp)
	sw $v0, 0($s1)
	move $s0, $s1
	lw $s1, 0($s0)
	lw $v1, 0($s1)
	sw $v1, -24($fp)
	move $a0, $s0
	lw $v0, -24($fp)
	jalr $v0
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	TV_Start

TV_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	li $s0, 84
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	move $v1, $s1
	sw $v1, -20($fp)
	li $s1, 28
	move $a0, $s1
	jal _halloc
	move $s0, $v0
	move $v1, $s0
	sw $v1, -24($fp)
	la $s0, Tree_accept
	lw $v1, -20($fp)
	sw $s0, 80($v1)
	la $s0, Tree_RecPrint
	lw $v1, -20($fp)
	sw $s0, 76($v1)
	la $s0, Tree_Print
	lw $v1, -20($fp)
	sw $s0, 72($v1)
	la $s0, Tree_Search
	lw $v1, -20($fp)
	sw $s0, 68($v1)
	la $s0, Tree_RemoveLeft
	lw $v1, -20($fp)
	sw $s0, 64($v1)
	la $s0, Tree_RemoveRight
	lw $v1, -20($fp)
	sw $s0, 60($v1)
	la $s0, Tree_Remove
	lw $v1, -20($fp)
	sw $s0, 56($v1)
	la $s0, Tree_Delete
	lw $v1, -20($fp)
	sw $s0, 52($v1)
	la $s0, Tree_Insert
	lw $v1, -20($fp)
	sw $s0, 48($v1)
	la $s0, Tree_Compare
	lw $v1, -20($fp)
	sw $s0, 44($v1)
	la $s0, Tree_SetHas_Right
	lw $v1, -20($fp)
	sw $s0, 40($v1)
	la $s0, Tree_SetHas_Left
	lw $v1, -20($fp)
	sw $s0, 36($v1)
	la $s0, Tree_GetHas_Left
	lw $v1, -20($fp)
	sw $s0, 32($v1)
	la $s0, Tree_GetHas_Right
	lw $v1, -20($fp)
	sw $s0, 28($v1)
	la $s0, Tree_SetKey
	lw $v1, -20($fp)
	sw $s0, 24($v1)
	la $s0, Tree_GetKey
	lw $v1, -20($fp)
	sw $s0, 20($v1)
	la $s0, Tree_GetLeft
	lw $v1, -20($fp)
	sw $s0, 16($v1)
	la $s0, Tree_GetRight
	lw $v1, -20($fp)
	sw $s0, 12($v1)
	la $s0, Tree_SetLeft
	lw $v1, -20($fp)
	sw $s0, 8($v1)
	la $s0, Tree_SetRight
	lw $v1, -20($fp)
	sw $s0, 4($v1)
	la $s0, Tree_Init
	lw $v1, -20($fp)
	sw $s0, 0($v1)
	li $s0, 4
	move $v1, $s0
	sw $v1, -28($fp)
TV_Start_L2: 	li $s0, 27
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, TV_Start_L3
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
	b TV_Start_L2
TV_Start_L3: 	lw $v1, -24($fp)
	lw $v0, -20($fp)
	sw $v0, 0($v1)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 0($s0)
	sw $v1, -36($fp)
	li $s0, 16
	move $a0, $s1
	move $a1, $s0
	lw $v0, -36($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 72($s0)
	sw $v1, -48($fp)
	move $a0, $s1
	lw $v0, -48($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -44($fp)
	li $s0, 100000000
	move $a0, $s0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -52($fp)
	li $s1, 8
	move $a0, $s0
	move $a1, $s1
	lw $v0, -52($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -60($fp)
	li $s1, 24
	move $a0, $s0
	move $a1, $s1
	lw $v0, -60($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -64($fp)
	lw $v0, -64($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -68($fp)
	li $s1, 4
	move $a0, $s0
	move $a1, $s1
	lw $v0, -68($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -72($fp)
	lw $v0, -72($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -76($fp)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	lw $v0, -76($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -84($fp)
	li $s1, 20
	move $a0, $s0
	move $a1, $s1
	lw $v0, -84($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -88($fp)
	lw $v0, -88($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -92($fp)
	li $s1, 28
	move $a0, $s0
	move $a1, $s1
	lw $v0, -92($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -96($fp)
	lw $v0, -96($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 48($s1)
	sw $v1, -100($fp)
	li $s1, 14
	move $a0, $s0
	move $a1, $s1
	lw $v0, -100($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -104($fp)
	lw $v0, -104($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 72($s1)
	sw $v1, -108($fp)
	move $a0, $s0
	lw $v0, -108($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -44($fp)
	li $s0, 100000000
	move $a0, $s0
	jal _print
	li $s0, 4
	move $a0, $s0
	jal _halloc
	move $s1, $v0
	move $v1, $s1
	sw $v1, -112($fp)
	li $s1, 12
	move $a0, $s1
	jal _halloc
	move $s0, $v0
	move $v1, $s0
	sw $v1, -116($fp)
	la $s0, MyVisitor_visit
	lw $v1, -112($fp)
	sw $s0, 0($v1)
	li $s0, 4
	move $v1, $s0
	sw $v1, -120($fp)
TV_Start_L4: 	li $s0, 11
	lw $v0, -120($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, TV_Start_L5
	lw $v0, -116($fp)
	lw $v1, -120($fp)
	add $s0, $v0, $v1
	li $s1, 0
	sw $s1, 0($s0)
	li $s0, 4
	lw $v0, -120($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -120($fp)
	b TV_Start_L4
TV_Start_L5: 	lw $v1, -116($fp)
	lw $v0, -112($fp)
	sw $v0, 0($v1)
	lw $v0, -116($fp)
	move $s0, $v0
	li $s1, 50000000
	move $a0, $s1
	jal _print
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	lw $s1, 0($v0)
	lw $v1, 80($s1)
	sw $v1, -128($fp)
	lw $v0, -124($fp)
	move $a0, $v0
	move $a1, $s0
	lw $v0, -128($fp)
	jalr $v0
	move $s1, $v0
	move $s0, $s1
	li $s0, 100000000
	move $a0, $s0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -132($fp)
	li $s1, 24
	move $a0, $s0
	move $a1, $s1
	lw $v0, -132($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -136($fp)
	lw $v0, -136($fp)
	move $a0, $v0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -140($fp)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	lw $v0, -140($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -144($fp)
	lw $v0, -144($fp)
	move $a0, $v0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -148($fp)
	li $s1, 16
	move $a0, $s0
	move $a1, $s1
	lw $v0, -148($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -152($fp)
	lw $v0, -152($fp)
	move $a0, $v0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -156($fp)
	li $s1, 50
	move $a0, $s0
	move $a1, $s1
	lw $v0, -156($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -160($fp)
	lw $v0, -160($fp)
	move $a0, $v0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -164($fp)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	lw $v0, -164($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -168($fp)
	lw $v0, -168($fp)
	move $a0, $v0
	jal _print
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 52($s1)
	sw $v1, -172($fp)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	lw $v0, -172($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -176($fp)
	lw $v0, -176($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 72($s1)
	sw $v1, -180($fp)
	move $a0, $s0
	lw $v0, -180($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -44($fp)
	lw $v0, -32($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 68($s1)
	sw $v1, -184($fp)
	li $s1, 12
	move $a0, $s0
	move $a1, $s1
	lw $v0, -184($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -188($fp)
	lw $v0, -188($fp)
	move $a0, $v0
	jal _print
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_Init

Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 12($s0)
	li $v1, 0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	sw $v0, 16($s0)
	li $s1, 0
	sw $s1, 20($s0)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_SetRight

Tree_SetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 8($s0)
	li $v1, 1
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_SetLeft

Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 4($s0)
	li $v1, 1
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_GetRight

Tree_GetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $v1, 8($s0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_GetLeft

Tree_GetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $v1, 4($s0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_GetKey

Tree_GetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $v1, 12($s0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_SetKey

Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 12($s0)
	li $v1, 1
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_GetHas_Right

Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $v1, 20($s0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_GetHas_Left

Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	lw $v1, 16($s0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_SetHas_Left

Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 16($s0)
	li $v1, 1
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_SetHas_Right

Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 188
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	move $s1, $a1
	sw $s1, 20($s0)
	li $v1, 1
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 188
	jr $ra

	.text
	.globl	Tree_Compare

Tree_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 200
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	move $s0, $a0
	sw $a1, -28($fp)
	sw $a2, -20($fp)
	li $s0, 0
	move $v1, $s0
	sw $v1, -24($fp)
	li $s0, 1
	lw $v0, -20($fp)
	add $s1, $v0, $s0
	move $v1, $s1
	sw $v1, -32($fp)
	li $s1, 1
	lw $v0, -20($fp)
	sub $s0, $v0, $s1
	move $s1, $s0
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $s1
	addi $v0, $v0, 1
	beqz $s0, Tree_Compare_L6
	li $s0, 0
	move $v1, $s0
	sw $v1, -24($fp)
	b Tree_Compare_L7
Tree_Compare_L6: 	li $s0, 1
	lw $v0, -32($fp)
	sub $s1, $v0, $s0
	move $s0, $s1
	li $s1, 1
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $s0
	addi $v0, $v0, 1
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	sub $s0, $s1, $v0
	beqz $s0, Tree_Compare_L8
	li $s0, 0
	move $v1, $s0
	sw $v1, -24($fp)
	b Tree_Compare_L9
Tree_Compare_L8: 	li $s1, 1
	move $v1, $s1
	sw $v1, -24($fp)
Tree_Compare_L9: 	nop
Tree_Compare_L7: 	nop
	lw $v0, -24($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 200
	jr $ra

	.text
	.globl	Tree_Insert

Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 196
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -32($fp)
	sw $a1, -28($fp)
	li $s1, 84
	move $a0, $s1
	jal _halloc
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	li $s1, 28
	move $a0, $s1
	jal _halloc
	move $s0, $v0
	move $v1, $s0
	sw $v1, -44($fp)
	la $s0, Tree_accept
	lw $v1, -36($fp)
	sw $s0, 80($v1)
	la $s0, Tree_RecPrint
	lw $v1, -36($fp)
	sw $s0, 76($v1)
	la $s0, Tree_Print
	lw $v1, -36($fp)
	sw $s0, 72($v1)
	la $s0, Tree_Search
	lw $v1, -36($fp)
	sw $s0, 68($v1)
	la $s0, Tree_RemoveLeft
	lw $v1, -36($fp)
	sw $s0, 64($v1)
	la $s0, Tree_RemoveRight
	lw $v1, -36($fp)
	sw $s0, 60($v1)
	la $s0, Tree_Remove
	lw $v1, -36($fp)
	sw $s0, 56($v1)
	la $s0, Tree_Delete
	lw $v1, -36($fp)
	sw $s0, 52($v1)
	la $s0, Tree_Insert
	lw $v1, -36($fp)
	sw $s0, 48($v1)
	la $s0, Tree_Compare
	lw $v1, -36($fp)
	sw $s0, 44($v1)
	la $s0, Tree_SetHas_Right
	lw $v1, -36($fp)
	sw $s0, 40($v1)
	la $s0, Tree_SetHas_Left
	lw $v1, -36($fp)
	sw $s0, 36($v1)
	la $s0, Tree_GetHas_Left
	lw $v1, -36($fp)
	sw $s0, 32($v1)
	la $s0, Tree_GetHas_Right
	lw $v1, -36($fp)
	sw $s0, 28($v1)
	la $s0, Tree_SetKey
	lw $v1, -36($fp)
	sw $s0, 24($v1)
	la $s0, Tree_GetKey
	lw $v1, -36($fp)
	sw $s0, 20($v1)
	la $s0, Tree_GetLeft
	lw $v1, -36($fp)
	sw $s0, 16($v1)
	la $s0, Tree_GetRight
	lw $v1, -36($fp)
	sw $s0, 12($v1)
	la $s0, Tree_SetLeft
	lw $v1, -36($fp)
	sw $s0, 8($v1)
	la $s0, Tree_SetRight
	lw $v1, -36($fp)
	sw $s0, 4($v1)
	la $v1, Tree_Init
	sw $v1, -52($fp)
	lw $v1, -36($fp)
	lw $v0, -52($fp)
	sw $v0, 0($v1)
	li $s1, 4
	move $v1, $s1
	sw $v1, -48($fp)
Tree_Insert_L10: 	li $s1, 27
	lw $v0, -48($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $s1
	addi $v0, $v0, 1
	beqz $s0, Tree_Insert_L11
	lw $v0, -44($fp)
	lw $v1, -48($fp)
	add $s0, $v0, $v1
	li $s1, 0
	sw $s1, 0($s0)
	li $s0, 4
	lw $v0, -48($fp)
	add $v1, $v0, $s0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	b Tree_Insert_L10
Tree_Insert_L11: 	lw $v1, -44($fp)
	lw $v0, -36($fp)
	sw $v0, 0($v1)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 0($s1)
	sw $v1, -60($fp)
	move $a0, $s0
	lw $v0, -28($fp)
	move $a1, $v0
	lw $v0, -60($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -72($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	li $s1, 1
	move $v1, $s1
	sw $v1, -68($fp)
Tree_Insert_L12: 	lw $v0, -68($fp)
	beqz $v0, Tree_Insert_L13
	lw $v0, -64($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -76($fp)
	move $a0, $s1
	lw $v0, -76($fp)
	jalr $v0
	move $s0, $v0
	move $s1, $s0
	li $s0, 1
	sub $v1, $s1, $s0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $s0, $v0
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, Tree_Insert_L14
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 32($s1)
	sw $v1, -84($fp)
	move $a0, $s0
	lw $v0, -84($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Insert_L16
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 16($s1)
	sw $v1, -88($fp)
	move $a0, $s0
	lw $v0, -88($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -64($fp)
	b Tree_Insert_L17
Tree_Insert_L16: 	li $s0, 0
	move $v1, $s0
	sw $v1, -68($fp)
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 36($s1)
	sw $v1, -92($fp)
	li $s1, 1
	move $a0, $s0
	move $a1, $s1
	lw $v0, -92($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -96($fp)
	lw $v0, -96($fp)
	move $v1, $v0
	sw $v1, -72($fp)
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 8($s1)
	sw $v1, -100($fp)
	move $a0, $s0
	lw $v0, -24($fp)
	move $a1, $v0
	lw $v0, -100($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -72($fp)
Tree_Insert_L17: 	nop
	b Tree_Insert_L15
Tree_Insert_L14: 	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 28($s1)
	sw $v1, -104($fp)
	move $a0, $s0
	lw $v0, -104($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Insert_L18
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 12($s1)
	sw $v1, -108($fp)
	move $a0, $s0
	lw $v0, -108($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -64($fp)
	b Tree_Insert_L19
Tree_Insert_L18: 	li $s0, 0
	move $v1, $s0
	sw $v1, -68($fp)
	lw $v0, -64($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 40($s1)
	sw $v1, -112($fp)
	li $s1, 1
	move $a0, $s0
	move $a1, $s1
	lw $v0, -112($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -116($fp)
	lw $v0, -116($fp)
	move $v1, $v0
	sw $v1, -72($fp)
	lw $v0, -64($fp)
	move $s0, $v0
	lw $v1, 0($s0)
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	lw $v1, 4($v0)
	sw $v1, -124($fp)
	move $a0, $s0
	lw $v0, -24($fp)
	move $a1, $v0
	lw $v0, -124($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -72($fp)
Tree_Insert_L19: 	nop
Tree_Insert_L15: 	nop
	b Tree_Insert_L12
Tree_Insert_L13: 	nop
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 196
	jr $ra

	.text
	.globl	Tree_Delete

Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 208
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -52($fp)
	sw $a1, -28($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	li $v1, 1
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	li $s1, 0
	move $v1, $s1
	sw $v1, -44($fp)
	li $s1, 1
	move $v1, $s1
	sw $v1, -48($fp)
Tree_Delete_L20: 	lw $v0, -36($fp)
	beqz $v0, Tree_Delete_L21
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -60($fp)
	li $s0, 1
	lw $v0, -60($fp)
	sub $s1, $v0, $s0
	move $s0, $s1
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, Tree_Delete_L22
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 32($s1)
	sw $v1, -64($fp)
	move $a0, $s0
	lw $v0, -64($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Delete_L24
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 16($s1)
	sw $v1, -68($fp)
	move $a0, $s0
	lw $v0, -68($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -24($fp)
	b Tree_Delete_L25
Tree_Delete_L24: 	li $s0, 0
	move $v1, $s0
	sw $v1, -36($fp)
Tree_Delete_L25: 	nop
	b Tree_Delete_L23
Tree_Delete_L22: 	li $s0, 1
	lw $v0, -28($fp)
	sub $s1, $v0, $s0
	move $s0, $s1
	lw $v0, -60($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, Tree_Delete_L26
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 28($s1)
	sw $v1, -72($fp)
	move $a0, $s0
	lw $v0, -72($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Delete_L28
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $v1, 0($s0)
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $v1, 12($v0)
	sw $v1, -80($fp)
	move $a0, $s0
	lw $v0, -80($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -24($fp)
	b Tree_Delete_L29
Tree_Delete_L28: 	li $s0, 0
	move $v1, $s0
	sw $v1, -36($fp)
Tree_Delete_L29: 	nop
	b Tree_Delete_L27
Tree_Delete_L26: 	lw $v0, -48($fp)
	beqz $v0, Tree_Delete_L30
	li $s0, 0
	move $v1, $s0
	sw $v1, -92($fp)
	li $v1, 1
	sw $v1, -88($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $s0, 0($v0)
	lw $s1, 28($s0)
	lw $v0, -84($fp)
	move $a0, $v0
	jalr $s1
	move $s0, $v0
	lw $v0, -88($fp)
	sub $s1, $v0, $s0
	beqz $s1, Tree_Delete_L34
	li $v1, 1
	sw $v1, -96($fp)
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 32($s0)
	sw $v1, -100($fp)
	move $a0, $s1
	lw $v0, -100($fp)
	jalr $v0
	move $s0, $v0
	lw $v0, -96($fp)
	sub $s1, $v0, $s0
	beqz $s1, Tree_Delete_L34
	li $s0, 1
	move $v1, $s0
	sw $v1, -92($fp)
Tree_Delete_L34: 	nop
	lw $v0, -92($fp)
	beqz $v0, Tree_Delete_L32
	li $s0, 1
	move $v1, $s0
	sw $v1, -104($fp)
	b Tree_Delete_L33
Tree_Delete_L32: 	lw $v0, -52($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 56($s1)
	sw $v1, -108($fp)
	move $a0, $s0
	lw $v0, -40($fp)
	move $a1, $v0
	lw $v0, -24($fp)
	move $a2, $v0
	lw $v0, -108($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -104($fp)
Tree_Delete_L33: 	nop
	b Tree_Delete_L31
Tree_Delete_L30: 	lw $v0, -52($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 56($s1)
	sw $v1, -112($fp)
	move $a0, $s0
	lw $v0, -40($fp)
	move $a1, $v0
	lw $v0, -24($fp)
	move $a2, $v0
	lw $v0, -112($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -104($fp)
Tree_Delete_L31: 	nop
	li $s0, 1
	move $v1, $s0
	sw $v1, -44($fp)
	li $s0, 0
	move $v1, $s0
	sw $v1, -36($fp)
Tree_Delete_L27: 	nop
Tree_Delete_L23: 	nop
	li $s0, 0
	move $v1, $s0
	sw $v1, -48($fp)
	b Tree_Delete_L20
Tree_Delete_L21: 	nop
	lw $v0, -44($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 208
	jr $ra

	.text
	.globl	Tree_Remove

Tree_Remove:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 240
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	sw $a2, -20($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $v1, 0($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $v1, 32($v0)
	sw $v1, -32($fp)
	lw $v0, -44($fp)
	move $a0, $v0
	lw $v0, -32($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	beqz $v0, Tree_Remove_L35
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $s1, 0($v0)
	lw $s0, 64($s1)
	lw $v0, -40($fp)
	move $a0, $v0
	lw $v0, -24($fp)
	move $a1, $v0
	lw $v0, -20($fp)
	move $a2, $v0
	jalr $s0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -52($fp)
	b Tree_Remove_L36
Tree_Remove_L35: 	lw $v0, -20($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 28($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	beqz $s0, Tree_Remove_L37
	lw $v0, -48($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 60($s1)
	sw $v1, -60($fp)
	move $a0, $s0
	lw $v0, -24($fp)
	move $a1, $v0
	lw $v0, -20($fp)
	move $a2, $v0
	lw $v0, -60($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -52($fp)
	b Tree_Remove_L38
Tree_Remove_L37: 	lw $v0, -20($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 20($s1)
	sw $v1, -64($fp)
	move $a0, $s0
	lw $v0, -64($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -68($fp)
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 16($s0)
	sw $v1, -72($fp)
	move $a0, $s1
	lw $v0, -72($fp)
	jalr $v0
	move $s0, $v0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -76($fp)
	move $a0, $s1
	lw $v0, -76($fp)
	jalr $v0
	move $s0, $v0
	move $s1, $s0
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	lw $s0, 0($v0)
	lw $v1, 44($s0)
	sw $v1, -84($fp)
	lw $v0, -80($fp)
	move $a0, $v0
	lw $v0, -68($fp)
	move $a1, $v0
	move $a2, $s1
	lw $v0, -84($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -88($fp)
	lw $v0, -88($fp)
	beqz $v0, Tree_Remove_L39
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	lw $s0, 0($v0)
	lw $s1, 8($s0)
	lw $v0, -48($fp)
	lw $v1, 24($v0)
	sw $v1, -96($fp)
	lw $v0, -92($fp)
	move $a0, $v0
	lw $v0, -96($fp)
	move $a1, $v0
	jalr $s1
	move $s0, $v0
	move $v1, $s0
	sw $v1, -52($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -104($fp)
	lw $v0, -104($fp)
	lw $v1, 0($v0)
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	lw $s1, 36($v0)
	li $s0, 0
	lw $v0, -104($fp)
	move $a0, $v0
	move $a1, $s0
	jalr $s1
	move $v1, $v0
	sw $v1, -108($fp)
	lw $v0, -108($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	b Tree_Remove_L40
Tree_Remove_L39: 	lw $v0, -24($fp)
	move $s0, $v0
	lw $v1, 0($s0)
	sw $v1, -112($fp)
	lw $v0, -112($fp)
	lw $s1, 4($v0)
	lw $v0, -48($fp)
	lw $v1, 24($v0)
	sw $v1, -116($fp)
	move $a0, $s0
	lw $v0, -116($fp)
	move $a1, $v0
	jalr $s1
	move $v1, $v0
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 40($s1)
	sw $v1, -124($fp)
	li $v1, 0
	sw $v1, -128($fp)
	move $a0, $s0
	lw $v0, -128($fp)
	move $a1, $v0
	lw $v0, -124($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -52($fp)
Tree_Remove_L40: 	nop
Tree_Remove_L38: 	nop
Tree_Remove_L36: 	nop
	li $v1, 1
	sw $v1, -136($fp)
	lw $v0, -136($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 240
	jr $ra

	.text
	.globl	Tree_RemoveRight

Tree_RemoveRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 240
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	sw $a2, -20($fp)
Tree_RemoveRight_L41: 	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $v1, 0($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $v1, 28($v0)
	sw $v1, -32($fp)
	lw $v0, -44($fp)
	move $a0, $v0
	lw $v0, -32($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	beqz $v0, Tree_RemoveRight_L42
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $s1, 0($v0)
	lw $v1, 24($s1)
	sw $v1, -52($fp)
	lw $v0, -20($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 12($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -60($fp)
	move $a0, $s1
	lw $v0, -60($fp)
	jalr $v0
	move $s0, $v0
	lw $v0, -40($fp)
	move $a0, $v0
	move $a1, $s0
	lw $v0, -52($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -64($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -20($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 12($s0)
	sw $v1, -68($fp)
	move $a0, $s1
	lw $v0, -68($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -20($fp)
	b Tree_RemoveRight_L41
Tree_RemoveRight_L42: 	nop
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 4($s1)
	sw $v1, -72($fp)
	lw $v0, -48($fp)
	lw $s1, 24($v0)
	move $a0, $s0
	move $a1, $s1
	lw $v0, -72($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 40($s1)
	sw $v1, -80($fp)
	li $s1, 0
	move $a0, $s0
	move $a1, $s1
	lw $v0, -80($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 240
	jr $ra

	.text
	.globl	Tree_RemoveLeft

Tree_RemoveLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 240
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	sw $a2, -20($fp)
Tree_RemoveLeft_L43: 	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $v1, 0($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $v1, 32($v0)
	sw $v1, -32($fp)
	lw $v0, -44($fp)
	move $a0, $v0
	lw $v0, -32($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	beqz $v0, Tree_RemoveLeft_L44
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $s1, 0($v0)
	lw $v1, 24($s1)
	sw $v1, -52($fp)
	lw $v0, -20($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 16($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -60($fp)
	move $a0, $s1
	lw $v0, -60($fp)
	jalr $v0
	move $s0, $v0
	lw $v0, -40($fp)
	move $a0, $v0
	move $a1, $s0
	lw $v0, -52($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -64($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -20($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 16($s0)
	sw $v1, -68($fp)
	move $a0, $s1
	lw $v0, -68($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -20($fp)
	b Tree_RemoveLeft_L43
Tree_RemoveLeft_L44: 	nop
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 8($s1)
	sw $v1, -72($fp)
	lw $v0, -48($fp)
	lw $s1, 24($v0)
	move $a0, $s0
	move $a1, $s1
	lw $v0, -72($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 36($s1)
	sw $v1, -80($fp)
	li $s1, 0
	move $a0, $s0
	move $a1, $s1
	lw $v0, -80($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 240
	jr $ra

	.text
	.globl	Tree_Search

Tree_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 212
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -52($fp)
	sw $a1, -28($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	li $v1, 1
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	li $v1, 0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -40($fp)
Tree_Search_L45: 	lw $v0, -32($fp)
	beqz $v0, Tree_Search_L46
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $s1, 0($v0)
	lw $s0, 20($s1)
	lw $v0, -44($fp)
	move $a0, $v0
	jalr $s0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -56($fp)
	li $s1, 1
	lw $v0, -56($fp)
	sub $s0, $v0, $s1
	move $s1, $s0
	lw $v0, -28($fp)
	sub $v0, $v0, 1
	slt $s0, $v0, $s1
	addi $v0, $v0, 1
	beqz $s0, Tree_Search_L47
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 32($s1)
	sw $v1, -60($fp)
	move $a0, $s0
	lw $v0, -60($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Search_L49
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 16($s1)
	sw $v1, -64($fp)
	move $a0, $s0
	lw $v0, -64($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -24($fp)
	b Tree_Search_L50
Tree_Search_L49: 	li $s0, 0
	move $v1, $s0
	sw $v1, -32($fp)
Tree_Search_L50: 	nop
	b Tree_Search_L48
Tree_Search_L47: 	li $s0, 1
	lw $v0, -28($fp)
	sub $s1, $v0, $s0
	move $s0, $s1
	lw $v0, -56($fp)
	sub $v0, $v0, 1
	slt $s1, $v0, $s0
	addi $v0, $v0, 1
	beqz $s1, Tree_Search_L51
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 28($s1)
	sw $v1, -68($fp)
	move $a0, $s0
	lw $v0, -68($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_Search_L53
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 12($s1)
	sw $v1, -72($fp)
	move $a0, $s0
	lw $v0, -72($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -24($fp)
	b Tree_Search_L54
Tree_Search_L53: 	li $v1, 0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	move $v1, $v0
	sw $v1, -32($fp)
Tree_Search_L54: 	nop
	b Tree_Search_L52
Tree_Search_L51: 	li $v1, 1
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	li $s0, 0
	move $v1, $s0
	sw $v1, -32($fp)
Tree_Search_L52: 	nop
Tree_Search_L48: 	nop
	b Tree_Search_L45
Tree_Search_L46: 	nop
	lw $v0, -40($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 212
	jr $ra

	.text
	.globl	Tree_Print

Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 212
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 0($v0)
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $v1, 76($v0)
	sw $v1, -28($fp)
	lw $v0, -40($fp)
	move $a0, $v0
	lw $v0, -20($fp)
	move $a1, $v0
	lw $v0, -28($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	li $v1, 1
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 212
	jr $ra

	.text
	.globl	Tree_RecPrint

Tree_RecPrint:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 228
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -44($fp)
	sw $a1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $v1, 0($v0)
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 32($v0)
	sw $v1, -28($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	beqz $v0, Tree_RecPrint_L55
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	lw $v1, 0($v0)
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 76($v0)
	sw $v1, -52($fp)
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 16($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	lw $v0, -48($fp)
	move $a0, $v0
	move $a1, $s0
	lw $v0, -52($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -60($fp)
	b Tree_RecPrint_L56
Tree_RecPrint_L55: 	li $s1, 1
	move $v1, $s1
	sw $v1, -60($fp)
Tree_RecPrint_L56: 	nop
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 20($s0)
	sw $v1, -64($fp)
	move $a0, $s1
	lw $v0, -64($fp)
	jalr $v0
	move $s0, $v0
	move $a0, $s0
	jal _print
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 28($s1)
	sw $v1, -68($fp)
	move $a0, $s0
	lw $v0, -68($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Tree_RecPrint_L57
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $s1, 0($v0)
	lw $v1, 76($s1)
	sw $v1, -72($fp)
	lw $v0, -24($fp)
	move $s1, $v0
	lw $s0, 0($s1)
	lw $v1, 12($s0)
	sw $v1, -80($fp)
	move $a0, $s1
	lw $v0, -80($fp)
	jalr $v0
	move $s0, $v0
	lw $v0, -76($fp)
	move $a0, $v0
	move $a1, $s0
	lw $v0, -72($fp)
	jalr $v0
	move $s1, $v0
	move $v1, $s1
	sw $v1, -60($fp)
	b Tree_RecPrint_L58
Tree_RecPrint_L57: 	li $s0, 1
	move $v1, $s0
	sw $v1, -60($fp)
Tree_RecPrint_L58: 	nop
	li $s0, 1
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 228
	jr $ra

	.text
	.globl	Tree_accept

Tree_accept:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 228
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	li $v1, 333
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	jal _print
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $v1, 0($v0)
	sw $v1, -32($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -48($fp)
	move $a1, $v0
	lw $v0, -32($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	li $v1, 0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 228
	jr $ra

	.text
	.globl	Visitor_visit

Visitor_visit:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 220
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $v1, 0($v0)
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 28($v0)
	sw $v1, -28($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	beqz $v0, Visitor_visit_L59
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $v1, 12($v0)
	sw $v1, -44($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -44($fp)
	jalr $v0
	move $s0, $v0
	lw $v1, -48($fp)
	sw $s0, 8($v1)
	lw $v0, -48($fp)
	lw $s0, 8($v0)
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 80($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -48($fp)
	move $a1, $v0
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -60($fp)
	b Visitor_visit_L60
Visitor_visit_L59: 	li $s0, 0
	move $v1, $s0
	sw $v1, -60($fp)
Visitor_visit_L60: 	nop
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 32($s1)
	sw $v1, -64($fp)
	move $a0, $s0
	lw $v0, -64($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, Visitor_visit_L61
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 16($s1)
	sw $v1, -68($fp)
	move $a0, $s0
	lw $v0, -68($fp)
	jalr $v0
	move $s1, $v0
	lw $v1, -48($fp)
	sw $s1, 4($v1)
	lw $v0, -48($fp)
	lw $s0, 4($v0)
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 80($s0)
	sw $v1, -72($fp)
	move $a0, $s1
	lw $v0, -48($fp)
	move $a1, $v0
	lw $v0, -72($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -60($fp)
	b Visitor_visit_L62
Visitor_visit_L61: 	li $s0, 0
	move $v1, $s0
	sw $v1, -60($fp)
Visitor_visit_L62: 	nop
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 220
	jr $ra

	.text
	.globl	MyVisitor_visit

MyVisitor_visit:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 220
	sw $s0, -12($fp)
	sw $s1, -16($fp)
	sw $a0, -48($fp)
	sw $a1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	lw $v1, 0($v0)
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 28($v0)
	sw $v1, -28($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	beqz $v0, MyVisitor_visit_L63
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $v1, 12($v0)
	sw $v1, -44($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -44($fp)
	jalr $v0
	move $s0, $v0
	lw $v1, -48($fp)
	sw $s0, 8($v1)
	lw $v0, -48($fp)
	lw $s0, 8($v0)
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 80($s0)
	sw $v1, -56($fp)
	move $a0, $s1
	lw $v0, -48($fp)
	move $a1, $v0
	lw $v0, -56($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -60($fp)
	b MyVisitor_visit_L64
MyVisitor_visit_L63: 	li $s0, 0
	move $v1, $s0
	sw $v1, -60($fp)
MyVisitor_visit_L64: 	nop
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 20($s1)
	sw $v1, -64($fp)
	move $a0, $s0
	lw $v0, -64($fp)
	jalr $v0
	move $s1, $v0
	move $a0, $s1
	jal _print
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 32($s1)
	sw $v1, -68($fp)
	move $a0, $s0
	lw $v0, -68($fp)
	jalr $v0
	move $s1, $v0
	beqz $s1, MyVisitor_visit_L65
	lw $v0, -24($fp)
	move $s0, $v0
	lw $s1, 0($s0)
	lw $v1, 16($s1)
	sw $v1, -72($fp)
	move $a0, $s0
	lw $v0, -72($fp)
	jalr $v0
	move $s1, $v0
	lw $v1, -48($fp)
	sw $s1, 4($v1)
	lw $v0, -48($fp)
	lw $s0, 4($v0)
	move $s1, $s0
	lw $s0, 0($s1)
	lw $v1, 80($s0)
	sw $v1, -76($fp)
	move $a0, $s1
	lw $v0, -48($fp)
	move $a1, $v0
	lw $v0, -76($fp)
	jalr $v0
	move $s0, $v0
	move $v1, $s0
	sw $v1, -60($fp)
	b MyVisitor_visit_L66
MyVisitor_visit_L65: 	li $s0, 0
	move $v1, $s0
	sw $v1, -60($fp)
MyVisitor_visit_L66: 	nop
	li $s0, 0
	move $v0, $s0
	lw $s0, -12($fp)
	lw $s1, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 220
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
