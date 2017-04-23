	.text
	.globl	MAIN

MAIN:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 36
	li $t0, 4
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -12($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	li $t0, 4
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	la $t0, LL_Start
	lw $v1, -16($fp)
	sw $t0, 0($v1)
	lw $v1, -24($fp)
	lw $v0, -16($fp)
	sw $v0, 0($v1)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -32($fp)
	sw $t0, -36($fp)
	lw $v0, -28($fp)
	move $a0, $v0
	lw $v0, -32($fp)
	jalr $v0
	lw $t0, -36($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 36
	jr $ra

	.text
	.globl	Element_Init

Element_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 28
	sw $a0, -12($fp)
	sw $a1, -16($fp)
	move $t0, $a2
	sw $a3, -20($fp)
	lw $v1, -12($fp)
	lw $v0, -16($fp)
	sw $v0, 4($v1)
	lw $v1, -12($fp)
	sw $t0, 8($v1)
	lw $v1, -12($fp)
	lw $v0, -20($fp)
	sw $v0, 12($v1)
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 28
	jr $ra

	.text
	.globl	Element_GetAge

Element_GetAge:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 24
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 4($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	Element_GetSalary

Element_GetSalary:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 24
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 8($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	Element_GetMarried

Element_GetMarried:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 24
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 12($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 24
	jr $ra

	.text
	.globl	Element_Equal

Element_Equal:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 108
	sw $a0, -16($fp)
	sw $a1, -12($fp)
	li $t0, 1
	move $v1, $t0
	sw $v1, -20($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	lw $t0, 0($v0)
	lw $v1, 4($t0)
	sw $v1, -28($fp)
	sw $t0, -108($fp)
	lw $v0, -24($fp)
	move $a0, $v0
	lw $v0, -28($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -32($fp)
	li $v1, 1
	sw $v1, -36($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	lw $t0, 0($v0)
	lw $v1, 20($t0)
	sw $v1, -44($fp)
	lw $v0, -16($fp)
	lw $t0, 4($v0)
	sw $t0, -108($fp)
	lw $v0, -40($fp)
	move $a0, $v0
	lw $v0, -32($fp)
	move $a1, $v0
	move $a2, $t0
	lw $v0, -44($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	lw $v0, -36($fp)
	lw $v1, -48($fp)
	sub $t0, $v0, $v1
	beqz $t0, Element_Equal_L2
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Element_Equal_L3
Element_Equal_L2: 	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	lw $t0, 0($v0)
	lw $v1, 8($t0)
	sw $v1, -56($fp)
	sw $t0, -108($fp)
	lw $v0, -52($fp)
	move $a0, $v0
	lw $v0, -56($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -60($fp)
	li $v1, 1
	sw $v1, -64($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	lw $v1, 20($t0)
	sw $v1, -72($fp)
	lw $v0, -16($fp)
	lw $t0, 8($v0)
	sw $t0, -108($fp)
	lw $v0, -68($fp)
	move $a0, $v0
	lw $v0, -60($fp)
	move $a1, $v0
	move $a2, $t0
	lw $v0, -72($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -64($fp)
	lw $v1, -76($fp)
	sub $t0, $v0, $v1
	beqz $t0, Element_Equal_L4
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Element_Equal_L5
Element_Equal_L4: 	lw $v0, -16($fp)
	lw $t0, 12($v0)
	beqz $t0, Element_Equal_L6
	li $v1, 1
	sw $v1, -80($fp)
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $t0, 0($v0)
	lw $v1, 12($t0)
	sw $v1, -88($fp)
	sw $t0, -108($fp)
	lw $v0, -84($fp)
	move $a0, $v0
	lw $v0, -88($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $t0, $v0
	lw $v0, -80($fp)
	sub $v1, $v0, $t0
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	beqz $v0, Element_Equal_L8
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Element_Equal_L9
Element_Equal_L8: 	li $t0, 0
	move $v1, $t0
	sw $v1, -96($fp)
Element_Equal_L9: 	nop
	b Element_Equal_L7
Element_Equal_L6: 	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	lw $t0, 0($v0)
	lw $v1, 12($t0)
	sw $v1, -104($fp)
	sw $t0, -108($fp)
	lw $v0, -100($fp)
	move $a0, $v0
	lw $v0, -104($fp)
	jalr $v0
	lw $t0, -108($fp)
	move $t0, $v0
	beqz $t0, Element_Equal_L10
	li $t0, 0
	move $v1, $t0
	sw $v1, -20($fp)
	b Element_Equal_L11
Element_Equal_L10: 	li $t0, 0
	move $v1, $t0
	sw $v1, -96($fp)
Element_Equal_L11: 	nop
Element_Equal_L7: 	nop
Element_Equal_L5: 	nop
Element_Equal_L3: 	nop
	lw $v0, -20($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 108
	jr $ra

	.text
	.globl	Element_Compare

Element_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 100
	sw $a0, -16($fp)
	sw $a1, -12($fp)
	sw $a2, -20($fp)
	li $t0, 0
	move $v1, $t0
	sw $v1, -24($fp)
	li $t0, 1
	lw $v0, -20($fp)
	add $v1, $v0, $t0
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	li $t0, 1
	lw $v0, -20($fp)
	sub $v1, $v0, $t0
	sw $v1, -36($fp)
	lw $v0, -12($fp)
	lw $v1, -36($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $v1
	addi $v0, $v0, 1
	beqz $t0, Element_Compare_L12
	li $t0, 0
	move $v1, $t0
	sw $v1, -24($fp)
	b Element_Compare_L13
Element_Compare_L12: 	li $v1, 1
	sw $v1, -40($fp)
	li $t0, 1
	lw $v0, -32($fp)
	sub $v1, $v0, $t0
	sw $v1, -44($fp)
	lw $v0, -12($fp)
	lw $v1, -44($fp)
	sub $v0, $v0, 1
	slt $t0, $v0, $v1
	addi $v0, $v0, 1
	lw $v0, -40($fp)
	sub $v1, $v0, $t0
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	beqz $v0, Element_Compare_L14
	li $v1, 0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	b Element_Compare_L15
Element_Compare_L14: 	li $t0, 1
	move $v1, $t0
	sw $v1, -24($fp)
Element_Compare_L15: 	nop
Element_Compare_L13: 	nop
	lw $v0, -24($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 100
	jr $ra

	.text
	.globl	List_Init

List_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 96
	sw $a0, -12($fp)
	li $v1, 1
	sw $v1, -28($fp)
	lw $v1, -12($fp)
	lw $v0, -28($fp)
	sw $v0, 12($v1)
	li $v1, 1
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 96
	jr $ra

	.text
	.globl	List_InitNew

List_InitNew:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 96
	sw $a0, -16($fp)
	sw $a1, -12($fp)
	sw $a2, -24($fp)
	sw $a3, -20($fp)
	lw $v1, -16($fp)
	lw $v0, -20($fp)
	sw $v0, 12($v1)
	lw $v1, -16($fp)
	lw $v0, -12($fp)
	sw $v0, 4($v1)
	lw $v1, -16($fp)
	lw $v0, -24($fp)
	sw $v0, 8($v1)
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 96
	jr $ra

	.text
	.globl	List_Insert

List_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 84
	sw $a0, -20($fp)
	sw $a1, -12($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	li $t0, 40
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -28($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	la $t0, List_Print
	lw $v1, -28($fp)
	sw $t0, 36($v1)
	la $t0, List_GetNext
	lw $v1, -28($fp)
	sw $t0, 32($v1)
	la $t0, List_GetElem
	lw $v1, -28($fp)
	sw $t0, 28($v1)
	la $t0, List_GetEnd
	lw $v1, -28($fp)
	sw $t0, 24($v1)
	la $t0, List_Search
	lw $v1, -28($fp)
	sw $t0, 20($v1)
	la $t0, List_Delete
	lw $v1, -28($fp)
	sw $t0, 16($v1)
	la $t0, List_SetNext
	lw $v1, -28($fp)
	sw $t0, 12($v1)
	la $t0, List_Insert
	lw $v1, -28($fp)
	sw $t0, 8($v1)
	la $t0, List_InitNew
	lw $v1, -28($fp)
	sw $t0, 4($v1)
	la $t0, List_Init
	lw $v1, -28($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -40($fp)
List_Insert_L16: 	li $t0, 15
	lw $v0, -40($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	beqz $v0, List_Insert_L17
	lw $v0, -36($fp)
	lw $v1, -40($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -40($fp)
	add $v1, $v0, $t0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	b List_Insert_L16
List_Insert_L17: 	lw $v1, -36($fp)
	lw $v0, -28($fp)
	sw $v0, 0($v1)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	move $v1, $v0
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	lw $t0, 0($v0)
	lw $v1, 4($t0)
	sw $v1, -64($fp)
	li $t0, 0
	sw $t0, -84($fp)
	lw $v0, -60($fp)
	move $a0, $v0
	lw $v0, -12($fp)
	move $a1, $v0
	lw $v0, -16($fp)
	move $a2, $v0
	move $a3, $t0
	lw $v0, -64($fp)
	jalr $v0
	lw $t0, -84($fp)
	move $v1, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	move $t0, $v0
	lw $v0, -56($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 84
	jr $ra

	.text
	.globl	List_SetNext

List_SetNext:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 76
	sw $a0, -24($fp)
	sw $a1, -12($fp)
	lw $v1, -24($fp)
	lw $v0, -12($fp)
	sw $v0, 8($v1)
	li $v1, 1
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 76
	jr $ra

	.text
	.globl	List_Delete

List_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 168
	sw $a0, -28($fp)
	sw $a1, -12($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -16($fp)
	li $v1, 0
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	li $t0, 0
	li $v1, 1
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	sub $v1, $t0, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -48($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -28($fp)
	lw $t0, 12($v0)
	move $v1, $t0
	sw $v1, -52($fp)
	lw $v0, -28($fp)
	lw $t0, 4($v0)
	move $v1, $t0
	sw $v1, -56($fp)
List_Delete_L18: 	li $t0, 0
	move $v1, $t0
	sw $v1, -60($fp)
	li $t0, 1
	lw $v0, -52($fp)
	sub $v1, $t0, $v0
	sw $v1, -64($fp)
	lw $v0, -64($fp)
	beqz $v0, List_Delete_L20
	li $t0, 1
	lw $v0, -24($fp)
	sub $v1, $t0, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	beqz $v0, List_Delete_L20
	li $t0, 1
	move $v1, $t0
	sw $v1, -60($fp)
List_Delete_L20: 	nop
	lw $v0, -60($fp)
	beqz $v0, List_Delete_L19
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -72($fp)
	lw $v0, -72($fp)
	lw $t0, 0($v0)
	lw $v1, 16($t0)
	sw $v1, -76($fp)
	sw $t0, -168($fp)
	lw $v0, -72($fp)
	move $a0, $v0
	lw $v0, -56($fp)
	move $a1, $v0
	lw $v0, -76($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	beqz $t0, List_Delete_L21
	li $t0, 1
	move $v1, $t0
	sw $v1, -24($fp)
	li $t0, 0
	move $v1, $t0
	sw $v1, -80($fp)
	li $t0, 1
	lw $v0, -80($fp)
	sub $v1, $v0, $t0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	move $t0, $v0
	lw $v0, -48($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -88($fp)
	lw $v0, -88($fp)
	beqz $v0, List_Delete_L23
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	lw $t0, 0($v0)
	lw $v1, 32($t0)
	sw $v1, -96($fp)
	sw $t0, -168($fp)
	lw $v0, -92($fp)
	move $a0, $v0
	lw $v0, -96($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -16($fp)
	b List_Delete_L24
List_Delete_L23: 	li $t0, 0
	li $v1, 555
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	sub $v1, $t0, $v0
	sw $v1, -104($fp)
	lw $v0, -104($fp)
	move $a0, $v0
	jal _print
	lw $v0, -44($fp)
	move $v1, $v0
	sw $v1, -108($fp)
	lw $v0, -108($fp)
	lw $t0, 0($v0)
	lw $v1, 12($t0)
	sw $v1, -112($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -116($fp)
	lw $v0, -116($fp)
	lw $t0, 0($v0)
	lw $v1, 32($t0)
	sw $v1, -120($fp)
	sw $t0, -168($fp)
	lw $v0, -116($fp)
	move $a0, $v0
	lw $v0, -120($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	sw $t0, -168($fp)
	lw $v0, -108($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -112($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $v1, $v0
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	move $t0, $v0
	li $t0, 0
	li $v1, 555
	sw $v1, -128($fp)
	lw $v0, -128($fp)
	sub $v1, $t0, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $a0, $v0
	jal _print
List_Delete_L24: 	nop
	b List_Delete_L22
List_Delete_L21: 	li $t0, 0
	move $v1, $t0
	sw $v1, -136($fp)
List_Delete_L22: 	nop
	li $t0, 1
	lw $v0, -24($fp)
	sub $v1, $t0, $v0
	sw $v1, -140($fp)
	lw $v0, -140($fp)
	beqz $v0, List_Delete_L25
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -144($fp)
	lw $v0, -144($fp)
	lw $t0, 0($v0)
	lw $v1, 32($t0)
	sw $v1, -148($fp)
	sw $t0, -168($fp)
	lw $v0, -144($fp)
	move $a0, $v0
	lw $v0, -148($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -152($fp)
	lw $v0, -152($fp)
	lw $t0, 0($v0)
	lw $v1, 24($t0)
	sw $v1, -156($fp)
	sw $t0, -168($fp)
	lw $v0, -152($fp)
	move $a0, $v0
	lw $v0, -156($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -52($fp)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -160($fp)
	lw $v0, -160($fp)
	lw $t0, 0($v0)
	lw $v1, 28($t0)
	sw $v1, -164($fp)
	sw $t0, -168($fp)
	lw $v0, -160($fp)
	move $a0, $v0
	lw $v0, -164($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -56($fp)
	li $t0, 1
	move $v1, $t0
	sw $v1, -48($fp)
	b List_Delete_L26
List_Delete_L25: 	li $t0, 0
	move $v1, $t0
	sw $v1, -136($fp)
List_Delete_L26: 	nop
	b List_Delete_L18
List_Delete_L19: 	nop
	lw $v0, -16($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 168
	jr $ra

	.text
	.globl	List_Search

List_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 160
	sw $a0, -28($fp)
	sw $a1, -12($fp)
	li $v1, 0
	sw $v1, -16($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -20($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -28($fp)
	lw $t0, 12($v0)
	move $v1, $t0
	sw $v1, -32($fp)
	lw $v0, -28($fp)
	lw $t0, 4($v0)
	move $v1, $t0
	sw $v1, -36($fp)
List_Search_L27: 	li $v1, 1
	sw $v1, -48($fp)
	lw $v0, -48($fp)
	lw $v1, -32($fp)
	sub $v1, $v0, $v1
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	beqz $v0, List_Search_L28
	lw $v0, -12($fp)
	move $v1, $v0
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $t0, 0($v0)
	lw $v1, 16($t0)
	sw $v1, -52($fp)
	sw $t0, -160($fp)
	lw $v0, -44($fp)
	move $a0, $v0
	lw $v0, -36($fp)
	move $a1, $v0
	lw $v0, -52($fp)
	jalr $v0
	lw $t0, -160($fp)
	move $t0, $v0
	beqz $t0, List_Search_L29
	li $t0, 1
	move $v1, $t0
	sw $v1, -20($fp)
	b List_Search_L30
List_Search_L29: 	li $t0, 0
	move $v1, $t0
	sw $v1, -56($fp)
List_Search_L30: 	nop
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	lw $t0, 0($v0)
	lw $v1, 32($t0)
	sw $v1, -64($fp)
	sw $t0, -160($fp)
	lw $v0, -60($fp)
	move $a0, $v0
	lw $v0, -64($fp)
	jalr $v0
	lw $t0, -160($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	lw $v1, 24($t0)
	sw $v1, -72($fp)
	sw $t0, -160($fp)
	lw $v0, -68($fp)
	move $a0, $v0
	lw $v0, -72($fp)
	jalr $v0
	lw $t0, -160($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -32($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $t0, 0($v0)
	lw $v1, 28($t0)
	sw $v1, -80($fp)
	sw $t0, -160($fp)
	lw $v0, -76($fp)
	move $a0, $v0
	lw $v0, -80($fp)
	jalr $v0
	lw $t0, -160($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -36($fp)
	b List_Search_L27
List_Search_L28: 	nop
	lw $v0, -20($fp)
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 160
	jr $ra

	.text
	.globl	List_GetEnd

List_GetEnd:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 156
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 12($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 156
	jr $ra

	.text
	.globl	List_GetElem

List_GetElem:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 156
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 4($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 156
	jr $ra

	.text
	.globl	List_GetNext

List_GetNext:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 156
	sw $a0, -12($fp)
	lw $v0, -12($fp)
	lw $t0, 8($v0)
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 156
	jr $ra

	.text
	.globl	List_Print

List_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 168
	sw $a0, -16($fp)
	lw $v0, -16($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -16($fp)
	lw $v1, 12($v0)
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -16($fp)
	lw $v1, 4($v0)
	sw $v1, -28($fp)
	lw $v0, -28($fp)
	move $v1, $v0
	sw $v1, -32($fp)
List_Print_L31: 	li $t0, 1
	lw $v0, -24($fp)
	sub $v1, $t0, $v0
	sw $v1, -40($fp)
	lw $v0, -40($fp)
	beqz $v0, List_Print_L32
	lw $v0, -32($fp)
	move $t0, $v0
	lw $v1, 0($t0)
	sw $v1, -44($fp)
	lw $v0, -44($fp)
	lw $v1, 4($v0)
	sw $v1, -48($fp)
	sw $t0, -168($fp)
	move $a0, $t0
	lw $v0, -48($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	lw $v0, -52($fp)
	move $a0, $v0
	jal _print
	lw $v0, -36($fp)
	move $t0, $v0
	lw $v1, 0($t0)
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	lw $v1, 32($v0)
	sw $v1, -60($fp)
	sw $t0, -168($fp)
	move $a0, $t0
	lw $v0, -60($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $v1, $v0
	sw $v1, -64($fp)
	lw $v0, -64($fp)
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	lw $v1, 24($t0)
	sw $v1, -72($fp)
	sw $t0, -168($fp)
	lw $v0, -68($fp)
	move $a0, $v0
	lw $v0, -72($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -24($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -76($fp)
	lw $t0, 0($v0)
	lw $v1, 28($t0)
	sw $v1, -80($fp)
	sw $t0, -168($fp)
	lw $v0, -76($fp)
	move $a0, $v0
	lw $v0, -80($fp)
	jalr $v0
	lw $t0, -168($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -32($fp)
	b List_Print_L31
List_Print_L32: 	nop
	li $t0, 1
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 168
	jr $ra

	.text
	.globl	LL_Start

LL_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	sw $ra, -4($fp)
	subu $sp, $sp, 484
	sw $a0, -16($fp)
	li $v1, 40
	sw $v1, -20($fp)
	lw $v0, -20($fp)
	move $a0, $v0
	jal _halloc
	move $v1, $v0
	sw $v1, -24($fp)
	lw $v0, -24($fp)
	move $v1, $v0
	sw $v1, -28($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -36($fp)
	lw $v0, -36($fp)
	move $v1, $v0
	sw $v1, -40($fp)
	la $t0, List_Print
	lw $v1, -28($fp)
	sw $t0, 36($v1)
	la $v1, List_GetNext
	sw $v1, -48($fp)
	lw $v1, -28($fp)
	lw $v0, -48($fp)
	sw $v0, 32($v1)
	la $v1, List_GetElem
	sw $v1, -44($fp)
	lw $v1, -28($fp)
	lw $v0, -44($fp)
	sw $v0, 28($v1)
	la $t0, List_GetEnd
	lw $v1, -28($fp)
	sw $t0, 24($v1)
	la $t0, List_Search
	lw $v1, -28($fp)
	sw $t0, 20($v1)
	la $t0, List_Delete
	lw $v1, -28($fp)
	sw $t0, 16($v1)
	la $t0, List_SetNext
	lw $v1, -28($fp)
	sw $t0, 12($v1)
	la $t0, List_Insert
	lw $v1, -28($fp)
	sw $t0, 8($v1)
	la $t0, List_InitNew
	lw $v1, -28($fp)
	sw $t0, 4($v1)
	la $t0, List_Init
	lw $v1, -28($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -52($fp)
LL_Start_L33: 	li $t0, 15
	lw $v0, -52($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -56($fp)
	lw $v0, -56($fp)
	beqz $v0, LL_Start_L34
	lw $v0, -40($fp)
	lw $v1, -52($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -60($fp)
	lw $v0, -60($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -52($fp)
	add $v1, $v0, $t0
	sw $v1, -64($fp)
	lw $v0, -64($fp)
	move $v1, $v0
	sw $v1, -52($fp)
	b LL_Start_L33
LL_Start_L34: 	lw $v1, -40($fp)
	lw $v0, -28($fp)
	sw $v0, 0($v1)
	lw $v0, -40($fp)
	move $v1, $v0
	sw $v1, -32($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -68($fp)
	lw $v0, -68($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -72($fp)
	sw $t0, -484($fp)
	lw $v0, -68($fp)
	move $a0, $v0
	lw $v0, -72($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	lw $v0, -32($fp)
	move $v1, $v0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -84($fp)
	lw $v0, -84($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -88($fp)
	sw $t0, -484($fp)
	lw $v0, -84($fp)
	move $a0, $v0
	lw $v0, -88($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -92($fp)
	lw $v0, -92($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -96($fp)
	sw $t0, -484($fp)
	lw $v0, -92($fp)
	move $a0, $v0
	lw $v0, -96($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 24
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -100($fp)
	lw $v0, -100($fp)
	move $v1, $v0
	sw $v1, -104($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -108($fp)
	lw $v0, -108($fp)
	move $v1, $v0
	sw $v1, -112($fp)
	la $t0, Element_Compare
	lw $v1, -104($fp)
	sw $t0, 20($v1)
	la $t0, Element_Equal
	lw $v1, -104($fp)
	sw $t0, 16($v1)
	la $t0, Element_GetMarried
	lw $v1, -104($fp)
	sw $t0, 12($v1)
	la $t0, Element_GetSalary
	lw $v1, -104($fp)
	sw $t0, 8($v1)
	la $t0, Element_GetAge
	lw $v1, -104($fp)
	sw $t0, 4($v1)
	la $t0, Element_Init
	lw $v1, -104($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -116($fp)
LL_Start_L35: 	li $t0, 15
	lw $v0, -116($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -120($fp)
	lw $v0, -120($fp)
	beqz $v0, LL_Start_L36
	lw $v0, -112($fp)
	lw $v1, -116($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -124($fp)
	lw $v0, -124($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -116($fp)
	add $v1, $v0, $t0
	sw $v1, -128($fp)
	lw $v0, -128($fp)
	move $v1, $v0
	sw $v1, -116($fp)
	b LL_Start_L35
LL_Start_L36: 	lw $v1, -112($fp)
	lw $v0, -104($fp)
	sw $v0, 0($v1)
	lw $v0, -112($fp)
	move $v1, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -136($fp)
	lw $v0, -136($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -140($fp)
	li $t0, 25
	li $v1, 37000
	sw $v1, -144($fp)
	li $v1, 0
	sw $v1, -148($fp)
	sw $t0, -484($fp)
	lw $v0, -136($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -144($fp)
	move $a2, $v0
	lw $v0, -148($fp)
	move $a3, $v0
	lw $v0, -140($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $v1, $v0
	sw $v1, -152($fp)
	lw $v0, -152($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -156($fp)
	lw $v0, -156($fp)
	lw $t0, 0($v0)
	lw $v1, 8($t0)
	sw $v1, -160($fp)
	sw $t0, -484($fp)
	lw $v0, -156($fp)
	move $a0, $v0
	lw $v0, -132($fp)
	move $a1, $v0
	lw $v0, -160($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -164($fp)
	lw $v0, -164($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -168($fp)
	sw $t0, -484($fp)
	lw $v0, -164($fp)
	move $a0, $v0
	lw $v0, -168($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 10000000
	move $a0, $t0
	jal _print
	li $t0, 24
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -172($fp)
	lw $v0, -172($fp)
	move $v1, $v0
	sw $v1, -176($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -180($fp)
	lw $v0, -180($fp)
	move $v1, $v0
	sw $v1, -184($fp)
	la $t0, Element_Compare
	lw $v1, -176($fp)
	sw $t0, 20($v1)
	la $t0, Element_Equal
	lw $v1, -176($fp)
	sw $t0, 16($v1)
	la $t0, Element_GetMarried
	lw $v1, -176($fp)
	sw $t0, 12($v1)
	la $t0, Element_GetSalary
	lw $v1, -176($fp)
	sw $t0, 8($v1)
	la $t0, Element_GetAge
	lw $v1, -176($fp)
	sw $t0, 4($v1)
	la $t0, Element_Init
	lw $v1, -176($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -188($fp)
LL_Start_L37: 	li $t0, 15
	lw $v0, -188($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -192($fp)
	lw $v0, -192($fp)
	beqz $v0, LL_Start_L38
	lw $v0, -184($fp)
	lw $v1, -188($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -196($fp)
	lw $v0, -196($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -188($fp)
	add $v1, $v0, $t0
	sw $v1, -200($fp)
	lw $v0, -200($fp)
	move $v1, $v0
	sw $v1, -188($fp)
	b LL_Start_L37
LL_Start_L38: 	lw $v1, -184($fp)
	lw $v0, -176($fp)
	sw $v0, 0($v1)
	lw $v0, -184($fp)
	move $v1, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -204($fp)
	lw $v0, -204($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -208($fp)
	li $t0, 39
	li $v1, 42000
	sw $v1, -212($fp)
	li $v1, 1
	sw $v1, -216($fp)
	sw $t0, -484($fp)
	lw $v0, -204($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -212($fp)
	move $a2, $v0
	lw $v0, -216($fp)
	move $a3, $v0
	lw $v0, -208($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $v1, $v0
	sw $v1, -220($fp)
	lw $v0, -220($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -224($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -228($fp)
	lw $v0, -228($fp)
	lw $t0, 0($v0)
	lw $v1, 8($t0)
	sw $v1, -232($fp)
	sw $t0, -484($fp)
	lw $v0, -228($fp)
	move $a0, $v0
	lw $v0, -132($fp)
	move $a1, $v0
	lw $v0, -232($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -236($fp)
	lw $v0, -236($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -240($fp)
	sw $t0, -484($fp)
	lw $v0, -236($fp)
	move $a0, $v0
	lw $v0, -240($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 10000000
	move $a0, $t0
	jal _print
	li $t0, 24
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -244($fp)
	lw $v0, -244($fp)
	move $v1, $v0
	sw $v1, -248($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -252($fp)
	lw $v0, -252($fp)
	move $v1, $v0
	sw $v1, -256($fp)
	la $t0, Element_Compare
	lw $v1, -248($fp)
	sw $t0, 20($v1)
	la $t0, Element_Equal
	lw $v1, -248($fp)
	sw $t0, 16($v1)
	la $t0, Element_GetMarried
	lw $v1, -248($fp)
	sw $t0, 12($v1)
	la $t0, Element_GetSalary
	lw $v1, -248($fp)
	sw $t0, 8($v1)
	la $t0, Element_GetAge
	lw $v1, -248($fp)
	sw $t0, 4($v1)
	la $t0, Element_Init
	lw $v1, -248($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -260($fp)
LL_Start_L39: 	li $t0, 15
	lw $v0, -260($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -264($fp)
	lw $v0, -264($fp)
	beqz $v0, LL_Start_L40
	lw $v0, -256($fp)
	lw $v1, -260($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -268($fp)
	lw $v0, -268($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -260($fp)
	add $v1, $v0, $t0
	sw $v1, -272($fp)
	lw $v0, -272($fp)
	move $v1, $v0
	sw $v1, -260($fp)
	b LL_Start_L39
LL_Start_L40: 	lw $v1, -256($fp)
	lw $v0, -248($fp)
	sw $v0, 0($v1)
	lw $v0, -256($fp)
	move $v1, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -276($fp)
	lw $v0, -276($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -280($fp)
	li $t0, 22
	li $v1, 34000
	sw $v1, -284($fp)
	li $v1, 0
	sw $v1, -288($fp)
	sw $t0, -484($fp)
	lw $v0, -276($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -284($fp)
	move $a2, $v0
	lw $v0, -288($fp)
	move $a3, $v0
	lw $v0, -280($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $v1, $v0
	sw $v1, -292($fp)
	lw $v0, -292($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -296($fp)
	lw $v0, -296($fp)
	lw $t0, 0($v0)
	lw $v1, 8($t0)
	sw $v1, -300($fp)
	sw $t0, -484($fp)
	lw $v0, -296($fp)
	move $a0, $v0
	lw $v0, -132($fp)
	move $a1, $v0
	lw $v0, -300($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -304($fp)
	lw $v0, -304($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -308($fp)
	sw $t0, -484($fp)
	lw $v0, -304($fp)
	move $a0, $v0
	lw $v0, -308($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 24
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -312($fp)
	lw $v0, -312($fp)
	move $v1, $v0
	sw $v1, -316($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -320($fp)
	lw $v0, -320($fp)
	move $v1, $v0
	sw $v1, -324($fp)
	la $t0, Element_Compare
	lw $v1, -316($fp)
	sw $t0, 20($v1)
	la $t0, Element_Equal
	lw $v1, -316($fp)
	sw $t0, 16($v1)
	la $t0, Element_GetMarried
	lw $v1, -316($fp)
	sw $t0, 12($v1)
	la $t0, Element_GetSalary
	lw $v1, -316($fp)
	sw $t0, 8($v1)
	la $t0, Element_GetAge
	lw $v1, -316($fp)
	sw $t0, 4($v1)
	la $t0, Element_Init
	lw $v1, -316($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -328($fp)
LL_Start_L41: 	li $t0, 15
	lw $v0, -328($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -332($fp)
	lw $v0, -332($fp)
	beqz $v0, LL_Start_L42
	lw $v0, -324($fp)
	lw $v1, -328($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -336($fp)
	lw $v0, -336($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -328($fp)
	add $v1, $v0, $t0
	sw $v1, -340($fp)
	lw $v0, -340($fp)
	move $v1, $v0
	sw $v1, -328($fp)
	b LL_Start_L41
LL_Start_L42: 	lw $v1, -324($fp)
	lw $v0, -316($fp)
	sw $v0, 0($v1)
	lw $v0, -324($fp)
	move $v1, $v0
	sw $v1, -344($fp)
	lw $v0, -344($fp)
	move $v1, $v0
	sw $v1, -348($fp)
	lw $v0, -348($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -352($fp)
	li $t0, 27
	li $v1, 34000
	sw $v1, -356($fp)
	li $v1, 0
	sw $v1, -360($fp)
	sw $t0, -484($fp)
	lw $v0, -348($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -356($fp)
	move $a2, $v0
	lw $v0, -360($fp)
	move $a3, $v0
	lw $v0, -352($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $v1, $v0
	sw $v1, -364($fp)
	lw $v0, -364($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -368($fp)
	lw $v0, -368($fp)
	lw $t0, 0($v0)
	lw $v1, 20($t0)
	sw $v1, -372($fp)
	sw $t0, -484($fp)
	lw $v0, -368($fp)
	move $a0, $v0
	lw $v0, -224($fp)
	move $a1, $v0
	lw $v0, -372($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -376($fp)
	lw $v0, -376($fp)
	lw $t0, 0($v0)
	lw $v1, 20($t0)
	sw $v1, -380($fp)
	sw $t0, -484($fp)
	lw $v0, -376($fp)
	move $a0, $v0
	lw $v0, -344($fp)
	move $a1, $v0
	lw $v0, -380($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $a0, $t0
	jal _print
	li $t0, 10000000
	move $a0, $t0
	jal _print
	li $t0, 24
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -384($fp)
	lw $v0, -384($fp)
	move $v1, $v0
	sw $v1, -388($fp)
	li $t0, 16
	move $a0, $t0
	jal _halloc
	move $v1, $v0
	sw $v1, -392($fp)
	lw $v0, -392($fp)
	move $v1, $v0
	sw $v1, -396($fp)
	la $t0, Element_Compare
	lw $v1, -388($fp)
	sw $t0, 20($v1)
	la $t0, Element_Equal
	lw $v1, -388($fp)
	sw $t0, 16($v1)
	la $t0, Element_GetMarried
	lw $v1, -388($fp)
	sw $t0, 12($v1)
	la $t0, Element_GetSalary
	lw $v1, -388($fp)
	sw $t0, 8($v1)
	la $t0, Element_GetAge
	lw $v1, -388($fp)
	sw $t0, 4($v1)
	la $t0, Element_Init
	lw $v1, -388($fp)
	sw $t0, 0($v1)
	li $t0, 4
	move $v1, $t0
	sw $v1, -400($fp)
LL_Start_L43: 	li $t0, 15
	lw $v0, -400($fp)
	sub $v0, $v0, 1
	slt $v1, $v0, $t0
	addi $v0, $v0, 1
	sw $v1, -404($fp)
	lw $v0, -404($fp)
	beqz $v0, LL_Start_L44
	lw $v0, -396($fp)
	lw $v1, -400($fp)
	add $t0, $v0, $v1
	li $v1, 0
	sw $v1, -408($fp)
	lw $v0, -408($fp)
	sw $v0, 0($t0)
	li $t0, 4
	lw $v0, -400($fp)
	add $v1, $v0, $t0
	sw $v1, -412($fp)
	lw $v0, -412($fp)
	move $v1, $v0
	sw $v1, -400($fp)
	b LL_Start_L43
LL_Start_L44: 	lw $v1, -396($fp)
	lw $v0, -388($fp)
	sw $v0, 0($v1)
	lw $v0, -396($fp)
	move $v1, $v0
	sw $v1, -132($fp)
	lw $v0, -132($fp)
	move $v1, $v0
	sw $v1, -416($fp)
	lw $v0, -416($fp)
	lw $t0, 0($v0)
	lw $v1, 0($t0)
	sw $v1, -420($fp)
	li $t0, 28
	li $v1, 35000
	sw $v1, -424($fp)
	li $v1, 0
	sw $v1, -428($fp)
	sw $t0, -484($fp)
	lw $v0, -416($fp)
	move $a0, $v0
	move $a1, $t0
	lw $v0, -424($fp)
	move $a2, $v0
	lw $v0, -428($fp)
	move $a3, $v0
	lw $v0, -420($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $v1, $v0
	sw $v1, -432($fp)
	lw $v0, -432($fp)
	move $v1, $v0
	sw $v1, -76($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -436($fp)
	lw $v0, -436($fp)
	lw $t0, 0($v0)
	lw $v1, 8($t0)
	sw $v1, -440($fp)
	sw $t0, -484($fp)
	lw $v0, -436($fp)
	move $a0, $v0
	lw $v0, -132($fp)
	move $a1, $v0
	lw $v0, -440($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -444($fp)
	lw $v0, -444($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -448($fp)
	sw $t0, -484($fp)
	lw $v0, -444($fp)
	move $a0, $v0
	lw $v0, -448($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 2220000
	move $a0, $t0
	jal _print
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -452($fp)
	lw $v0, -452($fp)
	lw $t0, 0($v0)
	lw $v1, 16($t0)
	sw $v1, -456($fp)
	sw $t0, -484($fp)
	lw $v0, -452($fp)
	move $a0, $v0
	lw $v0, -224($fp)
	move $a1, $v0
	lw $v0, -456($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -460($fp)
	lw $v0, -460($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -464($fp)
	sw $t0, -484($fp)
	lw $v0, -460($fp)
	move $a0, $v0
	lw $v0, -464($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 33300000
	move $a0, $t0
	jal _print
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -468($fp)
	lw $v0, -468($fp)
	lw $t0, 0($v0)
	lw $v1, 16($t0)
	sw $v1, -472($fp)
	sw $t0, -484($fp)
	lw $v0, -468($fp)
	move $a0, $v0
	lw $v0, -132($fp)
	move $a1, $v0
	lw $v0, -472($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -80($fp)
	lw $v0, -80($fp)
	move $v1, $v0
	sw $v1, -476($fp)
	lw $v0, -476($fp)
	lw $t0, 0($v0)
	lw $v1, 36($t0)
	sw $v1, -480($fp)
	sw $t0, -484($fp)
	lw $v0, -476($fp)
	move $a0, $v0
	lw $v0, -480($fp)
	jalr $v0
	lw $t0, -484($fp)
	move $t0, $v0
	move $v1, $t0
	sw $v1, -76($fp)
	li $t0, 44440000
	move $a0, $t0
	jal _print
	li $t0, 0
	move $v0, $t0
	lw $ra, -4($fp)
	lw $fp, -8($fp)
	addu $sp, $sp, 484
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
