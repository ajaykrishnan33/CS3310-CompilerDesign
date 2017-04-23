	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	li $t0, 4
	move $a0, $t0
	jal _halloc
	move $t1, $v0
	move $t0, $t1
	li $t1, 4
	move $a0, $t1
	jal _halloc
	move $t2, $v0
	move $t1, $t2
	la $t2, BT_Start
	sw $t2, 0($t0)
	sw $t0, 0($t1)
	move $t0, $t1
	lw $t1, 0($t0)
	lw $t2, 0($t1)
	sw $t0, -12($fp)
	sw $t1, -16($fp)
	sw $t2, -20($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -12($fp)
	lw $t1, -16($fp)
	lw $t2, -20($fp)
	move $t1, $v0
	move $a0, $t1
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	BT_Start

BT_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 36
	move $t0, $a0
	li $t0, 80
	move $a0, $t0
	jal _halloc
	move $t1, $v0
	move $t0, $t1
	li $t1, 28
	move $a0, $t1
	jal _halloc
	move $t2, $v0
	move $v1, $t2
	sw $v1, -12($fp)
	la $t2, Tree_RecPrint
	sw $t2, 76($t0)
	la $t2, Tree_Print
	sw $t2, 72($t0)
	la $t2, Tree_Search
	sw $t2, 68($t0)
	la $t2, Tree_RemoveLeft
	sw $t2, 64($t0)
	la $t2, Tree_RemoveRight
	sw $t2, 60($t0)
	la $t2, Tree_Remove
	sw $t2, 56($t0)
	la $t2, Tree_Delete
	sw $t2, 52($t0)
	la $t2, Tree_Insert
	sw $t2, 48($t0)
	la $t2, Tree_Compare
	sw $t2, 44($t0)
	la $t2, Tree_SetHas_Right
	sw $t2, 40($t0)
	la $t2, Tree_SetHas_Left
	sw $t2, 36($t0)
	la $t2, Tree_GetHas_Left
	sw $t2, 32($t0)
	la $t2, Tree_GetHas_Right
	sw $t2, 28($t0)
	la $t2, Tree_SetKey
	sw $t2, 24($t0)
	la $t2, Tree_GetKey
	sw $t2, 20($t0)
	la $t2, Tree_GetLeft
	sw $t2, 16($t0)
	la $t2, Tree_GetRight
	sw $t2, 12($t0)
	la $t2, Tree_SetLeft
	sw $t2, 8($t0)
	la $t2, Tree_SetRight
	sw $t2, 4($t0)
	la $t2, Tree_Init
	sw $t2, 0($t0)
	li $t2, 4
	move $t3, $t2
BT_Start_L2: 	li $t2, 27
	sub $t3, $t3, 1
	slt $t1, $t3, $t2
	addi $t3, $t3, 1
	beqz $t1, BT_Start_L3
	lw $v0, -12($fp)
	add $t1, $v0, $t3
	li $t2, 0
	sw $t2, 0($t1)
	li $t1, 4
	add $t2, $t3, $t1
	move $t3, $t2
	b BT_Start_L2
BT_Start_L3: 	lw $v1, -12($fp)
	sw $t0, 0($v1)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 0($t2)
	li $t2, 16
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t1
	move $a1, $t2
	jalr $t3
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 72($t2)
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -20($fp)
	li $t0, 100000000
	move $a0, $t0
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 48($t2)
	li $t2, 8
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t2
	jalr $t3
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 72($t1)
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 24
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 4
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 12
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 20
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 28
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 48($t1)
	li $t1, 14
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 72($t1)
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 24
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 12
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 16
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 50
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 12
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 52($t1)
	li $t1, 12
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 72($t1)
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -20($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 68($t1)
	li $t1, 12
	sw $t0, -24($fp)
	sw $t1, -28($fp)
	sw $t2, -32($fp)
	sw $t3, -36($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -24($fp)
	lw $t1, -28($fp)
	lw $t2, -32($fp)
	lw $t3, -36($fp)
	move $t3, $v0
	move $a0, $t3
	jal _print
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 36
	jr $ra

	.text
	.globl	Tree_Init

Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 12($t0)
	li $t1, 0
	sw $t1, 16($t0)
	li $t2, 0
	sw $t2, 20($t0)
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_SetRight

Tree_SetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 8($t0)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_SetLeft

Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 4($t0)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_GetRight

Tree_GetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	lw $v1, 8($t0)
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_GetLeft

Tree_GetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	lw $v1, 4($t0)
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_GetKey

Tree_GetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	lw $v1, 12($t0)
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_SetKey

Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 12($t0)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_GetHas_Right

Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	lw $v1, 20($t0)
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_GetHas_Left

Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	lw $v1, 16($t0)
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_SetHas_Left

Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 16($t0)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_SetHas_Right

Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 20
	move $t0, $a0
	move $t1, $a1
	sw $t1, 20($t0)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 20
	jr $ra

	.text
	.globl	Tree_Compare

Tree_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 24
	move $t0, $a0
	move $t1, $a1
	sw $a2, -12($fp)
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	li $t0, 1
	lw $v0, -12($fp)
	add $t2, $v0, $t0
	move $v1, $t2
	sw $v1, -16($fp)
	li $t2, 1
	lw $v0, -12($fp)
	sub $t0, $v0, $t2
	move $t2, $t0
	sub $t1, $t1, 1
	slt $t0, $t1, $t2
	addi $t1, $t1, 1
	beqz $t0, Tree_Compare_L4
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Tree_Compare_L5
Tree_Compare_L4: 	li $t0, 1
	lw $v0, -16($fp)
	sub $t2, $v0, $t0
	move $t0, $t2
	li $t2, 1
	sub $t1, $t1, 1
	slt $t3, $t1, $t0
	addi $t1, $t1, 1
	sub $t0, $t2, $t3
	beqz $t0, Tree_Compare_L6
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Tree_Compare_L7
Tree_Compare_L6: 	li $t1, 1
	move $v1, $t1
	sw $v1, -20($fp)
Tree_Compare_L7: 	nop
Tree_Compare_L5: 	nop
	lw $v0, -20($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	Tree_Insert

Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 68
	sw $a0, -24($fp)
	sw $a1, -20($fp)
	li $t2, 80
	move $a0, $t2
	jal _halloc
	move $t3, $v0
	move $v1, $t3
	sw $v1, -32($fp)
	li $t1, 28
	move $a0, $t1
	jal _halloc
	move $t0, $v0
	move $v1, $t0
	sw $v1, -28($fp)
	la $t0, Tree_RecPrint
	lw $v1, -32($fp)
	sw $t0, 76($v1)
	la $t0, Tree_Print
	lw $v1, -32($fp)
	sw $t0, 72($v1)
	la $t0, Tree_Search
	lw $v1, -32($fp)
	sw $t0, 68($v1)
	la $t0, Tree_RemoveLeft
	lw $v1, -32($fp)
	sw $t0, 64($v1)
	la $t0, Tree_RemoveRight
	lw $v1, -32($fp)
	sw $t0, 60($v1)
	la $t0, Tree_Remove
	lw $v1, -32($fp)
	sw $t0, 56($v1)
	la $t0, Tree_Delete
	lw $v1, -32($fp)
	sw $t0, 52($v1)
	la $t0, Tree_Insert
	lw $v1, -32($fp)
	sw $t0, 48($v1)
	la $t0, Tree_Compare
	lw $v1, -32($fp)
	sw $t0, 44($v1)
	la $t0, Tree_SetHas_Right
	lw $v1, -32($fp)
	sw $t0, 40($v1)
	la $t0, Tree_SetHas_Left
	lw $v1, -32($fp)
	sw $t0, 36($v1)
	la $t0, Tree_GetHas_Left
	lw $v1, -32($fp)
	sw $t0, 32($v1)
	la $t0, Tree_GetHas_Right
	lw $v1, -32($fp)
	sw $t0, 28($v1)
	la $t0, Tree_SetKey
	lw $v1, -32($fp)
	sw $t0, 24($v1)
	la $t0, Tree_GetKey
	lw $v1, -32($fp)
	sw $t0, 20($v1)
	la $t0, Tree_GetLeft
	lw $v1, -32($fp)
	sw $t0, 16($v1)
	la $t0, Tree_GetRight
	lw $v1, -32($fp)
	sw $t0, 12($v1)
	la $t0, Tree_SetLeft
	lw $v1, -32($fp)
	sw $t0, 8($v1)
	la $t0, Tree_SetRight
	lw $v1, -32($fp)
	sw $t0, 4($v1)
	la $t0, Tree_Init
	lw $v1, -32($fp)
	sw $t0, 0($v1)
	li $t1, 4
	move $v1, $t1
	sw $v1, -36($fp)
Tree_Insert_L8: 	li $t1, 27
	lw $v0, -36($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t1
	addi $v0, $v0, 1
	beqz $t2, Tree_Insert_L9
	lw $v0, -28($fp)
	lw $v1, -36($fp)
	add $t1, $v0, $v1
	li $t2, 0
	sw $t2, 0($t1)
	li $t1, 4
	lw $v0, -36($fp)
	add $v1, $v0, $t1
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	b Tree_Insert_L8
Tree_Insert_L9: 	lw $v1, -28($fp)
	lw $v0, -32($fp)
	sw $v0, 0($v1)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t3, 0($t1)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	lw $v0, -20($fp)
	move $a1, $v0
	jalr $t3
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -52($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	li $t3, 1
	move $v1, $t3
	sw $v1, -44($fp)
Tree_Insert_L10: 	lw $v0, -44($fp)
	beqz $v0, Tree_Insert_L11
	lw $v0, -48($fp)
	move $t3, $v0
	lw $t2, 0($t3)
	lw $t1, 20($t2)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t3
	jalr $t1
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t2, $v0
	move $t1, $t2
	li $t2, 1
	sub $t3, $t1, $t2
	move $t1, $t3
	lw $v0, -20($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t1
	addi $v0, $v0, 1
	beqz $t2, Tree_Insert_L12
	lw $v0, -48($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 32($t2)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t2, $v0
	beqz $t2, Tree_Insert_L14
	lw $v0, -48($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 16($t2)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -48($fp)
	b Tree_Insert_L15
Tree_Insert_L14: 	li $t1, 0
	move $v1, $t1
	sw $v1, -44($fp)
	lw $v0, -48($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 36($t2)
	li $t2, 1
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t1
	move $a1, $t2
	jalr $t3
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -52($fp)
	lw $v0, -48($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	lw $v0, -16($fp)
	move $a1, $v0
	jalr $t2
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -52($fp)
Tree_Insert_L15: 	nop
	b Tree_Insert_L13
Tree_Insert_L12: 	lw $v0, -48($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 28($t1)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t1, $v0
	beqz $t1, Tree_Insert_L16
	lw $v0, -48($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 12($t1)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -48($fp)
	b Tree_Insert_L17
Tree_Insert_L16: 	li $t0, 0
	move $v1, $t0
	sw $v1, -44($fp)
	lw $v0, -48($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 40($t1)
	li $t1, 1
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -52($fp)
	lw $v0, -48($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 4($t1)
	sw $t0, -56($fp)
	sw $t1, -60($fp)
	sw $t2, -64($fp)
	sw $t3, -68($fp)
	move $a0, $t0
	lw $v0, -16($fp)
	move $a1, $v0
	jalr $t2
	lw $t0, -56($fp)
	lw $t1, -60($fp)
	lw $t2, -64($fp)
	lw $t3, -68($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -52($fp)
Tree_Insert_L17: 	nop
Tree_Insert_L13: 	nop
	b Tree_Insert_L10
Tree_Insert_L11: 	nop
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 68
	jr $ra

	.text
	.globl	Tree_Delete

Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 80
	sw $a0, -44($fp)
	sw $a1, -20($fp)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	li $v1, 1
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	li $t1, 0
	move $v1, $t1
	sw $v1, -28($fp)
	li $t1, 1
	move $v1, $t1
	sw $v1, -32($fp)
Tree_Delete_L18: 	lw $v0, -24($fp)
	beqz $v0, Tree_Delete_L19
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t3, 0($t1)
	lw $t2, 20($t3)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t1
	jalr $t2
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t3, $v0
	move $t1, $t3
	li $t2, 1
	sub $t3, $t1, $t2
	move $t2, $t3
	lw $v0, -20($fp)
	sub $v0, $v0, 1
	slt $t3, $v0, $t2
	addi $v0, $v0, 1
	beqz $t3, Tree_Delete_L20
	lw $v0, -16($fp)
	move $t2, $v0
	lw $t3, 0($t2)
	lw $t0, 32($t3)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t2
	jalr $t0
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t3, $v0
	beqz $t3, Tree_Delete_L22
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 16($t2)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -16($fp)
	b Tree_Delete_L23
Tree_Delete_L22: 	li $t0, 0
	move $v1, $t0
	sw $v1, -24($fp)
Tree_Delete_L23: 	nop
	b Tree_Delete_L21
Tree_Delete_L20: 	li $t0, 1
	lw $v0, -20($fp)
	sub $t2, $v0, $t0
	move $t0, $t2
	sub $t1, $t1, 1
	slt $t2, $t1, $t0
	addi $t1, $t1, 1
	beqz $t2, Tree_Delete_L24
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 28($t1)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t1, $v0
	beqz $t1, Tree_Delete_L26
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	lw $v1, 0($v0)
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	lw $t2, 12($v0)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	lw $v0, -48($fp)
	move $a0, $v0
	jalr $t2
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -16($fp)
	b Tree_Delete_L27
Tree_Delete_L26: 	li $t2, 0
	move $v1, $t2
	sw $v1, -24($fp)
Tree_Delete_L27: 	nop
	b Tree_Delete_L25
Tree_Delete_L24: 	lw $v0, -32($fp)
	beqz $v0, Tree_Delete_L28
	li $v1, 0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	li $v1, 1
	sw $v1, -52($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t1, 28($t2)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t0
	jalr $t1
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t2, $v0
	lw $v0, -52($fp)
	sub $t0, $v0, $t2
	beqz $t0, Tree_Delete_L32
	li $t0, 1
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 32($t2)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t2, $v0
	sub $t1, $t0, $t2
	beqz $t1, Tree_Delete_L32
	li $t0, 1
	move $v1, $t0
	sw $v1, -64($fp)
Tree_Delete_L32: 	nop
	lw $v0, -64($fp)
	beqz $v0, Tree_Delete_L30
	li $t0, 1
	move $t1, $t0
	b Tree_Delete_L31
Tree_Delete_L30: 	lw $v0, -44($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 56($t2)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t0
	lw $v0, -40($fp)
	move $a1, $v0
	lw $v0, -16($fp)
	move $a2, $v0
	jalr $t3
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t2, $v0
	move $t1, $t2
Tree_Delete_L31: 	nop
	b Tree_Delete_L29
Tree_Delete_L28: 	lw $v0, -44($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 56($t2)
	sw $t0, -68($fp)
	sw $t1, -72($fp)
	sw $t2, -76($fp)
	sw $t3, -80($fp)
	move $a0, $t0
	lw $v0, -40($fp)
	move $a1, $v0
	lw $v0, -16($fp)
	move $a2, $v0
	jalr $t3
	lw $t0, -68($fp)
	lw $t1, -72($fp)
	lw $t2, -76($fp)
	lw $t3, -80($fp)
	move $t2, $v0
	move $t1, $t2
Tree_Delete_L29: 	nop
	li $t0, 1
	move $v1, $t0
	sw $v1, -28($fp)
	li $t0, 0
	move $v1, $t0
	sw $v1, -24($fp)
Tree_Delete_L25: 	nop
Tree_Delete_L21: 	nop
	li $t0, 0
	move $v1, $t0
	sw $v1, -32($fp)
	b Tree_Delete_L18
Tree_Delete_L19: 	nop
	lw $v0, -28($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 80
	jr $ra

	.text
	.globl	Tree_Remove

Tree_Remove:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 96
	sw $a0, -40($fp)
	sw $a1, -16($fp)
	sw $a2, -12($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	lw $v1, 32($v0)
	sw $v1, -28($fp)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	beqz $v0, Tree_Remove_L33
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t1, 0($v0)
	lw $t2, 64($t1)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	lw $v0, -24($fp)
	move $a0, $v0
	lw $v0, -16($fp)
	move $a1, $v0
	lw $v0, -12($fp)
	move $a2, $v0
	jalr $t2
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -44($fp)
	b Tree_Remove_L34
Tree_Remove_L33: 	lw $v0, -12($fp)
	move $t1, $v0
	lw $t3, 0($t1)
	lw $t0, 28($t3)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t1
	jalr $t0
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t3, $v0
	beqz $t3, Tree_Remove_L35
	lw $v0, -40($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t3, 60($t1)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t0
	lw $v0, -16($fp)
	move $a1, $v0
	lw $v0, -12($fp)
	move $a2, $v0
	jalr $t3
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -44($fp)
	b Tree_Remove_L36
Tree_Remove_L35: 	lw $v0, -12($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t3, 20($t1)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t1, $v0
	move $t0, $t1
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t3, 0($t1)
	lw $t2, 16($t3)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t1
	jalr $t2
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t3, $v0
	move $t1, $t3
	lw $t2, 0($t1)
	lw $t3, 20($t2)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t2, $v0
	move $t1, $t2
	lw $v0, -40($fp)
	move $t2, $v0
	lw $t3, 0($t2)
	lw $v1, 44($t3)
	sw $v1, -48($fp)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t2
	move $a1, $t0
	move $a2, $t1
	lw $v0, -48($fp)
	jalr $v0
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $v1, $v0
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	beqz $v0, Tree_Remove_L37
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 8($t1)
	lw $v0, -40($fp)
	lw $v1, 24($v0)
	sw $v1, -64($fp)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t0
	lw $v0, -64($fp)
	move $a1, $v0
	jalr $t2
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	lw $t2, 0($v0)
	lw $t0, 36($t2)
	li $t2, 0
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	lw $v0, -56($fp)
	move $a0, $v0
	move $a1, $t2
	jalr $t0
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -44($fp)
	b Tree_Remove_L38
Tree_Remove_L37: 	lw $v0, -16($fp)
	move $t0, $v0
	lw $v1, 0($t0)
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t3, 4($v0)
	lw $v0, -40($fp)
	lw $t1, 24($v0)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t3
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -44($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 40($t1)
	li $v1, 0
	sw $v1, -72($fp)
	sw $t0, -84($fp)
	sw $t1, -88($fp)
	sw $t2, -92($fp)
	sw $t3, -96($fp)
	move $a0, $t0
	lw $v0, -72($fp)
	move $a1, $v0
	jalr $t2
	lw $t0, -84($fp)
	lw $t1, -88($fp)
	lw $t2, -92($fp)
	lw $t3, -96($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -44($fp)
Tree_Remove_L38: 	nop
Tree_Remove_L36: 	nop
Tree_Remove_L34: 	nop
	li $v1, 1
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 96
	jr $ra

	.text
	.globl	Tree_RemoveRight

Tree_RemoveRight:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 92
	sw $a0, -40($fp)
	sw $a1, -16($fp)
	sw $a2, -12($fp)
Tree_RemoveRight_L39: 	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	lw $v1, 28($v0)
	sw $v1, -28($fp)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	beqz $v0, Tree_RemoveRight_L40
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t1, 0($v0)
	lw $t2, 24($t1)
	lw $v0, -12($fp)
	move $t1, $v0
	lw $t3, 0($t1)
	lw $t0, 12($t3)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t1
	jalr $t0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t3, $v0
	move $t0, $t3
	lw $t1, 0($t0)
	lw $t3, 20($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -24($fp)
	move $a0, $v0
	move $a1, $t1
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -44($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 12($t2)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -12($fp)
	b Tree_RemoveRight_L39
Tree_RemoveRight_L40: 	nop
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 4($t2)
	lw $v0, -40($fp)
	lw $t2, 24($v0)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	move $a1, $t2
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -44($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 40($t1)
	li $t1, 0
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -44($fp)
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 92
	jr $ra

	.text
	.globl	Tree_RemoveLeft

Tree_RemoveLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 92
	sw $a0, -40($fp)
	sw $a1, -16($fp)
	sw $a2, -12($fp)
Tree_RemoveLeft_L41: 	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 0($v0)
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	lw $v1, 32($v0)
	sw $v1, -28($fp)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -36($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	beqz $v0, Tree_RemoveLeft_L42
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t1, 0($v0)
	lw $t2, 24($t1)
	lw $v0, -12($fp)
	move $t1, $v0
	lw $t3, 0($t1)
	lw $t0, 16($t3)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t1
	jalr $t0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t3, $v0
	move $t0, $t3
	lw $t1, 0($t0)
	lw $t3, 20($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -24($fp)
	move $a0, $v0
	move $a1, $t1
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -44($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -12($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 16($t2)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -12($fp)
	b Tree_RemoveLeft_L41
Tree_RemoveLeft_L42: 	nop
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t2, 0($t0)
	lw $t3, 8($t2)
	lw $v0, -40($fp)
	lw $t2, 24($v0)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	move $a1, $t2
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -44($fp)
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 36($t1)
	li $t1, 0
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	move $a1, $t1
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t3, $v0
	move $v1, $t3
	sw $v1, -44($fp)
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 92
	jr $ra

	.text
	.globl	Tree_Search

Tree_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 92
	sw $a0, -44($fp)
	sw $a1, -20($fp)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	li $v1, 1
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	li $v1, 0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -32($fp)
Tree_Search_L43: 	lw $v0, -36($fp)
	beqz $v0, Tree_Search_L44
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $t1, 0($v0)
	lw $t3, 20($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -28($fp)
	move $a0, $v0
	jalr $t3
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	move $t3, $t1
	li $t1, 1
	sub $t2, $t3, $t1
	move $t1, $t2
	lw $v0, -20($fp)
	sub $v0, $v0, 1
	slt $t2, $v0, $t1
	addi $v0, $v0, 1
	beqz $t2, Tree_Search_L45
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t0, 32($t2)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t1
	jalr $t0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t2, $v0
	beqz $t2, Tree_Search_L47
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 16($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -16($fp)
	b Tree_Search_L48
Tree_Search_L47: 	li $t0, 0
	move $v1, $t0
	sw $v1, -36($fp)
Tree_Search_L48: 	nop
	b Tree_Search_L46
Tree_Search_L45: 	li $t0, 1
	lw $v0, -20($fp)
	sub $t1, $v0, $t0
	move $t0, $t1
	sub $t3, $t3, 1
	slt $t1, $t3, $t0
	addi $t3, $t3, 1
	beqz $t1, Tree_Search_L49
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 28($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $t1, $v0
	beqz $t1, Tree_Search_L51
	lw $v0, -16($fp)
	move $t0, $v0
	lw $t1, 0($t0)
	lw $t2, 12($t1)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	move $a0, $t0
	jalr $t2
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	b Tree_Search_L52
Tree_Search_L51: 	li $v1, 0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -36($fp)
Tree_Search_L52: 	nop
	b Tree_Search_L50
Tree_Search_L49: 	li $t2, 1
	move $v1, $t2
	sw $v1, -32($fp)
	li $t2, 0
	move $v1, $t2
	sw $v1, -36($fp)
Tree_Search_L50: 	nop
Tree_Search_L46: 	nop
	b Tree_Search_L43
Tree_Search_L44: 	nop
	lw $v0, -32($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 92
	jr $ra

	.text
	.globl	Tree_Print

Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 92
	sw $a0, -44($fp)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -12($fp)
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 0($v0)
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	lw $v1, 76($v0)
	sw $v1, -24($fp)
	sw $t0, -80($fp)
	sw $t1, -84($fp)
	sw $t2, -88($fp)
	sw $t3, -92($fp)
	lw $v0, -40($fp)
	move $a0, $v0
	lw $v0, -12($fp)
	move $a1, $v0
	lw $v0, -24($fp)
	jalr $v0
	lw $t0, -80($fp)
	lw $t1, -84($fp)
	lw $t2, -88($fp)
	lw $t3, -92($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	li $t1, 1
	move $v0, $t1
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 92
	jr $ra

	.text
	.globl	Tree_RecPrint

Tree_RecPrint:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 100
	sw $a0, -36($fp)
	sw $a1, -16($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	lw $v1, 0($v0)
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	lw $v1, 32($v0)
	sw $v1, -28($fp)
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	lw $v0, -12($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	beqz $v0, Tree_RecPrint_L53
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $v1, 0($v0)
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t2, 76($v0)
	lw $v0, -16($fp)
	move $t3, $v0
	lw $t0, 0($t3)
	lw $t1, 16($t0)
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	move $a0, $t3
	jalr $t1
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t0, $v0
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	lw $v0, -40($fp)
	move $a0, $v0
	move $a1, $t0
	jalr $t2
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t1, $v0
	move $v1, $t1
	sw $v1, -44($fp)
	b Tree_RecPrint_L54
Tree_RecPrint_L53: 	li $t1, 1
	move $v1, $t1
	sw $v1, -44($fp)
Tree_RecPrint_L54: 	nop
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 20($t2)
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t2, $v0
	move $a0, $t2
	jal _print
	lw $v0, -16($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $t3, 28($t2)
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	move $a0, $t1
	jalr $t3
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t2, $v0
	beqz $t2, Tree_RecPrint_L55
	lw $v0, -36($fp)
	move $t1, $v0
	lw $t2, 0($t1)
	lw $v1, 76($t2)
	sw $v1, -48($fp)
	lw $v0, -16($fp)
	move $t2, $v0
	lw $t0, 0($t2)
	lw $t3, 12($t0)
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	move $a0, $t2
	jalr $t3
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t0, $v0
	sw $t0, -88($fp)
	sw $t1, -92($fp)
	sw $t2, -96($fp)
	sw $t3, -100($fp)
	move $a0, $t1
	move $a1, $t0
	lw $v0, -48($fp)
	jalr $v0
	lw $t0, -88($fp)
	lw $t1, -92($fp)
	lw $t2, -96($fp)
	lw $t3, -100($fp)
	move $t2, $v0
	move $v1, $t2
	sw $v1, -44($fp)
	b Tree_RecPrint_L56
Tree_RecPrint_L55: 	li $t0, 1
	move $v1, $t0
	sw $v1, -44($fp)
Tree_RecPrint_L56: 	nop
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 100
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
